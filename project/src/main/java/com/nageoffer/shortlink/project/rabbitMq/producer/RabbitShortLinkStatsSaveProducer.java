package com.nageoffer.shortlink.project.rabbitMq.producer;

import lombok.RequiredArgsConstructor;
import org.springframework.amqp.rabbit.core.RabbitTemplate;
import org.springframework.stereotype.Component;

import java.util.Map;

@Component
@RequiredArgsConstructor
public class RabbitShortLinkStatsSaveProducer {
    private final RabbitTemplate rabbitTemplate;

    public void send(Map<String,String> producerMap){
        rabbitTemplate.convertAndSend("short_link:stats",producerMap);
    }

}
