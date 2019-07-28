package com.Edu.Config;

import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.PropertySource;

@Configuration
@PropertySource({"classpath:application.properties", "classpath:socialInfo.properties"})
public class AppConfig {

	/*
	모바일 설정으로 보임. 나중에 한번 더 볼 것. 지금은 일단 주석처리 (190617)
	@Bean
	public DeviceResolverHandlerInterceptor deviceResolverHandlerInterceptor() {
		return new DeviceResolverHandlerInterceptor();
	}
	*/
	
}
 
