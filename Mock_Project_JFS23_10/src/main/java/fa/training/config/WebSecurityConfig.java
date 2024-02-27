package fa.training.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;

import fa.training.service.impl.UserDetailServiceImpl;

@Configuration
@EnableWebSecurity
public class WebSecurityConfig extends WebSecurityConfigurerAdapter {
	
	@Autowired
	UserDetailServiceImpl userDetailServiceImpl;
	
	@Bean
	public PasswordEncoder passwordEncoder() {
		return new BCryptPasswordEncoder();
	}
	
	@Override
	protected void configure(HttpSecurity http) throws Exception {
		http.csrf().disable();
		
		http.authorizeRequests().antMatchers("/resources/**", "/css/**", "/js/**", "/images/**", "/fonts/**").permitAll(); // Allow access to static resources
		
		http
		//phân quyền
		.authorizeRequests()
		.antMatchers("/", "/index", "/shop", "/about", "/cart", "/contact", "/login", "/register", "/forgot-password").permitAll()
		//chứng thực
		.anyRequest().authenticated();
		
		http.formLogin()
		// Submit URL of login page.
		.loginProcessingUrl("/j_spring_security_check") //Submit URL/action form
		.loginPage("/login").permitAll()
		.defaultSuccessUrl("/index", true)
		.failureUrl("/login?error=true")
		.usernameParameter("username")//
		.passwordParameter("password")
		// Config for Logout Page
		.and().logout().logoutUrl("/logout")
		.logoutSuccessUrl("/login")
		.and()
        .rememberMe().rememberMeParameter("remember-me").tokenValiditySeconds(10)
        ;
	}
	
	@Override
	protected void configure(AuthenticationManagerBuilder auth) throws Exception {
		auth.userDetailsService(userDetailServiceImpl).passwordEncoder(passwordEncoder());
	}
	
	@Override
    @Bean
    public AuthenticationManager authenticationManagerBean() throws Exception {
        return super.authenticationManagerBean();
    }
}
