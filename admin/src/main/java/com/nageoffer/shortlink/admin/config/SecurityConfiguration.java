package com.nageoffer.shortlink.admin.config;

import com.nageoffer.shortlink.admin.common.convention.result.Results;
import com.nageoffer.shortlink.admin.dto.resp.AuthorizeVO;
import com.nageoffer.shortlink.admin.dto.resp.UserRespDTO;
import com.nageoffer.shortlink.admin.service.UserService;
import com.nageoffer.shortlink.admin.filter.JwtAuthorizeFilter;
import com.nageoffer.shortlink.admin.utils.JwtUtil;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.BeanUtils;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.access.AccessDeniedException;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.http.SessionCreationPolicy;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.web.SecurityFilterChain;
import org.springframework.security.web.authentication.UsernamePasswordAuthenticationFilter;

import java.io.IOException;
import java.io.PrintWriter;

import static com.nageoffer.shortlink.admin.common.enums.UserErrorCodeEnum.*;

@Configuration
@RequiredArgsConstructor
public class SecurityConfiguration {

    private final JwtUtil utils;

    private final JwtAuthorizeFilter filter;

    private final UserService userService;
    @Bean
    public SecurityFilterChain filterChain(HttpSecurity http) throws Exception {
        return http
                .csrf(conf -> conf.disable())
                .authorizeHttpRequests(conf -> conf
                        .requestMatchers("/api/short-link/admin/v1/auth/**","/error","/api/short-link/admin/v1/user/has-username","/api/short-link/admin/v1/user/register","/api/short-link/admin/v1/test/**").permitAll()
                        .anyRequest().authenticated()
                )
                .formLogin(conf -> conf
                        .loginProcessingUrl("/api/short-link/admin/v1/auth/login")
                        .successHandler(this::onAuthenticationSuccess)
                        .failureHandler(this::onAuthenticationFailue)
                )
                .logout(conf -> conf
                        .logoutUrl("/api/short-link/admin/v1/auth/logout")
                        .logoutSuccessHandler(this::onLogoutSuccess))
                .exceptionHandling(conf -> conf
                        .authenticationEntryPoint(this::onUnauthorized)
                        .accessDeniedHandler(this::AccessDeniedHandler))
                .sessionManagement(conf -> conf
                        .sessionCreationPolicy(SessionCreationPolicy.STATELESS))
                .addFilterBefore(filter, UsernamePasswordAuthenticationFilter.class)
                .build();
    }

    public void onAuthenticationSuccess(HttpServletRequest request,
                                        HttpServletResponse response,
                                        Authentication authentication) throws IOException, ServletException {
        response.setContentType("application/json;charset=utf-8");
        User user = (User) authentication.getPrincipal();
        UserRespDTO account = userService.getUserByUsername(user.getUsername());
        String token = utils.createJwt(user, account.getId(), account.getUsername());
        AuthorizeVO authorizeVO = new AuthorizeVO();
        BeanUtils.copyProperties(account,authorizeVO);
        authorizeVO.setExpire(utils.expireTime());
//        authorizeVO.setRole(account.getRole());
        authorizeVO.setToken(token);
//        authorizeVO.setUsername(account.getUsername());
        response.getWriter().write(Results.success(authorizeVO).asJsonString());
    }

    public void onAuthenticationFailue(HttpServletRequest request,
                                       HttpServletResponse response,
                                       AuthenticationException exception) throws IOException, ServletException {
        response.setContentType("application/json;charset=utf-8");
        response.getWriter().write(Results.failure(USER_LOGIN_FAIL.code(), exception.getMessage()).asJsonString());
    }

    public void onLogoutSuccess(HttpServletRequest request,
                                HttpServletResponse response,
                                Authentication authentication) throws IOException,ServletException{
        response.setContentType("application/json;charset=utf-8");
        PrintWriter writer = response.getWriter();
        String authorization = request.getHeader("Authorization");
        if (utils.invalidateJwt(authorization)){
            writer.write(Results.success("退出登录成功！").asJsonString());
        }
        else {
            writer.write(Results.failure(USER_LOGOUT_FAIL.code(),"退出登录失败").asJsonString());
        }
    }

    public void onUnauthorized(HttpServletRequest request,
                               HttpServletResponse response,
                               AuthenticationException exception) throws IOException {
        response.setContentType("application/json;charset=utf-8");
        response.getWriter().write(Results.failure(USER_UN_AUTH.code(),exception.getMessage()).asJsonString());

    }

    // 登陆了但没有权限，例如普通用户无法访问管理员的页面
    public void AccessDeniedHandler(HttpServletRequest request, HttpServletResponse response, AccessDeniedException accessDeniedException) throws IOException, ServletException {
        response.setContentType("application/json;charset=utf-8");
        response.getWriter().write(Results.failure(USER_NO_ROLE.code(),accessDeniedException.getMessage()).asJsonString());
    }


}

