package com.edu.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.boot.autoconfigure.security.oauth2.resource.ResourceServerProperties;
import org.springframework.boot.autoconfigure.security.oauth2.resource.UserInfoTokenServices;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.boot.web.servlet.FilterRegistrationBean;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.PropertySource;
import org.springframework.security.oauth2.client.OAuth2ClientContext;
import org.springframework.security.oauth2.client.OAuth2RestTemplate;
import org.springframework.security.oauth2.client.filter.OAuth2ClientAuthenticationProcessingFilter;
import org.springframework.security.oauth2.client.filter.OAuth2ClientContextFilter;
import org.springframework.security.oauth2.client.resource.OAuth2ProtectedResourceDetails;
import org.springframework.security.oauth2.client.token.grant.code.AuthorizationCodeResourceDetails;
import org.springframework.security.oauth2.config.annotation.web.configuration.EnableOAuth2Client;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.web.filter.CompositeFilter;

import javax.servlet.Filter;
import java.util.ArrayList;
import java.util.List;

@Configuration
@EnableOAuth2Client
@PropertySource(value = "classpath:socialInfo.properties")
public class OAuthConfig {

    @Autowired
    @Qualifier("oauth2ClientContext")
    OAuth2ClientContext oauth2ClientContext;


    @Bean
    public Filter ssoFilter() {
        CompositeFilter filter = new CompositeFilter();
        List<Filter> filterList = new ArrayList<>();

        filterList.add(kakaoSsoFilter());
        filterList.add(googleSsoFilter());
        filter.setFilters(filterList);

        return filter;
    }


    public Filter kakaoSsoFilter() {
        OAuth2ClientAuthenticationProcessingFilter oauth2Filter = new OAuth2ClientAuthenticationProcessingFilter("/login/kakao/oauth");
        OAuth2RestTemplate oAuth2RestTemplate = new OAuth2RestTemplate(kakaoClient(), oauth2ClientContext);
        oauth2Filter.setRestTemplate(oAuth2RestTemplate);
        oauth2Filter.setTokenServices(new UserInfoTokenServices(kakaoResource().getUserInfoUri(), kakaoClient().getClientId()));
        oauth2Filter.setAuthenticationSuccessHandler(kakaoSuccessHandler());

        return oauth2Filter;
    }


    public Filter googleSsoFilter() {
        OAuth2ClientAuthenticationProcessingFilter oauth2Filter = new OAuth2ClientAuthenticationProcessingFilter("/google/googleSignInCallback");
        OAuth2RestTemplate oAuth2RestTemplate = new OAuth2RestTemplate(googleClient(), oauth2ClientContext);
        oauth2Filter.setRestTemplate(oAuth2RestTemplate);
        oauth2Filter.setTokenServices(new UserInfoTokenServices(googleResource().getUserInfoUri(), googleClient().getClientId()));
        oauth2Filter.setAuthenticationSuccessHandler(successHandler());

        return oauth2Filter;
    }

    @Bean
    public AuthenticationSuccessHandler successHandler(){
        return (request, response, authentication) -> {

            response.sendRedirect("/login/googleSignIn");
        };
    }


    @Bean
    public AuthenticationSuccessHandler kakaoSuccessHandler(){
        return (request, response, authentication) -> {

            response.sendRedirect("/login/kakaoSignin");
        };
    }


    @Bean
    @ConfigurationProperties(prefix = "google.client")
    public OAuth2ProtectedResourceDetails googleClient() {
        return new AuthorizationCodeResourceDetails();
    }

    @Bean
    @ConfigurationProperties(prefix = "google.resource")
    public ResourceServerProperties googleResource() {
        return new ResourceServerProperties();
    }



    @Bean
    @ConfigurationProperties(prefix = "kakao.client")
    public OAuth2ProtectedResourceDetails kakaoClient() {
        return new AuthorizationCodeResourceDetails();
    }


    @Bean
    @ConfigurationProperties(prefix = "kakao.resource")
    public ResourceServerProperties kakaoResource() {
        return new ResourceServerProperties();
    }



    @Bean
    public FilterRegistrationBean oauth2ClientFilterRegistration(OAuth2ClientContextFilter filter) {
        FilterRegistrationBean registration = new FilterRegistrationBean();
        registration.setFilter(filter);
        registration.setOrder(-100);
        return registration;
    }
}