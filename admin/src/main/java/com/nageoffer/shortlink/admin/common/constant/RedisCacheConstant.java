package com.nageoffer.shortlink.admin.common.constant;

public class RedisCacheConstant {

    /**
     * 用户注册分布式锁
     */
    public static final String LOCK_USER_REGISTER_KEY = "short-link:lock_user-register:";

    public static final String JWT_BLACK_LIST = "jwt:blacklist:"; //jwt令牌黑名单


    /**
     * 用户创建分组分布式锁
     */
    public static final String LOCK_GROUP_CREATE_KEY = "short-link:lock_group-create:%s";
}
