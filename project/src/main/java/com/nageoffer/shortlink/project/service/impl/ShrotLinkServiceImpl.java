package com.nageoffer.shortlink.project.service.impl;

import cn.hutool.core.bean.BeanUtil;
import cn.hutool.core.collection.CollUtil;
import cn.hutool.core.date.DateUtil;
import cn.hutool.core.date.Week;
import cn.hutool.core.lang.UUID;
import cn.hutool.core.util.ArrayUtil;
import cn.hutool.core.util.StrUtil;
import cn.hutool.http.HttpUtil;
import com.alibaba.fastjson2.JSON;
import com.alibaba.fastjson2.JSONObject;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.conditions.update.LambdaUpdateWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.nageoffer.shortlink.project.common.convention.exception.ClientException;
import com.nageoffer.shortlink.project.common.convention.exception.ServiceException;
import com.nageoffer.shortlink.project.common.database.BaseDO;
import com.nageoffer.shortlink.project.common.enums.ValiDateTypeEnum;
import com.nageoffer.shortlink.project.config.GotoDomainWhiteListConfiguration;
import com.nageoffer.shortlink.project.config.RBloomFilterConfiguration;
import com.nageoffer.shortlink.project.dao.entity.*;
import com.nageoffer.shortlink.project.dao.mapper.*;
import com.nageoffer.shortlink.project.dto.biz.ShortLinkStatsRecordDTO;
import com.nageoffer.shortlink.project.dto.req.ShortLinkBatchCreateReqDTO;
import com.nageoffer.shortlink.project.dto.req.ShortLinkCreateReqDTO;
import com.nageoffer.shortlink.project.dto.req.ShortLinkPageReqDTO;
import com.nageoffer.shortlink.project.dto.req.ShortLinkUpdateReqDTO;
import com.nageoffer.shortlink.project.dto.resp.*;
import com.nageoffer.shortlink.project.mq.producer.DelayShortLinkStatsProducer;
import com.nageoffer.shortlink.project.service.LinkStatsTodayService;
import com.nageoffer.shortlink.project.service.ShortLinkService;
import com.nageoffer.shortlink.project.toolkit.HashUtil;
import com.nageoffer.shortlink.project.toolkit.LinkUtil;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import lombok.RequiredArgsConstructor;
import lombok.SneakyThrows;
import lombok.extern.slf4j.Slf4j;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.redisson.api.RBloomFilter;
import org.redisson.api.RLock;
import org.redisson.api.RReadWriteLock;
import org.redisson.api.RedissonClient;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.client.RestTemplate;

import java.net.HttpURLConnection;
import java.net.URL;
import java.time.Duration;
import java.time.LocalDate;
import java.time.LocalTime;
import java.time.ZoneId;
import java.time.format.DateTimeFormatter;
import java.util.*;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.atomic.AtomicBoolean;
import java.util.concurrent.atomic.AtomicReference;

import static com.nageoffer.shortlink.project.common.constant.RedisCacheConstant.*;
import static com.nageoffer.shortlink.project.common.constant.ShortLinkConstant.AMAP_REMOTE_URL;

@Service
@Slf4j
@RequiredArgsConstructor
public class ShrotLinkServiceImpl extends ServiceImpl<ShortLinkMapper, ShortLinkDO> implements ShortLinkService {

    private final RBloomFilter<String> shortUriCreateCachePenetrationBloomFilter;
    private final ShortLinkGoToMapper shortLinkGoToMapper;
    private final StringRedisTemplate stringRedisTemplate;
    private final RedissonClient redissonClient;
    private final LinkAccessStatsMapper linkAccessStatsMapper;
    private final LinkLocaleStatsMapper linkLocaleStatsMapper;
    private final LinkOsStatsMapper linkOsStatsMapper;
    private final LinkBrowserStatsMapper linkBrowserStatsMapper;
    private final LinkAccessLogsMapper linkAccessLogsMapper;
    private final LinkDeviceStatsMapper linkDeviceStatsMapper;
    private final LinkNetworkStatsMapper linkNetworkStatsMapper;
    private final LinkStatsTodayMapper linkStatsTodayMapper;
    private final LinkStatsTodayService linkStatsTodayService;
    private final DelayShortLinkStatsProducer delayShortLinkStatsProducer;
    private final GotoDomainWhiteListConfiguration gotoDomainWhiteListConfiguration;

    @Value("${spring.short-link.stats.locale.amap-key}")
    private String amapKey;

    @Value("${spring.short-link.domain.default}")
    private String createShortLinkDefaultDomain;

