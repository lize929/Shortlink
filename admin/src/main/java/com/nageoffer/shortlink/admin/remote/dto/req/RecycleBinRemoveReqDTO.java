package com.nageoffer.shortlink.admin.remote.dto.req;


import lombok.Data;

/**
 * 回收站恢复功能入参
 */
@Data
public class RecycleBinRemoveReqDTO {
    private String gid;
    private String fullShortUrl;
}
