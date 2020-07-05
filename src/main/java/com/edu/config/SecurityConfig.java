package com.edu.config;

import com.edu.service.MemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.builders.WebSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.firewall.DefaultHttpFirewall;

@Configuration
public class SecurityConfig extends WebSecurityConfigurerAdapter {

    @Override
    public void configure(WebSecurity web) throws Exception {
        web.ignoring().antMatchers("/resources/**","resources/**");
        // 더블 슬래쉬 허용 관련 내용 더 찾아볼 것
        web.httpFirewall(new DefaultHttpFirewall());
    }

    @Override
    protected void configure(HttpSecurity http) throws Exception {
        http.csrf().disable();
        http.authorizeRequests()
                .antMatchers("/", "/course/selectmodifycourse/**").hasAuthority("ROLE_ADMIN")
                .antMatchers("/", "/course/addlecture/**").hasAuthority("ROLE_ADMIN")
                .antMatchers("/", "/course/addcourse/**").hasAuthority("ROLE_ADMIN")
                .antMatchers("/", "/updateData").hasAuthority("ROLE_ADMIN")
                .and()
                    .formLogin()
                    .loginPage("/")
                    .loginProcessingUrl("/loginProcess.ajax")
                    .usernameParameter("id")
                    .passwordParameter("password")
                    .successForwardUrl("/loginCheck.ajax")
                    .permitAll()
                .and()
                .httpBasic();
    }

    @Bean
    public PasswordEncoder passwordEncoder(){
        // 버전차이로 PasswordEncoderFactories.createDelegatingPasswordEncoder(); 는 사용못하는 것 같음
        return new BCryptPasswordEncoder();
    }

}