    /**
     * 短链接跳转处理
     * @param shortUri
     * @param request
     * @param response
     */
    @SneakyThrows
    @Override
    public void restoreUrl(String shortUri, HttpServletRequest request, HttpServletResponse response) {
        String serverName = request.getServerName(); // 这里拿到的是域名
        String serverPort = Optional.of(request.getServerPort())
                .filter(each -> !Objects.equals(each,80))
                .map(String::valueOf)
                .map(each -> ":" + each)
                .orElse("");
        String fullShortUrl = serverName + serverPort + "/" + shortUri;
        String originalLink = stringRedisTemplate.opsForValue().get(String.format(GOTO_SHORT_LINK_KEY, fullShortUrl));// 进redis获取短链接对应的原始链接
        if (StrUtil.isNotBlank(originalLink)) { // redis缓存中有对应的原始链接的话直接重定向
            ShortLinkStatsRecordDTO statsRecord = buildShortLinkStatsRecordAndSetUser(fullShortUrl, request, response);
            shortLinkStats(fullShortUrl,null,statsRecord);
            response.sendRedirect(originalLink);
            return;
        }
        boolean contains = shortUriCreateCachePenetrationBloomFilter.contains(fullShortUrl);
        if (!contains){ // 如果布隆过滤器中不存在，则直接返回
            response.sendRedirect("/page/notfound");
            return;
        }
        String gotoIsNullShortLink = stringRedisTemplate.opsForValue().get(String.format(GOTO_IS_NULL_SHORT_LINK_KEY, fullShortUrl));
        if (StrUtil.isNotBlank(gotoIsNullShortLink)){ // redis缓存中GOTO_IS_NULL_SHORT_LINK_KEY对应的值是"-"，说明数据库内没有相应的full_short_url，用来防止布隆过滤器出现误判的情况
            response.sendRedirect("/page/notfound");
            return;
        }

        // 避免短链接跳转原始链接时存在的缓存击穿问题
        RLock lock = redissonClient.getLock(String.format(LOCK_GOTO_SHORT_LINK_KEY, fullShortUrl)); // 分布式锁
        lock.lock();
        try {
            originalLink = stringRedisTemplate.opsForValue().get(String.format(GOTO_SHORT_LINK_KEY, fullShortUrl));
            if (StrUtil.isNotBlank(originalLink)) {
                ShortLinkStatsRecordDTO statsRecord = buildShortLinkStatsRecordAndSetUser(fullShortUrl, request, response);
                shortLinkStats(fullShortUrl,null,statsRecord);
                response.sendRedirect(originalLink);
                return;
            }
            LambdaQueryWrapper<ShortLinkGoToDO> linkGotoQueryWrapper = Wrappers.lambdaQuery(ShortLinkGoToDO.class)
                    .eq(ShortLinkGoToDO::getFullShortUrl, fullShortUrl);
            ShortLinkGoToDO shortLinkGoToDO = shortLinkGoToMapper.selectOne(linkGotoQueryWrapper);
            if (shortLinkGoToDO == null) {
                // 数据库内没有相应的full_short_url
                stringRedisTemplate.opsForValue().set(String.format(GOTO_IS_NULL_SHORT_LINK_KEY, fullShortUrl),"-",30, TimeUnit.SECONDS);
                response.sendRedirect("/page/notfound");
                return;
            }
            LambdaQueryWrapper<ShortLinkDO> queryWrapper = Wrappers.lambdaQuery(ShortLinkDO.class)
                    .eq(ShortLinkDO::getGid, shortLinkGoToDO.getGid())
                    .eq(ShortLinkDO::getFullShortUrl, fullShortUrl)
                    .eq(ShortLinkDO::getEnableStatus, 0)
                    .eq(ShortLinkDO::getDel_flag, 0);
            ShortLinkDO shortLinkDO = this.baseMapper.selectOne(queryWrapper);
            if (shortLinkDO == null || (shortLinkDO.getValidDate() != null && shortLinkDO.getValidDate().before(new Date()))){
                stringRedisTemplate.opsForValue().set(String.format(GOTO_IS_NULL_SHORT_LINK_KEY, fullShortUrl),"-",30, TimeUnit.SECONDS);
                response.sendRedirect("/page/notfound");
                return;
            }
            // 用户访问后在redis内为对应的full_short_url添加相应的原始链接
            stringRedisTemplate.opsForValue().set(
                            String.format(GOTO_SHORT_LINK_KEY, fullShortUrl),
                            shortLinkDO.getOriginUrl(),
                            LinkUtil.getLinkCacheValidDate(shortLinkDO.getValidDate()),
                            TimeUnit.MILLISECONDS);
            ShortLinkStatsRecordDTO statsRecord = buildShortLinkStatsRecordAndSetUser(fullShortUrl, request, response);
            shortLinkStats(fullShortUrl,shortLinkDO.getGid(),statsRecord);
            response.sendRedirect(shortLinkDO.getOriginUrl());

        } finally {
            lock.unlock();
        }
    }

