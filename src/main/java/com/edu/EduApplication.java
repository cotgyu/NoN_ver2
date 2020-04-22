package com.edu;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.web.support.SpringBootServletInitializer;
import org.springframework.context.annotation.Bean;
import org.springframework.data.jpa.repository.config.EnableJpaAuditing;
import org.springframework.web.servlet.view.InternalResourceViewResolver;


@EnableJpaAuditing
@SpringBootApplication
public class EduApplication extends SpringBootServletInitializer {


	@Override
	protected SpringApplicationBuilder configure(SpringApplicationBuilder builder) {
		return builder.sources(EduApplication.class);
	}

	public static void main(String[] args) {
		SpringApplication.run(EduApplication.class, args);
	}


	// 필요 없는 설정으로 보임
//
//	@Bean
//	public InternalResourceViewResolver setupViewResolver() {
//
//		InternalResourceViewResolver resolver = new InternalResourceViewResolver();
//
//		resolver.setPrefix("/WEB-INF/jsp/");
//		resolver.setSuffix(".jsp");
//		return resolver;
//	}
//

}
