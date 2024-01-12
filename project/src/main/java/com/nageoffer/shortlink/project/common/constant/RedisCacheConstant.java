package com.nageoffer.shortlink.project.common.constant;

public class RedisCacheConstant {

    public static final String LOCK_USER_REGISTER_KEY = "short-link:lock_user-register:";

    public static final String JWT_BLACK_LIST = "jwt:blacklist:"; //jwt令牌黑名单

    /**
     * 短链接跳转前缀key
     */
    public static final String GOTO_SHORT_LINK_KEY = "short-link_goto_%s";


    /**
     * 短链接空值跳转前缀key
     */
    public static final String GOTO_IS_NULL_SHORT_LINK_KEY = "short-link_is-null_goto_%s";

    /**
     * 短链接跳转锁前缀key
     */
    public static final String LOCK_GOTO_SHORT_LINK_KEY = "short-link_lock_goto_%s";

    /**
     * 短链接修改分组gid读写锁前缀key
     */
    public static final String LOCK_GID_UPDATE_KEY = "short-link_lock_update-gid_%s";

    /**
     * 短链接延迟队列消费统计key
     */
    public static final String DELAY_QUEUE_STATS_KEY = "short-link_delay-queue:stats";
}
