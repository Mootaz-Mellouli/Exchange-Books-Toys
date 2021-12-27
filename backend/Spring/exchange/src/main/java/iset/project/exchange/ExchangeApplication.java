package iset.project.exchange;

import java.util.Arrays;
import java.util.HashSet;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Bean;
import org.springframework.web.cors.CorsConfiguration;
import org.springframework.web.cors.UrlBasedCorsConfigurationSource;
import org.springframework.web.filter.CorsFilter;

import iset.project.exchange.entities.Role;
import  iset.project.exchange.entities.UserAuth;
import iset.project.exchange.repository.RoleRepository;
import iset.project.exchange.services.AuthService;;

@SpringBootApplication
public class ExchangeApplication implements CommandLineRunner{
	@Autowired
	RoleRepository roleRep;
	@Autowired
	AuthService authService;
	
	public static void main(String[] args) {
		SpringApplication.run(ExchangeApplication.class, args);
	}
	
	//Angular configuration
	@Bean
	public CorsFilter corsFilter() {
		CorsConfiguration corsConfiguration = new CorsConfiguration();
		corsConfiguration.setAllowCredentials(true);
		corsConfiguration.setAllowedOrigins(Arrays.asList("http://localhost:4200"));
		corsConfiguration.setAllowedHeaders(Arrays.asList("Origin", "Access-Control-Allow-Origin", "Content-Type",
				"Accept", "Authorization", "Origin, Accept", "X-Requested-With",
				"Access-Control-Request-Method", "Access-Control-Request-Headers"));
		corsConfiguration.setExposedHeaders(Arrays.asList("Origin", "Content-Type", "Accept", "Authorization",
				"Access-Control-Allow-Origin", "Access-Control-Allow-Origin", "Access-Control-Allow-Credentials"));
		corsConfiguration.setAllowedMethods(Arrays.asList("GET", "POST", "PUT", "DELETE", "OPTIONS"));
		UrlBasedCorsConfigurationSource urlBasedCorsConfigurationSource = new UrlBasedCorsConfigurationSource();
		urlBasedCorsConfigurationSource.registerCorsConfiguration("/**", corsConfiguration);
		return new CorsFilter(urlBasedCorsConfigurationSource);
	}

	@Override
	public void run(String... args) throws Exception {
		// TODO Auto-generated method stub
		Role adminRole= roleRep.save(new Role(1, "ADMIN"));
		Role userRole= roleRep.save(new Role(2, "USER"));
		Role assRole= roleRep.save(new Role(3, "ASSOCIATION"));
	
		//UserAuth admin = authService.saveUser("ADMIN", "ADMIN", "ADMIN");
	}
}
