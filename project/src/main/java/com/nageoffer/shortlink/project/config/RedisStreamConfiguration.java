package com.nageoffer.shortlink.project.config;

import com.nageoffer.shortlink.project.redisMq.consumer.ShortLinkStatsSaveConsumer;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.data.redis.connection.RedisConnectionFactory;
import org.springframework.data.redis.connection.stream.Consumer;
import org.springframework.data.redis.connection.stream.MapRecord;
import org.springframework.data.redis.connection.stream.ReadOffset;
import org.springframework.data.redis.connection.stream.StreamOffset;
import org.springframework.data.redis.stream.StreamMessageListenerContainer;

import java.time.Duration;
import java.util.concurrent.*;
import java.util.concurrent.atomic.AtomicInteger;

/**
 * Redis Stream消息队列配置
 */
@Configuration
@RequiredArgsConstructor
public class RedisStreamConfiguration {
    private final RedisConnectionFactory redisConnectionFactory;
    private final ShortLinkStatsSaveConsumer shortLinkStatsSaveConsumer;

    @Value("${spring.short-link.channel-topic.short-link-stats}")
    private String topic;
    @Value("${spring.short-link.channel-topic.short-link-stats-group}")
    private String group; // 消费者组

    @Bean
    public ExecutorService asyncStreamConsumer(){
        AtomicInteger index = new AtomicInteger(); // 原子对象，用于生成线程名称中的索引
        int processors = Runtime.getRuntime().availableProcessors(); // 获取当前系统的处理器数量
        return new ThreadPoolExecutor(processors, //核心线程数
                processors + processors >> 1, //最大线程数
                60, //线程空闲时间
                TimeUnit.SECONDS,
                new LinkedBlockingQueue<>(), //任务队列
                runnable -> {
                    Thread thread = new Thread(runnable);
                    thread.setName("stream_consumer_short-link_stats_" + index.incrementAndGet());
                    thread.setDaemon(true);
                    return thread;
                });
    }

    @Bean(initMethod = "start",destroyMethod = "stop")
    public StreamMessageListenerContainer<String, MapRecord<String,String,String>> streamMessageListenerContainer(ExecutorService asyncStreamConsumer){
        StreamMessageListenerContainer.StreamMessageListenerContainerOptions<String, MapRecord<String, String, String>> options =
                StreamMessageListenerContainer.StreamMessageListenerContainerOptions // 创建监听容器
                                            .builder()
                                            .batchSize(10) //一次最多获取多少条消息
                                            .executor(asyncStreamConsumer) //执行从Stream拉取到消息的任务流程
                                            .pollTimeout(Duration.ofSeconds(3)) // 如果没有拉取到消息，需要阻塞的时间，不能大于${spring.data.redis.timeout}，否则会超时
                                            .build();
        StreamMessageListenerContainer<String, MapRecord<String, String, String>> streamMessageListenerContainer =
                                            StreamMessageListenerContainer.create(redisConnectionFactory, options); // 创建 StreamMessageListenerContainer 实例，传入 Redis 连接工厂和之前定义的选项。
        streamMessageListenerContainer.receiveAutoAck(Consumer.from(group,"stats-consumer"), //配置监听容器，设置消费者组、主题、消费起始位置，并指定消息处理器。
                                            StreamOffset.create(topic, ReadOffset.lastConsumed()),
                                            shortLinkStatsSaveConsumer);
        return streamMessageListenerContainer;
    }

}
