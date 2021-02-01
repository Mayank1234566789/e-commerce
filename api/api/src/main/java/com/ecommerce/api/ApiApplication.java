package com.ecommerce.api;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;


@EnableAutoConfiguration
@EnableJpaRepositories(basePackages = { "com.ecommerce.*"})
@SpringBootApplication(scanBasePackages={
		"com.ecommerce.*"})
//@ComponentScan(basePackages= {"com.ecommerce.controller","com.ecommerce.repository"})
public class ApiApplication {

	public static void main(String[] args) {
		SpringApplication.run(ApiApplication.class, args);
	}

}
