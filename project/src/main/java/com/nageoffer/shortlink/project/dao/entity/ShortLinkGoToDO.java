package com.nageoffer.shortlink.project.dao.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * 短链接跳转获取gid实体
 */
@Data
@TableName("t_link_goto")
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class ShortLinkGoToDO {

    @TableId(type = IdType.AUTO)
    /**
     * id
     */
    private Long id;

    /**
     * gid
     */
    private String gid;

    /**
     * full_short_url
     */
    private String fullShortUrl;

}
