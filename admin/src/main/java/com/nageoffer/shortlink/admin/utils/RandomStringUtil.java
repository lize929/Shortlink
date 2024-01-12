package com.nageoffer.shortlink.admin.utils;

import java.util.Random;

public final class RandomStringUtil {
    // 随机数生成器
    private static final Random RANDOM = new Random();

    // 字符集，可以根据需要添加更多字符
    private static final String CHARACTERS = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";

    /**
     * 生成包含数字和英文字母的随机字符串
     *
     * @param length 生成字符串的长度
     * @return 生成的随机字符串
     */
    public static String generateRandomString(int length) {
        if (length <= 0) {
            throw new IllegalArgumentException("Length must be a positive number.");
        }

        StringBuilder sb = new StringBuilder(length);

        for (int i = 0; i < length; i++) {
            sb.append(CHARACTERS.charAt(RANDOM.nextInt(CHARACTERS.length())));
        }

        return sb.toString();
    }

    public static String generateRandom(){
        return generateRandomString(6);
    }

}
