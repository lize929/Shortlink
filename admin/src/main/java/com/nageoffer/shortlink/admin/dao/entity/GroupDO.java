package com.nageoffer.shortlink.admin.dao.entity;

import com.baomidou.mybatisplus.annotation.*;
import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;

@Data
@TableName("t_group")
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class GroupDO {
    @TableId(type = IdType.AUTO)
    /**
     * id
     */
    Long id;

    /**
     * 短链接分组标识
     */
    String gid;

    /**
     * 分组名称
     */
    String name;

    /**
     * 创建分组的用户名
     */
    String username;

    /**
     * 分组排序
     */
    Integer sortOrder;

    @TableField(fill = FieldFill.INSERT)
//    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+8")
    Date create_time;
    @TableField(fill = FieldFill.INSERT_UPDATE)
//    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+8")
    Date update_time;
    @TableField(fill = FieldFill.INSERT)
    Integer del_flag;

}
