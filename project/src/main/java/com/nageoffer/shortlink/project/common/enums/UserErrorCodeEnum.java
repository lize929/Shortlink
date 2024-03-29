package com.nageoffer.shortlink.project.common.enums;

import com.nageoffer.shortlink.project.common.convention.errorcode.IErrorCode;

public enum UserErrorCodeEnum implements IErrorCode {

    USER_NULL("B000200","用户记录不存在"),
    USERNAME_EXIST("B000201","用户名已存在"),
    USER_SAVE_ERROR("B000202","用户记录新增失败"),
    USER_TOKEN_FAIL("A000200", "用户Token验证失败"),
    USER_LOGIN_FAIL("A000201", "登录失败"),
    USER_LOGOUT_FAIL("A000202", "退出登录失败"),
    USER_UN_AUTH("A000203","用户未验证"),
    USER_NO_ROLE("A000204","用户权限不足");
    private final String code;

    private final String message;

    UserErrorCodeEnum(String code, String message) {
        this.code = code;
        this.message = message;
    }

    @Override
    public String code() {
        return code;
    }

    @Override
    public String message() {
        return message;
    }
}
