package spring.legacy.config;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;
import org.springframework.web.servlet.handler.HandlerMappingIntrospector;

@Configuration
@EnableWebSecurity
public class SecurityConfig {

    @Value("${remember.me.key}")
    private String rememberMeKey;

    private final UserDetailsService userDetailsService;

    public SecurityConfig(UserDetailsService userDetailsService) {
        this.userDetailsService = userDetailsService;
    }

    @Bean(name = "mvcHandlerMappingIntrospector")
    public HandlerMappingIntrospector mvcHandlerMappingIntrospector() {
        return new HandlerMappingIntrospector();
    }

    @Bean
    public SecurityFilterChain filterChain(HttpSecurity http) throws Exception {
        http
                //CSRF 설정
                .csrf(csrf -> csrf.disable())
                //권한 설정
                .authorizeHttpRequests(auth -> auth
                        .requestMatchers("/", "/account/**", "/resources/**").permitAll()
                        .anyRequest().authenticated()
                )
                //로그인 설정
                .formLogin(form -> form
                        //.loginPage("/account/sign-in") //로그인 페이지 주소
                        .loginProcessingUrl("/account/login") //from action 주소
                        .usernameParameter("email")
                        .passwordParameter("password")
                        .defaultSuccessUrl("/", true) //성공시 메인
                        .permitAll()
                )
                //로그아웃 설정
                .logout(logout -> logout
                        .logoutUrl("/account/logout")
                        .logoutSuccessUrl("/")
                        .invalidateHttpSession(true)
                        .deleteCookies("JSESSIONID")
                )
                .rememberMe(remember -> remember
                        .key(rememberMeKey)
                        .tokenValiditySeconds(60 * 60 * 24) //1일 유지
                        .userDetailsService(userDetailsService)
                        .rememberMeParameter("remember-me"))

        ;
        return http.build();
    }

    @Bean
    public PasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();
    }
}
