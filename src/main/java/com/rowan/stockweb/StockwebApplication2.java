package com.rowan.stockweb;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.web.servlet.support.SpringBootServletInitializer;
import org.springframework.context.annotation.Bean;
import org.springframework.web.client.RestTemplate;

@SpringBootApplication

public class StockwebApplication2  extends SpringBootServletInitializer {

    @Bean
    public RestTemplate restTemplate() {
        return new  RestTemplate();
    }

    public static void main(String[] args) {

        SpringApplication.run(StockwebApplication2.class, args);
    }

}
