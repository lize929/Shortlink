package com.nageoffer.shortlink.admin.dto.resp;

import com.baomidou.mybatisplus.annotation.FieldFill;
import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import lombok.Data;

import java.util.Date;

@Data
public class ShortLinkGroupRespDTO {
    /**
     * 短链接分组标识
     */
    private String gid;

    /**
     * 分组名称
     */
    private String name;


    /**
     * 分组排序
     */
    private Integer sortOrder;


    /**
     * 删除标识，0：未删除，1：已删除
     */
    private Integer delFlag;

    private Integer shortLinkCount;
}
