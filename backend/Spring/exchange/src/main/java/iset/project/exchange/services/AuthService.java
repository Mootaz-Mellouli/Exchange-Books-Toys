package iset.project.exchange.services;

import java.util.ArrayList;
import java.util.Collection;
import java.util.HashSet;
import java.util.List;
import java.util.Objects;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import iset.project.exchange.entities.Role;
import iset.project.exchange.entities.UserAuth;
import iset.project.exchange.repository.UserAuthRepository;
import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class AuthService implements UserDetailsService {
	@Autowired
	private UserAuthRepository userRepository;
	@Autowired
	private BCryptPasswordEncoder bCryptPasswordEncoder;
	@Autowired
	public AuthService(UserAuthRepository userRepository) {
		this.userRepository = userRepository;
	}
	public UserAuth saveUser(String username, String password , String role) {
		UserAuth appUser= new UserAuth();
		System.out.println(role);
	    if(userRepository.findByUsername(username).isPresent()==true)
	        throw new RuntimeException("User already exists");
	   /* if(!password.equals(confirmedPassword))
	        throw new RuntimeException("Please confirm your password");*/
	    appUser.setUsername(username);
	     //appUser.setEnabled(true);
		 Set<Role> roles = new HashSet<>();
	    if(role.equals("User")) {
			roles.add(new Role(2,"USER"));
	    } else if(role.equals("Association")) {
			roles.add(new Role(3,"ASSOCIATION"));
	    } else if(role.equals("Maison_de_retrait")) {
			roles.add(new Role(4,"M_RETRAIT"));
	    }
	    else if(role.equals("Admin")) {
			roles.add(new Role(1,"ADMIN"));
	    }
		appUser.setRoles(roles);
		appUser.setPassword(bCryptPasswordEncoder.encode(password));
		return userRepository.save(appUser);
	}
	
	public UserAuth changeRole(String id, String role) {    
		UserAuth appUser= userRepository.findById(id).get();
		Role r = new Role();
		for(Role ro : appUser.getRoles()) {
			r = new Role(ro.getId(), ro.getName());
	    }
		 Set<Role> roles = new HashSet<>();
		 if(r!=null) {
			 roles.add(r);
		 }
	    if(role.equals("User")) {
			roles.add(new Role(2,"USER"));
	    } else if(role.equals("Association")) {
			roles.add(new Role(3,"ASSOCIATION"));
	    } else if(role.equals("Maison_de_retrait")) {
			roles.add(new Role(4,"M_RETRAIT"));
	    }
		appUser.setRoles(roles);
		return userRepository.save(appUser);
	}
	
	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
	Objects.requireNonNull(username);
	UserAuth user = userRepository.findByUsername(username)
	.orElseThrow(() -> new UsernameNotFoundException("User not found"));
	Collection<GrantedAuthority> authorities=new ArrayList<>();
	user.getRoles().forEach(r->{
	 authorities.add(new SimpleGrantedAuthority(r.getName()));
	});
	return new org.springframework.security.core.userdetails.User(user.getUsername(),user.getPassword(),authorities);
	}
}
