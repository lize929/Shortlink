package com.nageoffer.shortlink.project.controller;


import com.alibaba.fastjson2.JSONObject;
import com.nageoffer.shortlink.project.common.convention.result.Result;
import com.nageoffer.shortlink.project.common.convention.result.Results;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import static com.nageoffer.shortlink.project.common.convention.errorcode.BaseErrorCode.USER_LIMIT_ERROR;

@RestController
public class BlockController {

    @RequestMapping("/api/short-link/v1/blocked")
    public Result<Void> blocked(){
        return Results.failure(USER_LIMIT_ERROR.code(),USER_LIMIT_ERROR.message());
    }

}
