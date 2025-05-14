package com.skillpilots;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.web.servlet.support.SpringBootServletInitializer;
import org.springframework.scheduling.annotation.EnableScheduling;

@SpringBootApplication
@EnableScheduling
public class NewdemoApplication extends SpringBootServletInitializer {
	
	@Override
	   protected SpringApplicationBuilder configure (SpringApplicationBuilder builder) {
	       return builder.sources(NewdemoApplication.class);
	   }

	public static void main(String[] args) {
		SpringApplication.run(NewdemoApplication.class, args);
	}

}
