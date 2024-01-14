package com.nageoffer.shortlink.project.config;

import com.nageoffer.shortlink.project.rabbitMq.consumer.RabbitShortLinkStatsSaveConsumer;
import lombok.RequiredArgsConstructor;
import org.springframework.amqp.core.Queue;
import org.springframework.amqp.core.QueueBuilder;
import org.springframework.amqp.rabbit.connection.ConnectionFactory;
import org.springframework.amqp.rabbit.listener.SimpleMessageListenerContainer;
import org.springframework.amqp.rabbit.listener.adapter.MessageListenerAdapter;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.scheduling.concurrent.ThreadPoolTaskExecutor;

@Configuration
@RequiredArgsConstructor
public class RabbitConfiguration {
    private final RabbitShortLinkStatsSaveConsumer rabbitShortLinkStatsSaveConsumer;

    @Value("${spring.short-link.rabbit.queue}")
    private String queueName;

    @Bean("short-link_stats")
    public Queue shortLinkStatsQueue(){
        return QueueBuilder
                .durable(queueName)
                .build();
    }

    @Bean
    public SimpleMessageListenerContainer rabbitMQMessageListenerContainer(ConnectionFactory connectionFactory) {
        SimpleMessageListenerContainer container = new SimpleMessageListenerContainer();
        container.setConnectionFactory(connectionFactory);
        container.setQueues(shortLinkStatsQueue());
        // Use MessageListenerAdapter to adapt RabbitShortLinkStatsSaveConsumer to MessageListener
        MessageListenerAdapter listenerAdapter = new MessageListenerAdapter(rabbitShortLinkStatsSaveConsumer, "onMessage");
        container.setMessageListener(listenerAdapter);
        container.setConcurrentConsumers(Runtime.getRuntime().availableProcessors());
        container.setMaxConcurrentConsumers(Runtime.getRuntime().availableProcessors() / 2);
        container.setAutoStartup(true);
        return container;
    }
}
