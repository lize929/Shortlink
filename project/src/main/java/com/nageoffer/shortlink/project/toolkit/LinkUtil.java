package com.nageoffer.shortlink.project.toolkit;

import cn.hutool.core.date.DateUnit;
import cn.hutool.core.date.DateUtil;
import cn.hutool.core.util.StrUtil;
import jakarta.servlet.http.HttpServletRequest;

import java.net.URI;
import java.net.URISyntaxException;
import java.util.Date;
import java.util.Optional;
import static com.nageoffer.shortlink.project.common.constant.ShortLinkConstant.*;

public class LinkUtil {
    /**
     * 获取短链接缓存有效时间7
     * @param validDate
     * @return
     */
    public static long getLinkCacheValidDate(Date validDate){
        Long result = Optional.ofNullable(validDate)
                .map(each -> DateUtil.between(new Date(),each, DateUnit.MS))
                .orElse(DEFAULT_CACHE_VALID_TIME);
        return result;
    }

    /**
     * 获取用户真实ip
     * @param request
     * @return
     */
    public static String getUserIp(HttpServletRequest request) {
        String ip = request.getHeader("X-Forwarded-For");
        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
            ip = request.getHeader("Proxy-Client-IP");
        }
        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
            ip = request.getHeader("WL-Proxy-Client-IP");
        }
        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
            ip = request.getHeader("HTTP_CLIENT_IP");
        }
        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
            ip = request.getHeader("HTTP_X_FORWARDED_FOR");
        }
        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
            ip = request.getRemoteAddr();
        }
        return ip;
    }

    public static String detectUserOS(HttpServletRequest request) {
        String userAgent = request.getHeader("User-Agent");
        return getUserOS(userAgent);
    }

    private static String getUserOS(String userAgent) {
        if (userAgent.toLowerCase().contains("windows")) {
            return "Windows";
        } else if(userAgent.toLowerCase().contains("mac")) {
            return "MacOS";
        } else if(userAgent.toLowerCase().contains("x11")) {
            return "Unix";
        } else if(userAgent.toLowerCase().contains("android")) {
            return "Android";
        } else if(userAgent.toLowerCase().contains("iphone")) {
            return "iOS";
        } else {
            return "Unknown";
        }
    }

    /**
     * 获取用户浏览器类型
     * @param request
     * @return
     */
    public static String getBrowser(HttpServletRequest request) {
        String userAgent = request.getHeader("User-Agent");
        if (userAgent.toLowerCase().contains("edg")) {
            return "Microsoft Edge";
        } else if (userAgent.toLowerCase().contains("chrome")) {
            return "Google Chrome";
        } else if (userAgent.toLowerCase().contains("firefox")) {
            return "Mozilla Firefox";
        } else if (userAgent.toLowerCase().contains("safari")) {
            return "Apple Safari";
        } else if (userAgent.toLowerCase().contains("opera")) {
            return "Opera";
        } else if (userAgent.toLowerCase().contains("msie") || userAgent.toLowerCase().contains("trident")) {
            return "Internet Explorer";
        } else {
            return "Unknown";
        }
    }

    /**
     * 获取用户访问设备
     *
     * @param request 请求
     * @return 访问设备
     */
    public static String getDevice(HttpServletRequest request) {
        String userAgent = request.getHeader("User-Agent");
        if (userAgent.toLowerCase().contains("mobile")) {
            return "Mobile";
        }
        return "PC";
    }

    /**
     * 获取用户访问网络
     *
     * @param request 请求
     * @return 访问设备
     */
    public static String getNetwork(HttpServletRequest request) {
        String actualIp = getUserIp(request);
        // 这里简单判断IP地址范围，您可能需要更复杂的逻辑
        // 例如，通过调用IP地址库或调用第三方服务来判断网络类型
        // TODO 这里有问题
        return actualIp.startsWith("192.168.") || actualIp.startsWith("10.") ? "WIFI" : "MOBILE";
    }

    public static String extractDomain(String originUrl) {
        String domain = null;
        try{
            URI uri = new URI(originUrl);
            String host = uri.getHost();
            if (StrUtil.isNotBlank(host)){
                domain = host;
                if (domain.startsWith("www.")){
                    domain = domain.substring(4);
                }
            }
        } catch (Exception ignored) {
        }
        return domain;
    }
}
