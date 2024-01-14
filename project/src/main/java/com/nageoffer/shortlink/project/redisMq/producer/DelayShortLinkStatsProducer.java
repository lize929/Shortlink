package com.nageoffer.shortlink.project.redisMq.producer;


import com.nageoffer.shortlink.project.dto.biz.ShortLinkStatsRecordDTO;
import lombok.RequiredArgsConstructor;
import org.redisson.api.RBlockingDeque;
import org.redisson.api.RDelayedQueue;
import org.redisson.api.RedissonClient;
import org.springframework.stereotype.Component;

import java.util.concurrent.TimeUnit;

import static com.nageoffer.shortlink.project.common.constant.RedisCacheConstant.DELAY_QUEUE_STATS_KEY;

@Component
@RequiredArgsConstructor

/**
 * 延迟消费短链接统计发送者
 */
public class DelayShortLinkStatsProducer {

    private final RedissonClient redissonClient;

    public void send(ShortLinkStatsRecordDTO statsRecordDTO){
        /**
         * 获取一个阻塞队列，其中的 DELAY_QUEUE_STATS_KEY 是队列的键。
         */
        RBlockingDeque<ShortLinkStatsRecordDTO> blockingDeque = redissonClient.getBlockingDeque(DELAY_QUEUE_STATS_KEY);
        /**
         * 创建一个延迟队列，该队列基于先前获取的阻塞队列。
         */
        RDelayedQueue<ShortLinkStatsRecordDTO> delayedQueue = redissonClient.getDelayedQueue(blockingDeque);
        /**
         * 消息将在5秒后才会真正进入阻塞队列，实现了延迟消费的效果。
         */
        delayedQueue.offer(statsRecordDTO,5, TimeUnit.SECONDS);
    }
}
