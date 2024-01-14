package com.nageoffer.shortlink.admin.service;


import com.baomidou.mybatisplus.core.metadata.IPage;
import com.nageoffer.shortlink.admin.common.convention.result.Result;
import com.nageoffer.shortlink.admin.remote.dto.req.ShortLinkPageReqDTO;
import com.nageoffer.shortlink.admin.remote.dto.req.ShortLinkRecycleBinPageReqDTO;
import com.nageoffer.shortlink.admin.remote.dto.resp.ShortLinkPageRespDTO;

/**
 * URL回收站接口层
 */
public interface RecycleBinService {

    Result<IPage<ShortLinkPageRespDTO>> pageShortLink_Recycle_bin(String username);

}