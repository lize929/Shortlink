package com.nageoffer.shortlink.admin.dto.resp;

import lombok.Data;

import java.util.Date;

@Data
public class AuthorizeVO {
    Long id;
    String username;
    String real_name;
    String token;
    Date expire;
}