    /**
     * 短链接统计信息前的预处理
     * @param fullShortUrl
     * @param request
     * @param response
     * @return
     */
    private ShortLinkStatsRecordDTO buildShortLinkStatsRecordAndSetUser(String fullShortUrl,HttpServletRequest request, HttpServletResponse response){
        AtomicBoolean uvFirstFlag = new AtomicBoolean(); // 用于多线程环境中，以原子方式更新一个布尔值，确保线程安全。用来统计短链接访问累计数据
        AtomicBoolean uvTodayFirstFlag = new AtomicBoolean();
        // 获取当前日期
        LocalDate currentDate = LocalDate.now(ZoneId.of("GMT+8"));
        // 指定日期格式
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
        // 格式化日期
        String today = currentDate.format(formatter);
        // 获取当前时间
        LocalTime currentTime = LocalTime.now();
        // 获取晚上24点的时间
        LocalTime midnight = LocalTime.of(23, 59, 59);
        // 计算剩余秒数
        Duration remainingTime = Duration.between(currentTime, midnight);
        // 获取剩余秒数
        long remainingSeconds = remainingTime.getSeconds();
        Cookie[] cookies = request.getCookies();
        AtomicReference<String> uv = new AtomicReference<>();
        Runnable addResponseCookieTask = () -> {
            String actualUv = UUID.fastUUID().toString();
            uv.set(actualUv); // 存放用户标识
            Cookie uvCookie = new Cookie("uv", uv.get());
            uvCookie.setMaxAge(60 * 60 * 24 * 30);
            uvCookie.setPath(StrUtil.sub(fullShortUrl,fullShortUrl.indexOf("/"),fullShortUrl.length()));
            response.addCookie(uvCookie);
            uvFirstFlag.set(Boolean.TRUE);
            uvTodayFirstFlag.set(Boolean.TRUE);
            stringRedisTemplate.opsForSet().add("short-link:stats:uv:" + fullShortUrl, uv.get());
            stringRedisTemplate.opsForSet().add("short-link:stats:todayUv:" + today + ":" + fullShortUrl, uv.get());
            stringRedisTemplate.expire("short-link:stats:todayUv:" + today + ":" + fullShortUrl, remainingSeconds, TimeUnit.SECONDS);
        };
        if (ArrayUtil.isNotEmpty(cookies)){
            Arrays.stream(cookies)
                    .filter(each -> Objects.equals(each.getName(),"uv"))
                    .findFirst()
                    .map(Cookie::getValue)
                    .ifPresentOrElse(each ->{
                        uv.set(each);
                        Long uvAdded = stringRedisTemplate.opsForSet().add("short-link:stats:uv:" + fullShortUrl, each);
                        Long todayUvAdded = stringRedisTemplate.opsForSet().add("short-link:stats:todayUv:" + today + ":" + fullShortUrl, each);
                        stringRedisTemplate.expire("short-link:stats:todayUv:" + today + ":" + fullShortUrl, remainingSeconds, TimeUnit.SECONDS);
                        uvFirstFlag.set(uvAdded != null && uvAdded > 0L);
                        uvTodayFirstFlag.set(todayUvAdded != null && todayUvAdded > 0L);
                    },addResponseCookieTask);
        }
        else {
            addResponseCookieTask.run();
        }
        String remoteAddr = LinkUtil.getUserIp(request);
        // 用户访问操作系统信息
        String userOS = LinkUtil.detectUserOS(request);
        // 用户访问浏览器信息
        String userBrowser = LinkUtil.getBrowser(request);
        // 用户访问设备
        String userDevice = LinkUtil.getDevice(request);
        // 用户访问网络情况
        String userNetwork = LinkUtil.getNetwork(request);
        Long uipAdded = stringRedisTemplate.opsForSet().add("short-link:stats:uip:" + fullShortUrl, remoteAddr);
        boolean uipFirstFlag = uipAdded != null && uipAdded > 0L;
        Long todayUipAdded = stringRedisTemplate.opsForSet().add("short-link:stats:todayUip:" + today + ":"  + fullShortUrl, remoteAddr);
        stringRedisTemplate.expire("short-link:stats:todayUip:" + today + ":"  + fullShortUrl, remainingSeconds, TimeUnit.SECONDS);
        boolean uipTodayFirstFlag = todayUipAdded != null && todayUipAdded > 0L;
        return ShortLinkStatsRecordDTO.builder()
                .remoteAddr(remoteAddr)
                .browser(userBrowser)
                .device(userDevice)
                .os(userOS)
                .uv(uv.get())
                .fullShortUrl(fullShortUrl)
                .network(userNetwork)
                .uvFirstFlag(uvFirstFlag.get())
                .uipFirstFlag(uipFirstFlag)
                .uvTodayFirstFlag(uvTodayFirstFlag.get())
                .uipTodayFirstFlag(uipTodayFirstFlag)
                .build();
    }

