
package com.arth;

import org.springframework.boot.SpringApplication;

import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Bean;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

@SpringBootApplication
public class MarketMindsApplication {

	public static void main(String[] args) {
		SpringApplication.run(MarketMindsApplication.class, args);
	}
	
	@Bean
	BCryptPasswordEncoder createBcrypt()
	{
		return new BCryptPasswordEncoder();
	}

}
