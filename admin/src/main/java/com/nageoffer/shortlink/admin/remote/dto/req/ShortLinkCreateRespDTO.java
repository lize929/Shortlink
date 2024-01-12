package com.nageoffer.shortlink.admin.remote.dto.req;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class ShortLinkCreateRespDTO {
    /**
     * 分组信息
     */
    private String gid;

    private String fullShortUrl;

    private String origin_url;

}