    /**
     * 短链接信息统计
     * @param fullShortUrl
     * @param gid
     * @param statsRecord
     */
    @Override
    public void shortLinkStats(String fullShortUrl, String gid, ShortLinkStatsRecordDTO statsRecord) {
        fullShortUrl = Optional.ofNullable(fullShortUrl).orElse(statsRecord.getFullShortUrl());
        RReadWriteLock readWriteLock = redissonClient.getReadWriteLock(String.format(LOCK_GID_UPDATE_KEY, fullShortUrl));
        RLock rLock = readWriteLock.readLock();
        if (!rLock.tryLock()){
            delayShortLinkStatsProducer.send(statsRecord);
            return;
        }
        try {
            if (StrUtil.isBlank(gid)) {
                LambdaQueryWrapper<ShortLinkGoToDO> queryWrapper = Wrappers.lambdaQuery(ShortLinkGoToDO.class)
                        .eq(ShortLinkGoToDO::getFullShortUrl, fullShortUrl);
                ShortLinkGoToDO shortLinkGoToDO = shortLinkGoToMapper.selectOne(queryWrapper);
                gid = shortLinkGoToDO.getGid();
            }
            int hour = DateUtil.hour(new Date(), true);
            Week week = DateUtil.dayOfWeekEnum(new Date());
            int weekValue = week.getIso8601Value();
            int newPv;
            int newUv;
            int newUip;
            LinkAccessStatsDO linkAccessStatsDO = LinkAccessStatsDO.builder()
                    .pv(newPv = 1)
                    .uv(newUv = statsRecord.getUvFirstFlag() ? 1 : 0)
                    .weekday(weekValue)
                    .fullShortUrl(fullShortUrl)
                    .gid(gid)
                    .date(new Date())
                    .hour(hour)
                    .uip(newUip = statsRecord.getUipFirstFlag() ? 1 : 0)
                    .build();
            linkAccessStatsMapper.shortLinkStats(linkAccessStatsDO);
            Map<String, Object> localeParamMap = new HashMap<>();
            localeParamMap.put("key", amapKey);
            localeParamMap.put("ip", statsRecord.getRemoteAddr());
            String IpResults = HttpUtil.get(AMAP_REMOTE_URL, localeParamMap);
            JSONObject localeResultObj = JSON.parseObject(IpResults);
            String infocode = localeResultObj.getString("infocode");
            String actualCity = "未知";
            String actualProvince = "未知";
            if (StrUtil.isNotBlank(infocode) && StrUtil.equals(infocode, "10000")) {
                // 用户访问IP信息
                String province = localeResultObj.getString("province");
                boolean unkownFlag = StrUtil.equals(province, "[]");
                LinkLocaleStatsDO linkLocaleStatsDO = LinkLocaleStatsDO.builder()
                        .province(actualProvince = unkownFlag ? actualProvince : province)
                        .city(actualCity = unkownFlag ? actualCity : localeResultObj.getString("city"))
                        .adcode(unkownFlag ? "未知" : localeResultObj.getString("adcode"))
                        .cnt(1)
                        .fullShortUrl(fullShortUrl)
                        .country("中国")
                        .gid(gid)
                        .date(new Date())
                        .build();
                linkLocaleStatsMapper.shortLinkLocaleState(linkLocaleStatsDO);
            }
            // 用户访问操作系统信息
            LinkOsStatsDO linkOsStatsDO = LinkOsStatsDO.builder()
                    .os(statsRecord.getOs())
                    .cnt(1)
                    .gid(gid)
                    .fullShortUrl(fullShortUrl)
                    .date(new Date())
                    .build();
            linkOsStatsMapper.shortLinkOsState(linkOsStatsDO);
            // 用户访问浏览器信息
            LinkBrowserStatsDO browserStatsDO = LinkBrowserStatsDO.builder()
                    .browser(statsRecord.getBrowser())
                    .cnt(1)
                    .gid(gid)
                    .fullShortUrl(fullShortUrl)
                    .date(new Date())
                    .build();
            linkBrowserStatsMapper.shortLinkBrowserState(browserStatsDO);
            // 用户访问设备
            LinkDeviceStatsDO linkDeviceStatsDO = LinkDeviceStatsDO.builder()
                    .device(statsRecord.getDevice())
                    .cnt(1)
                    .gid(gid)
                    .fullShortUrl(fullShortUrl)
                    .date(new Date())
                    .build();
            linkDeviceStatsMapper.shortLinkDeviceState(linkDeviceStatsDO);
            // 用户访问网络情况
            LinkNetworkStatsDO linkNetworkStatsDO = LinkNetworkStatsDO.builder()
                    .network(statsRecord.getNetwork())
                    .cnt(1)
                    .date(new Date())
                    .fullShortUrl(fullShortUrl)
                    .gid(gid)
                    .build();
            linkNetworkStatsMapper.shortLinkNetworkState(linkNetworkStatsDO);
            // 用户访问日志
            LinkAccessLogsDO linkAccessLogsDO = LinkAccessLogsDO.builder()
                    .ip(statsRecord.getRemoteAddr())
                    .browser(statsRecord.getBrowser())
                    .os(statsRecord.getOs())
                    .gid(gid)
                    .fullShortUrl(fullShortUrl)
                    .user(statsRecord.getUv())
                    .network(statsRecord.getNetwork())
                    .device(statsRecord.getDevice())
                    .locale(StrUtil.join("-", "中国", actualProvince, actualCity))
                    .createTime(new Date())
                    .updateTime(new Date())
                    .delFlag(0)
                    .build();
            linkAccessLogsMapper.insert(linkAccessLogsDO);
            // 短链接累计访问统计自增
            this.baseMapper.incrementStats(gid, fullShortUrl, newPv, newUv, newUip);
            // 短链接今日访问统计新增记录
            int todayPv = 1;
            int todayUv = statsRecord.getUvTodayFirstFlag() ? 1 : 0;
            int todayUip = statsRecord.getUipTodayFirstFlag() ? 1 : 0;
            LinkStatsTodayDO linkStatsTodayDO = LinkStatsTodayDO.builder()
                    .date(new Date())
                    .todayPv(todayPv)
                    .todayUv(todayUv)
                    .todayUip(todayUip)
                    .gid(gid)
                    .fullShortUrl(fullShortUrl)
                    .build();
            linkStatsTodayMapper.shortLinkTodayState(linkStatsTodayDO);
        }
        catch (Throwable ex){
            log.error("短链接访问量统计异常",ex);
        }
        finally {
            rLock.unlock();
        }
    }

