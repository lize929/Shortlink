package com.nageoffer.shortlink.admin.dto.req;


import lombok.Data;

@Data
public class UserUpdateReqDTO {
    String username;
    String password;
    String real_name;
    String phone;
    String mail;
}
