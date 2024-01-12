package com.nageoffer.shortlink.admin.controller;

import com.nageoffer.shortlink.admin.common.convention.result.Result;
import com.nageoffer.shortlink.admin.common.convention.result.Results;
import jakarta.servlet.http.HttpServletResponse;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api/short-link/admin/v1/test")
public class TestController {
    @GetMapping("/hello")
    public Result<String> test(HttpServletResponse response){
//        response.setContentType("application/json;charset=utf-8");
        return Results.success("hello world");
    }

}
