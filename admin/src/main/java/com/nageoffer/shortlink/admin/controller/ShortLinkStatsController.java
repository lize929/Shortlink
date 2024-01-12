package com.nageoffer.shortlink.admin.controller;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.nageoffer.shortlink.admin.common.convention.result.Result;
import com.nageoffer.shortlink.admin.common.convention.result.Results;
import com.nageoffer.shortlink.admin.dto.req.ShortLinkStatsAccessRecordReqDTO;
import com.nageoffer.shortlink.admin.dto.resp.ShortLinkStatsAccessRecordRespDTO;
import com.nageoffer.shortlink.admin.remote.ShortLinkRemoteService;
import com.nageoffer.shortlink.admin.remote.dto.req.ShortLinkGroupStatsAccessRecordReqDTO;
import com.nageoffer.shortlink.admin.remote.dto.req.ShortLinkGroupStatsReqDTO;
import com.nageoffer.shortlink.admin.remote.dto.req.ShortLinkStatsReqDTO;
import com.nageoffer.shortlink.admin.remote.dto.resp.ShortLinkStatsRespDTO;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequiredArgsConstructor
public class ShortLinkStatsController {

    ShortLinkRemoteService shortLinkRemoteService = new ShortLinkRemoteService(){
    };

    /**
     * 访问单个短链接指定时间内的监控数据
     * @param requestParam
     * @return
     */
    @GetMapping("/api/short-link/admin/v1/stats")
    public Result<ShortLinkStatsRespDTO> shortLinkStats(ShortLinkStatsReqDTO requestParam){
        return shortLinkRemoteService.oneShortLinkStats(requestParam);
    }

    /**
     * 访问gid分组短链接指定时间内的监控数据
     * @param requestParam
     * @return
     */
    @GetMapping("/api/short-link/admin/v1/stats/group")
    public Result<ShortLinkStatsRespDTO> groupShortLinkStats(ShortLinkGroupStatsReqDTO requestParam){
        return shortLinkRemoteService.groupShortLinkStats(requestParam);
    }

    /**
     * 分页查询访问单个短链接指定时间内的访问记录
     * @param requestParam
     * @return
     */
    @GetMapping("/api/short-link/admin/v1/stats/access-record")
    public Result<IPage<ShortLinkStatsAccessRecordRespDTO>> shortLinkStatsAccessRecord(ShortLinkStatsAccessRecordReqDTO requestParam){
        return shortLinkRemoteService.shortLinkStatsAccessRecord(requestParam);
    }

    /**
     * 分页查询访问分组短链接指定时间内的访问记录
     * @param requestParam
     * @return
     */
    @GetMapping("/api/short-link/admin/v1/stats/access-record/group")
    public Result<IPage<ShortLinkStatsAccessRecordRespDTO>> groupShortLinkStatsAccessRecord(ShortLinkGroupStatsAccessRecordReqDTO requestParam){
        return shortLinkRemoteService.groupShortLinkStatsAccessRecord(requestParam);
    }
}
