package com.nageoffer.shortlink.project.redisMq.consumer;

import com.nageoffer.shortlink.project.dto.biz.ShortLinkStatsRecordDTO;
import com.nageoffer.shortlink.project.service.ShortLinkService;
import lombok.RequiredArgsConstructor;
import org.redisson.api.RBlockingDeque;
import org.redisson.api.RDelayedQueue;
import org.redisson.api.RedissonClient;
import org.springframework.beans.factory.InitializingBean;
import org.springframework.stereotype.Component;

import java.util.concurrent.Executors;
import java.util.concurrent.locks.LockSupport;

import static com.nageoffer.shortlink.project.common.constant.RedisCacheConstant.DELAY_QUEUE_STATS_KEY;

@Component
@RequiredArgsConstructor
public class DelayShortLinkStatsConsumer implements InitializingBean {

    private final RedissonClient redissonClient;
    private final ShortLinkService shortLinkService;

    /**
     * 这段代码的作用是创建一个单线程的消息消费者，不断地从延迟队列中获取短链接统计消息，并通过 ShortLinkService 处理这些消息。
     * 它保证了在系统启动时就能启动消息消费逻辑。
     */

    public void onMessage() {
        Executors.newSingleThreadExecutor(
                runnable -> {
                    Thread thread = new Thread(runnable);
                    thread.setName("delay_short-link_stats_consumer");
                    thread.setDaemon(Boolean.TRUE); // 守护线程，常用于定时任务或者在后台处理一些工作，而不需要等待所有任务执行完毕。
                    return thread;
                })
                .execute(() -> {
                    RBlockingDeque<ShortLinkStatsRecordDTO> blockingDeque = redissonClient.getBlockingDeque(DELAY_QUEUE_STATS_KEY);
                    RDelayedQueue<ShortLinkStatsRecordDTO> delayedQueue = redissonClient.getDelayedQueue(blockingDeque);
                    for (;;){
                        try {
                            ShortLinkStatsRecordDTO statsRecord = delayedQueue.poll();
                            if (statsRecord != null){
                                shortLinkService.shortLinkStats(null,null,statsRecord);
                                continue;
                            }
                            LockSupport.parkUntil(500);
                        }
                        catch (Throwable ignored){
                        }
                    }
                });
    }

    @Override
    public void afterPropertiesSet() throws Exception {
        onMessage();
    }
}