    /**
     * 生成短链接
     * @param requestParam
     * @return
     */
    @Override
    public ShortLinkCreateRespDTO createShortLink(ShortLinkCreateReqDTO requestParam) {
        // TODO:目前会出现一个origin_url生成多个短链接的情况
        verificationWhitelist(requestParam.getOriginUrl());
        String shortUri = generateShortUri(requestParam);
        String fullShortUrl = createShortLinkDefaultDomain + "/" + shortUri;
        ShortLinkDO shortLinkDO = ShortLinkDO.builder()
                .domain(createShortLinkDefaultDomain)
                .originUrl(requestParam.getOriginUrl())
                .gid(requestParam.getGid())
                .createType(requestParam.getCreatedType())
                .validDateType(requestParam.getValidDateType())
                .validDate(requestParam.getValidDate())
                .describe(requestParam.getDescribe())
                .shortUri(shortUri)
                .enableStatus(0)
                .fullShortUrl(fullShortUrl)
                .favicon(getFavicon(requestParam.getOriginUrl()))
                .totalPv(0)
                .totalUip(0)
                .totalUv(0)
                .delTime(0L)
                .build();
        if (requestParam.getValidDateType() == 1 && requestParam.getValidDate() == null){
            throw new ClientException("请填写短链接有效时间！");
        }
        if (requestParam.getValidDate()!= null && requestParam.getValidDate().before(new Date())){
            throw new ClientException("有效日期时间是过期时间！");
        }
        ShortLinkGoToDO shortLinkGoToDO = ShortLinkGoToDO.builder()
                .gid(requestParam.getGid())
                .fullShortUrl(fullShortUrl)
                .build();
        try{
            this.baseMapper.insert(shortLinkDO);
            shortLinkGoToMapper.insert(shortLinkGoToDO);
        } catch (DuplicateKeyException exception)
        {
            LambdaQueryWrapper<ShortLinkDO> wrapper = Wrappers.lambdaQuery(ShortLinkDO.class)
                    .eq(ShortLinkDO::getFullShortUrl, fullShortUrl);
            ShortLinkDO hasshortLinkDO = this.baseMapper.selectOne(wrapper);
            if (hasshortLinkDO != null){
                log.warn("短链接: {} 重复入库", fullShortUrl);
                throw new ServiceException("短链接生成重复");
            }
        }
        // 创建短链接时进行缓存预热
        stringRedisTemplate.opsForValue().set(
                String.format(GOTO_SHORT_LINK_KEY, fullShortUrl),
                shortLinkDO.getOriginUrl(),
                LinkUtil.getLinkCacheValidDate(requestParam.getValidDate()),
                TimeUnit.MILLISECONDS);
        shortUriCreateCachePenetrationBloomFilter.add(fullShortUrl);
        return ShortLinkCreateRespDTO.builder()
                .fullShortUrl("http://" + shortLinkDO.getFullShortUrl())
                .originUrl(requestParam.getOriginUrl())
                .gid(requestParam.getGid())
                .build();
    }

    /**
     * 分页查询短链接，并统计pv,uv,uip这些内容
     */
    @Override
    public IPage<ShortLinkPageRespDTO> pageShortLink(ShortLinkPageReqDTO requestParam) {
        IPage<ShortLinkDO> resultPage = this.baseMapper.pageLink(requestParam);
        return resultPage.convert(each -> {
            ShortLinkPageRespDTO result = BeanUtil.toBean(each, ShortLinkPageRespDTO.class);
            result.setDomain("http://" + result.getDomain());
            return result;
        });
    }

    /**
     * 批量创建短链接
     * @param requestParam
     * @return
     */
    @Override
    public ShortLinkBatchCreateRespDTO batchCreateShortLink(ShortLinkBatchCreateReqDTO requestParam) {
        List<String> originUrls = requestParam.getOriginUrls();
        List<String> describes = requestParam.getDescribes();
        List<ShortLinkBaseInfoRespDTO> result = new ArrayList<>();
        for (int i = 0; i < originUrls.size(); i++){
            ShortLinkCreateReqDTO shortLinkCreateReqDTO = BeanUtil.toBean(requestParam, ShortLinkCreateReqDTO.class);
            shortLinkCreateReqDTO.setOriginUrl(originUrls.get(i));
            shortLinkCreateReqDTO.setDescribe(describes.get(i));
            try {
                ShortLinkCreateRespDTO shortLink = createShortLink(shortLinkCreateReqDTO);
                ShortLinkBaseInfoRespDTO shortLinkBaseInfoRespDTO = ShortLinkBaseInfoRespDTO.builder()
                        .fullShortUrl(shortLink.getFullShortUrl())
                        .originUrl(shortLink.getOriginUrl())
                        .describe(describes.get(i))
                        .build();
                result.add(shortLinkBaseInfoRespDTO);
            }
            catch (Throwable ex){
                log.error("批量创建短链接失败，原始参数: {}",originUrls.get(i));
            }
        }
        return ShortLinkBatchCreateRespDTO.builder()
                .total(result.size())
                .baseLinkInfos(result)
                .build();
    }


