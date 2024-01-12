package com.nageoffer.shortlink.admin.service.impl;

import cn.hutool.core.bean.BeanUtil;
import cn.hutool.core.collection.CollUtil;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.conditions.update.LambdaUpdateWrapper;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.nageoffer.shortlink.admin.common.convention.exception.ClientException;
import com.nageoffer.shortlink.admin.common.convention.result.Result;
import com.nageoffer.shortlink.admin.dao.entity.GroupDO;
import com.nageoffer.shortlink.admin.dao.mapper.GroupMapper;
import com.nageoffer.shortlink.admin.dto.req.ShortLinkGroupSortReqDTO;
import com.nageoffer.shortlink.admin.dto.req.ShortlinkGroupUpdateReqDTO;
import com.nageoffer.shortlink.admin.dto.resp.ShortLinkGroupRespDTO;
import com.nageoffer.shortlink.admin.remote.ShortLinkRemoteService;
import com.nageoffer.shortlink.admin.remote.dto.resp.ShortLinkGroupCountQueryRespDTO;
import com.nageoffer.shortlink.admin.service.GroupService;
import com.nageoffer.shortlink.admin.utils.RandomStringUtil;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.redisson.api.RLock;
import org.redisson.api.RedissonClient;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Objects;
import java.util.Optional;

import static com.nageoffer.shortlink.admin.common.constant.RedisCacheConstant.LOCK_GROUP_CREATE_KEY;

@Service
@Slf4j
@RequiredArgsConstructor
public class GroupServiceImpl extends ServiceImpl<GroupMapper, GroupDO> implements GroupService {

    @Value("${short-link.group.max-num}")
    private Integer maxNum;

    private final RedissonClient redissonClient;
    ShortLinkRemoteService shortLinkRemoteService = new ShortLinkRemoteService(){
    };

    @Override
    public void saveGroup(String groupName,String username) {
        RLock lock = redissonClient.getLock(String.format(LOCK_GROUP_CREATE_KEY, username));
        lock.lock();
        try{
            LambdaQueryWrapper<GroupDO> queryWrapper = Wrappers.lambdaQuery(GroupDO.class)
                    .eq(GroupDO::getUsername,username)
                    .eq(GroupDO::getDel_flag,0);
            List<GroupDO> groupDOList = this.baseMapper.selectList(queryWrapper);
            if (CollUtil.isNotEmpty(groupDOList) && groupDOList.size() == maxNum){
                throw new ClientException(String.format("已超出可创建的最大分组数量: %d",maxNum));
            }
            String gid;
            while (true){
                gid = RandomStringUtil.generateRandom();
                if (hasGid(gid,username)){
                    break;
                }
            }
            GroupDO groupDO = GroupDO.builder()
                    .gid(gid)
                    .name(groupName)
                    .username(username)
                    .sortOrder(0)
                    .build();
            this.baseMapper.insert(groupDO);
        }
        finally {
            lock.unlock();
        }
    }

    @Override
    public void sortGroup(List<ShortLinkGroupSortReqDTO> requestParam, String username) {
        requestParam.forEach(each -> {
            GroupDO groupDO = GroupDO.builder()
                    .sortOrder(each.getSort_order())
                    .build();
            LambdaUpdateWrapper<GroupDO> updateWrapper = Wrappers.lambdaUpdate(GroupDO.class)
                    .eq(GroupDO::getUsername, username)
                    .eq(GroupDO::getGid, each.getGid())
                    .eq(GroupDO::getDel_flag, 0);
            this.baseMapper.update(groupDO,updateWrapper);
        });
    }

    /**
     * 短链接删除功能，短链接删除一般都是软删除，即将其标志位设置为1
     * @param gid
     * @param username
     */

    @Override
    public void deleteGroup(String gid, String username) {
        LambdaQueryWrapper<GroupDO> queryWrapper = Wrappers.lambdaQuery(GroupDO.class)
                .eq(GroupDO::getUsername, username)
                .eq(GroupDO::getGid, gid)
                .eq(GroupDO::getDel_flag, 0);
        GroupDO groupDO = new GroupDO();
        groupDO.setDel_flag(1);
        this.baseMapper.update(groupDO,queryWrapper);
    }

    @Override
    public void updateGroup(ShortlinkGroupUpdateReqDTO requestParam,String username) {
        LambdaUpdateWrapper<GroupDO> updateWrapper = Wrappers.lambdaUpdate(GroupDO.class)
                .eq(GroupDO::getUsername, username)
                .eq(GroupDO::getGid, requestParam.getGid())
                .eq(GroupDO::getDel_flag, 0);
        GroupDO groupDO = new GroupDO();
        groupDO.setName(requestParam.getName());
        this.baseMapper.update(groupDO,updateWrapper);
    }

    @Override
    public List<ShortLinkGroupRespDTO> listGroup(String username) {
//         TODO 获取用户名
        LambdaQueryWrapper<GroupDO> queryWrapper = Wrappers.lambdaQuery(GroupDO.class)
                .eq(GroupDO::getDel_flag, 0)
                .eq(GroupDO::getUsername, username)
                .orderByDesc(GroupDO::getSortOrder,GroupDO::getUpdate_time);
        List<GroupDO> groupDOList = this.baseMapper.selectList(queryWrapper);
        Result<List<ShortLinkGroupCountQueryRespDTO>> listResult =
                shortLinkRemoteService.listGroupShortLinkCount(groupDOList.stream().map(GroupDO::getGid).toList());
        List<ShortLinkGroupRespDTO> shortLinkGroupRespDTOS = BeanUtil.copyToList(groupDOList, ShortLinkGroupRespDTO.class);
        shortLinkGroupRespDTOS.forEach(each -> {
                    Optional<ShortLinkGroupCountQueryRespDTO> first =
                            listResult.getData().stream()
                                    .filter(item -> Objects.equals(item.getGid(), each.getGid()))
                                    .findFirst();
                    first.ifPresent(item -> each.setShortLinkCount(first.get().getShortLinkCount()));
                }
        );

        return shortLinkGroupRespDTOS;
    }

    private boolean hasGid(String gid,String username){
        LambdaQueryWrapper<GroupDO> eqed = Wrappers.lambdaQuery(GroupDO.class)
                .eq(GroupDO::getGid, gid)
                .eq(GroupDO::getUsername,username);
        GroupDO groupDO = this.baseMapper.selectOne(eqed);
        return groupDO == null;
    }
}
