package com.nageoffer.shortlink.admin.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.nageoffer.shortlink.admin.dao.entity.GroupDO;
import com.nageoffer.shortlink.admin.dto.req.ShortLinkGroupSortReqDTO;
import com.nageoffer.shortlink.admin.dto.req.ShortlinkGroupUpdateReqDTO;
import com.nageoffer.shortlink.admin.dto.resp.ShortLinkGroupRespDTO;

import java.util.List;

public interface GroupService extends IService<GroupDO> {

    void saveGroup(String groupName,String username);

    List<ShortLinkGroupRespDTO> listGroup(String username);

    /**
     * 修改短链接分组
     * @param requestParam
     */
    void updateGroup(ShortlinkGroupUpdateReqDTO requestParam,String username);

    void deleteGroup(String gid, String username);

    /**
     * 短链接分组排序
     * @param requestParam
     * @param username
     */
    void sortGroup(List<ShortLinkGroupSortReqDTO> requestParam, String username);
}