    /**
     * 生成六位短链接码
     * @param requestParam
     * @return
     */
    private String generateShortUri(ShortLinkCreateReqDTO requestParam){
        int customGenerateCount = 0;
        String shortUri;
        while (true){
            if (customGenerateCount > 10){
                throw new ServiceException("短链接频繁生成，请稍后再试");
            }
            String originUrl = requestParam.getOriginUrl();
            originUrl += System.currentTimeMillis();
            shortUri = HashUtil.hashToBase62(originUrl);
            String fullShortUrl = createShortLinkDefaultDomain + "/" + shortUri;
            // 判断布隆过滤器内是否包含这个短链接
            if (!shortUriCreateCachePenetrationBloomFilter.contains(fullShortUrl)){
                break;
            }
            customGenerateCount++;
        }
        return shortUri;
    }

    /**
     * 根据分组gid查询短链接
     * @param requestParam
     * @return
     */
    @Override
    public List<ShortLinkGroupCountQueryRespDTO> listGroupShortLinkCount(List<String> requestParam) {
        QueryWrapper<ShortLinkDO> wrapper = Wrappers.<ShortLinkDO>query()
                .select("gid,count(*) as shortLinkCount")
                .in("gid", requestParam)
                .eq("enable_status", 0)
                .eq("del_flag",0)
                .eq("del_time",0L)
                .groupBy("gid");
        List<Map<String, Object>> shortLinkDOList = this.baseMapper.selectMaps(wrapper);
        return BeanUtil.copyToList(shortLinkDOList,ShortLinkGroupCountQueryRespDTO.class);
    }

