package iset.project.exchange.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import iset.project.exchange.entities.UserAuth;
import iset.project.exchange.repository.UserAuthRepository;
import iset.project.exchange.services.AuthService;

@RestController
@RequestMapping("auth")
public class AuthController {
	@Autowired
	AuthService auth;
	@Autowired
	UserAuthRepository rep;
	@GetMapping("/register")
	public UserAuth saveUser(@RequestBody String username, @RequestBody String password, @RequestBody String cpassword) {
		return auth.saveUser(username, password, cpassword);
	}
	@GetMapping("/users")
	public List<UserAuth> saveUser() {
		return rep.findAll();
	}
	@GetMapping("/users/")
	public UserAuth saveUser(	@RequestParam("username") String username) {
		return rep.findByUsername(username).get();
	}
}
