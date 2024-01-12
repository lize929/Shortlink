package com.nageoffer.shortlink.admin.dao.entity;

import com.baomidou.mybatisplus.annotation.*;
import lombok.AllArgsConstructor;
import lombok.Data;

import java.util.Date;

@Data
@TableName("t_user")
@AllArgsConstructor
public class UserDO {
    @TableId(type = IdType.AUTO)
    Long id;
    String username;
    String password;
    String real_name;
    String phone;
    String mail;
    Long delete_time;
    @TableField(fill = FieldFill.INSERT)
    Date create_time;
    @TableField(fill = FieldFill.INSERT_UPDATE)
    Date update_time;
    @TableField(fill = FieldFill.INSERT)
    Integer del_flag;
}