    /**
     * 更新短链接信息
     * @param requestParam
     */
    @Transactional(rollbackFor = Exception.class)
    @Override
    public void updateShortLink(ShortLinkUpdateReqDTO requestParam) {
        verificationWhitelist(requestParam.getOriginUrl());
        LambdaQueryWrapper<ShortLinkDO> queryWrapper = Wrappers.lambdaQuery(ShortLinkDO.class)
                .eq(ShortLinkDO::getGid, requestParam.getOriginGid())
                .eq(ShortLinkDO::getFullShortUrl, requestParam.getFullShortUrl())
                .eq(ShortLinkDO::getDel_flag, 0)
                .eq(ShortLinkDO::getEnableStatus, 0);
        ShortLinkDO hasShortLinkDO = this.baseMapper.selectOne(queryWrapper);
        if (hasShortLinkDO == null){
            throw new ClientException("短链接记录不存在");
        }
        // 如果没有对gid进行修改
        if (Objects.equals(hasShortLinkDO.getGid(),requestParam.getGid())){
            LambdaUpdateWrapper<ShortLinkDO> updateWrapper = Wrappers.lambdaUpdate(ShortLinkDO.class)
                    .eq(ShortLinkDO::getFullShortUrl, requestParam.getFullShortUrl())
                    .eq(ShortLinkDO::getGid, requestParam.getGid())
                    .eq(ShortLinkDO::getDel_flag, 0)
                    .eq(ShortLinkDO::getEnableStatus, 0)
                    .set(Objects.equals(requestParam.getValidDateType(), ValiDateTypeEnum.PERMANENT.getType()), ShortLinkDO::getValidDate, null);
            ShortLinkDO shortLinkDO = ShortLinkDO.builder()
                .domain(hasShortLinkDO.getDomain())
                .shortUri(hasShortLinkDO.getShortUri())
                .fullShortUrl(hasShortLinkDO.getFullShortUrl())
                .clickNum(hasShortLinkDO.getClickNum())
                .favicon(hasShortLinkDO.getFavicon())
                .createType(hasShortLinkDO.getCreateType())
                .gid(requestParam.getGid())
                .originUrl(requestParam.getOriginUrl())
                .describe(requestParam.getDescribe())
                .validDateType(requestParam.getValidDateType())
                .validDate(requestParam.getValidDate())
                .build();
            this.baseMapper.update(shortLinkDO,updateWrapper);
        }
        else
        {
            RReadWriteLock readWriteLock = redissonClient.getReadWriteLock(String.format(LOCK_GID_UPDATE_KEY, requestParam.getFullShortUrl()));
            RLock rLock = readWriteLock.writeLock(); // 写锁
            if (!rLock.tryLock()){
                throw new ServiceException("短链接正在被访问，请稍后再试...");
            }
            try{
                LambdaUpdateWrapper<ShortLinkDO> linkUpdateWrapper = Wrappers.lambdaUpdate(ShortLinkDO.class)
                    .eq(ShortLinkDO::getFullShortUrl, requestParam.getFullShortUrl())
                    .eq(ShortLinkDO::getGid, hasShortLinkDO.getGid())
                    .eq(ShortLinkDO::getDel_flag, 0)
                    .eq(ShortLinkDO::getDelTime,0L)
                    .eq(ShortLinkDO::getEnableStatus, 0);
                ShortLinkDO delShortLinkDO = ShortLinkDO.builder()
                        .delTime(System.currentTimeMillis())
                        .build();
                delShortLinkDO.setDel_flag(1);
                baseMapper.update(delShortLinkDO, linkUpdateWrapper); // 先软删除
                ShortLinkDO shortLinkDO = ShortLinkDO.builder()
                        .domain(createShortLinkDefaultDomain)
                        .originUrl(requestParam.getOriginUrl())
                        .fullShortUrl(hasShortLinkDO.getFullShortUrl())
                        .gid(requestParam.getGid())
                        .createType(hasShortLinkDO.getCreateType())
                        .validDateType(requestParam.getValidDateType())
                        .validDate(requestParam.getValidDate())
                        .describe(requestParam.getDescribe())
                        .shortUri(hasShortLinkDO.getShortUri())
                        .enableStatus(hasShortLinkDO.getEnableStatus())
                        .totalPv(hasShortLinkDO.getTotalPv())
                        .totalUv(hasShortLinkDO.getTotalUv())
                        .totalUip(hasShortLinkDO.getTotalUip())
                        .favicon(hasShortLinkDO.getFavicon())
                        .delTime(0L)
                        .build();
                baseMapper.insert(shortLinkDO); // 再重新插入
                /**
                 * Today表进行更新gid操作
                 */
                LambdaQueryWrapper<LinkStatsTodayDO> wrapper = Wrappers.lambdaQuery(LinkStatsTodayDO.class)
                        .eq(LinkStatsTodayDO::getFullShortUrl, requestParam.getFullShortUrl())
                        .eq(LinkStatsTodayDO::getGid, hasShortLinkDO.getGid())
                        .eq(LinkStatsTodayDO::getDelFlag, 0);
                List<LinkStatsTodayDO> linkStatsTodayDOList = linkStatsTodayMapper.selectList(wrapper);
                if (CollUtil.isNotEmpty(linkStatsTodayDOList)){
                    linkStatsTodayMapper.deleteBatchIds(linkStatsTodayDOList.stream()
                            .map(LinkStatsTodayDO::getId)
                            .toList()
                    );
                    linkStatsTodayDOList.forEach(each -> each.setGid(requestParam.getGid()));
                    linkStatsTodayService.saveBatch(linkStatsTodayDOList);
                }
                /**
                 * 路由表更新gid
                 */
                LambdaQueryWrapper<ShortLinkGoToDO> queryWrapper1 = Wrappers.lambdaQuery(ShortLinkGoToDO.class)
                        .eq(ShortLinkGoToDO::getFullShortUrl,requestParam.getFullShortUrl())
                        .eq(ShortLinkGoToDO::getGid,hasShortLinkDO.getGid());
                ShortLinkGoToDO shortLinkGoToDO = shortLinkGoToMapper.selectOne(queryWrapper1);
                shortLinkGoToMapper.deleteById(shortLinkGoToDO.getId());
                shortLinkGoToDO.setGid(requestParam.getGid());
                shortLinkGoToMapper.insert(shortLinkGoToDO);
                /**
                 * t_link_access_stats表更新gid
                 */
                LambdaUpdateWrapper<LinkAccessStatsDO> queryWrapper2 = Wrappers.lambdaUpdate(LinkAccessStatsDO.class)
                        .eq(LinkAccessStatsDO::getFullShortUrl, requestParam.getFullShortUrl())
                        .eq(LinkAccessStatsDO::getGid, hasShortLinkDO.getGid())
                        .eq(LinkAccessStatsDO::getDelFlag, 0);
                LinkAccessStatsDO linkAccessStatsDO = LinkAccessStatsDO.builder()
                        .gid(requestParam.getGid())
                        .build();
                linkAccessStatsMapper.update(linkAccessStatsDO,queryWrapper2);
                /**
                 * t_link_locale_stats表更新gid
                 */
                LambdaUpdateWrapper<LinkLocaleStatsDO> queryWrapper3 = Wrappers.lambdaUpdate(LinkLocaleStatsDO.class)
                        .eq(LinkLocaleStatsDO::getFullShortUrl, requestParam.getFullShortUrl())
                        .eq(LinkLocaleStatsDO::getGid, hasShortLinkDO.getGid())
                        .eq(LinkLocaleStatsDO::getDelFlag, 0);
                LinkLocaleStatsDO linkLocaleStatsDO = LinkLocaleStatsDO.builder()
                        .gid(requestParam.getGid())
                        .build();
                linkLocaleStatsMapper.update(linkLocaleStatsDO,queryWrapper3);
                /**
                 * t_link_os_stats表更新gid
                 */
                LambdaUpdateWrapper<LinkOsStatsDO> linkOsStatsUpdateWrapper = Wrappers.lambdaUpdate(LinkOsStatsDO.class)
                        .eq(LinkOsStatsDO::getFullShortUrl, requestParam.getFullShortUrl())
                        .eq(LinkOsStatsDO::getGid, hasShortLinkDO.getGid())
                        .eq(LinkOsStatsDO::getDelFlag, 0);
                LinkOsStatsDO linkOsStatsDO = LinkOsStatsDO.builder()
                        .gid(requestParam.getGid())
                        .build();
                linkOsStatsMapper.update(linkOsStatsDO, linkOsStatsUpdateWrapper);
                /**
                 * t_link_browser_stats表更新gid
                 */
                LambdaUpdateWrapper<LinkBrowserStatsDO> linkBrowserStatsUpdateWrapper = Wrappers.lambdaUpdate(LinkBrowserStatsDO.class)
                        .eq(LinkBrowserStatsDO::getFullShortUrl, requestParam.getFullShortUrl())
                        .eq(LinkBrowserStatsDO::getGid, hasShortLinkDO.getGid())
                        .eq(LinkBrowserStatsDO::getDelFlag, 0);
                LinkBrowserStatsDO linkBrowserStatsDO = LinkBrowserStatsDO.builder()
                        .gid(requestParam.getGid())
                        .build();
                linkBrowserStatsMapper.update(linkBrowserStatsDO, linkBrowserStatsUpdateWrapper);
                /**
                 * t_link_device_stats表更新gid
                 */
                LambdaUpdateWrapper<LinkDeviceStatsDO> linkDeviceStatsUpdateWrapper = Wrappers.lambdaUpdate(LinkDeviceStatsDO.class)
                        .eq(LinkDeviceStatsDO::getFullShortUrl, requestParam.getFullShortUrl())
                        .eq(LinkDeviceStatsDO::getGid, hasShortLinkDO.getGid())
                        .eq(LinkDeviceStatsDO::getDelFlag, 0);
                LinkDeviceStatsDO linkDeviceStatsDO = LinkDeviceStatsDO.builder()
                        .gid(requestParam.getGid())
                        .build();
                linkDeviceStatsMapper.update(linkDeviceStatsDO, linkDeviceStatsUpdateWrapper);
                /**
                 * t_link_network_stats表更新gid
                 */
                LambdaUpdateWrapper<LinkNetworkStatsDO> linkNetworkStatsUpdateWrapper = Wrappers.lambdaUpdate(LinkNetworkStatsDO.class)
                        .eq(LinkNetworkStatsDO::getFullShortUrl, requestParam.getFullShortUrl())
                        .eq(LinkNetworkStatsDO::getGid, hasShortLinkDO.getGid())
                        .eq(LinkNetworkStatsDO::getDelFlag, 0);
                LinkNetworkStatsDO linkNetworkStatsDO = LinkNetworkStatsDO.builder()
                        .gid(requestParam.getGid())
                        .build();
                linkNetworkStatsMapper.update(linkNetworkStatsDO, linkNetworkStatsUpdateWrapper);
                /**
                 * t_link_access_logs表更新gid
                 */
                LambdaUpdateWrapper<LinkAccessLogsDO> linkAccessLogsUpdateWrapper = Wrappers.lambdaUpdate(LinkAccessLogsDO.class)
                        .eq(LinkAccessLogsDO::getFullShortUrl, requestParam.getFullShortUrl())
                        .eq(LinkAccessLogsDO::getGid, hasShortLinkDO.getGid())
                        .eq(LinkAccessLogsDO::getDelFlag, 0);
                LinkAccessLogsDO linkAccessLogsDO = LinkAccessLogsDO.builder()
                        .gid(requestParam.getGid())
                        .build();
                linkAccessLogsMapper.update(linkAccessLogsDO, linkAccessLogsUpdateWrapper);
            }
            finally {
                rLock.unlock();
            }
        }
        // 判断是否对短链接有效期进行了变更
        if (!Objects.equals(hasShortLinkDO.getValidDateType(),requestParam.getValidDateType())
                || !Objects.equals(hasShortLinkDO.getValidDate(),requestParam.getValidDate())){
            // 如果变更了短链接的有效期，那就要把redis缓存中存储的原始链接删掉，让它在跳转时访问数据库查询后重新加入到redis中
            stringRedisTemplate.delete(String.format(GOTO_SHORT_LINK_KEY, requestParam.getFullShortUrl()));
            // 如果短链接之前已经过期了，又要恢复有效期的话
            if (hasShortLinkDO.getValidDate() != null && hasShortLinkDO.getValidDate().before(new Date())){
                if (Objects.equals(requestParam.getValidDateType(),ValiDateTypeEnum.PERMANENT.getType()) || requestParam.getValidDate().after(new Date())){
                    stringRedisTemplate.delete(String.format(GOTO_IS_NULL_SHORT_LINK_KEY, requestParam.getFullShortUrl()));
                }
            }
        }
    }

