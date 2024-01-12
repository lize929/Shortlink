package com.nageoffer.shortlink.admin.filter;

import com.nageoffer.shortlink.admin.common.convention.result.Results;
import jakarta.servlet.FilterChain;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import lombok.RequiredArgsConstructor;
import org.springframework.core.annotation.Order;
import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.stereotype.Component;

import java.io.IOException;
import java.util.Optional;
import java.util.concurrent.TimeUnit;

import static com.nageoffer.shortlink.admin.common.constant.CorsConstant.ORDER_FLOW_LIMIT;
import static com.nageoffer.shortlink.admin.common.constant.FlowLimitConstant.FLOW_LIMIT_BLOCK;
import static com.nageoffer.shortlink.admin.common.constant.FlowLimitConstant.FLOW_LIMIT_COUNTER;
import static com.nageoffer.shortlink.admin.common.convention.errorcode.BaseErrorCode.CLIENT_FLOW_ERROR;

@Component
@Order(ORDER_FLOW_LIMIT)
@RequiredArgsConstructor
public class FlowLimitFilter extends HttpFilter {

    private final StringRedisTemplate stringRedisTemplate;

    @Override
    protected void doFilter(HttpServletRequest request, HttpServletResponse response, FilterChain chain) throws IOException, ServletException {
        String ip = request.getRemoteAddr();
        if (this.tryCount(ip)){
            chain.doFilter(request,response);
        }
        else {
            this.writeBlockMessage(response);
        }
    }
    private void writeBlockMessage(HttpServletResponse response) throws IOException {
        response.setContentType("application/json;charset=utf-8");
        response.setStatus(HttpServletResponse.SC_FORBIDDEN);
        response.getWriter().write(Results.failure(CLIENT_FLOW_ERROR.code(),"请求次数过多，请稍后再试!").asJsonString());
    }

    private boolean tryCount(String ip){
        synchronized (ip.intern()){
            if (Boolean.TRUE.equals(stringRedisTemplate.hasKey(FLOW_LIMIT_BLOCK + ip))){
                return false;
            }
            return this.limitPeriodCheck(ip);
        }
    }

    private boolean limitPeriodCheck(String ip){
        if (Boolean.TRUE.equals(stringRedisTemplate.hasKey(FLOW_LIMIT_COUNTER + ip))){
            long increment = Optional.ofNullable(stringRedisTemplate.opsForValue().increment(FLOW_LIMIT_COUNTER + ip)).orElse(0L);
            if (increment > 10){
                stringRedisTemplate.opsForValue().set(FLOW_LIMIT_BLOCK + ip,"",30, TimeUnit.SECONDS);
                return false;
            }
        }
        else {
            stringRedisTemplate.opsForValue().set(FLOW_LIMIT_COUNTER + ip,"1",3,TimeUnit.SECONDS);
        }
        return true;
    }

}
