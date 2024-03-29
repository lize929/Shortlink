package com.nageoffer.shortlink.project.redisMq.idempotent;


import lombok.RequiredArgsConstructor;
import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.stereotype.Component;

import java.util.Objects;
import java.util.concurrent.TimeUnit;

@Component
@RequiredArgsConstructor
public class MessageQueueIdempotentHandler {

    private final StringRedisTemplate stringRedisTemplate;

    private static final String IDEMPOTENT_KEY_PREFIX = "short-link:idempotent:";

    /**
     * 判断当前消息是否消费过
     * @param messageID
     * @return
     */
    public boolean isMessageProcessed(String messageID){
        String key = IDEMPOTENT_KEY_PREFIX + messageID;
        // 如果key不存在，即没消费过，则将其值设为"0"，返回true，如果key存在，则消费过，则返回false
        return Boolean.TRUE.equals(stringRedisTemplate.opsForValue().setIfAbsent(key,"0",2, TimeUnit.MINUTES));
    }

    /**
     * 消息消费流程完成后，设置key对应的值为1
     * @param messageID
     */
    public void setAccomplish(String messageID){
        String key = IDEMPOTENT_KEY_PREFIX + messageID;
        stringRedisTemplate.opsForValue().set(key, "1", 2,TimeUnit.MINUTES);
    }

    /**
     * 判断消息消费流程是否执行完成
     * @param messageID
     * @return
     */
    public boolean isAccomplish(String messageID){
        String key = IDEMPOTENT_KEY_PREFIX + messageID;
        return Objects.equals(stringRedisTemplate.opsForValue().get(key),"1");
    }

    /**
     * 如果消息处理遇到异常，删除幂等标识
     * @param messageID
     */
    public void delIdempotentKey(String messageID){
        String key = IDEMPOTENT_KEY_PREFIX + messageID;
        stringRedisTemplate.delete(key);
    }

}