    /**
     * 获取原始链接图标
     * @param url
     * @return
     */
    @SneakyThrows
    private String getFavicon(String url) {
        URL targetUrl = new URL(url);
        HttpURLConnection connection = (HttpURLConnection) targetUrl.openConnection();
        connection.setRequestMethod("GET");
        connection.connect();
        int responseCode = connection.getResponseCode();
        if (HttpURLConnection.HTTP_OK == responseCode) {
            Document document = Jsoup.connect(url).get();
            Element faviconLink = document.select("link[rel~=(?i)^(shortcut )?icon]").first();
            if (faviconLink != null) {
                return faviconLink.attr("abs:href");
            }
        }
        return null;
    }

    private void verificationWhitelist(String originUrl){
        Boolean enable = gotoDomainWhiteListConfiguration.getEnable();
        if (enable == null || !enable){
            return;
        }
        String domain = LinkUtil.extractDomain(originUrl);
        if (StrUtil.isBlank(domain)){
            throw new ClientException("跳转链接填写错误!");
        }
        List<String> details = gotoDomainWhiteListConfiguration.getDetails();
        if (!details.contains(domain)){
            throw new ClientException("为避免恶意攻击，请生成以下网站的跳转链接: " + gotoDomainWhiteListConfiguration.getNames());
        }
    }
}
