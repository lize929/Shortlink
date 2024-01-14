package com.nageoffer.shortlink.project.redisMq.consumer;

import cn.hutool.core.date.DateUtil;
import cn.hutool.core.date.Week;
import cn.hutool.core.util.StrUtil;
import cn.hutool.http.HttpUtil;
import com.alibaba.fastjson2.JSON;
import com.alibaba.fastjson2.JSONObject;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.nageoffer.shortlink.project.dao.entity.*;
import com.nageoffer.shortlink.project.dao.mapper.*;
import com.nageoffer.shortlink.project.dto.biz.ShortLinkStatsRecordDTO;
import com.nageoffer.shortlink.project.redisMq.producer.DelayShortLinkStatsProducer;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.redisson.api.RLock;
import org.redisson.api.RReadWriteLock;
import org.redisson.api.RedissonClient;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.data.redis.connection.stream.MapRecord;
import org.springframework.data.redis.connection.stream.RecordId;
import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.data.redis.stream.StreamListener;
import org.springframework.stereotype.Component;

import java.util.*;

import static com.nageoffer.shortlink.project.common.constant.RedisCacheConstant.LOCK_GID_UPDATE_KEY;
import static com.nageoffer.shortlink.project.common.constant.ShortLinkConstant.AMAP_REMOTE_URL;

@Component
@Slf4j
@RequiredArgsConstructor
public class ShortLinkStatsSaveConsumer implements StreamListener<String, MapRecord<String,String,String>> {

    private final ShortLinkGoToMapper shortLinkGoToMapper;
    private final RedissonClient redissonClient;
    private final LinkAccessStatsMapper linkAccessStatsMapper;
    private final LinkLocaleStatsMapper linkLocaleStatsMapper;
    private final LinkOsStatsMapper linkOsStatsMapper;
    private final LinkBrowserStatsMapper linkBrowserStatsMapper;
    private final LinkAccessLogsMapper linkAccessLogsMapper;
    private final LinkDeviceStatsMapper linkDeviceStatsMapper;
    private final LinkNetworkStatsMapper linkNetworkStatsMapper;
    private final LinkStatsTodayMapper linkStatsTodayMapper;
    private final DelayShortLinkStatsProducer delayShortLinkStatsProducer;
    private final ShortLinkMapper shortLinkMapper;
    private final StringRedisTemplate stringRedisTemplate;


    @Value("${spring.short-link.stats.locale.amap-key}")
    private String amapKey;

    /**
     * 消息处理
     * @param message
     */
    @Override
    public void onMessage(MapRecord<String, String, String> message) {
        String stream = message.getStream();
        RecordId id = message.getId();  
        Map<String, String> producerMap = message.getValue();
        String fullShortUrl = producerMap.get("fullShortUrl");
        if (StrUtil.isNotBlank(fullShortUrl)){
            String gid = producerMap.get("gid");
            ShortLinkStatsRecordDTO statsRecordDTO = JSON.parseObject(producerMap.get("statsRecord"), ShortLinkStatsRecordDTO.class);
            actualSaveShortLinkStats(fullShortUrl,gid,statsRecordDTO);
        }
        stringRedisTemplate.opsForStream().delete(Objects.requireNonNull(stream),id.getValue());
    }

    public void actualSaveShortLinkStats(String fullShortUrl, String gid, ShortLinkStatsRecordDTO statsRecord) {
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
            shortLinkMapper.incrementStats(gid, fullShortUrl, newPv, newUv, newUip);
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
}
