package com.nageoffer.shortlink.project.dto.resp;


import lombok.Data;

@Data
public class ShortLinkGroupCountQueryRespDTO {
    private String gid;

    private Integer shortLinkCount;
}
