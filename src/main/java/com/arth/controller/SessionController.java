package com.arth.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.arth.entity.UserEntity;
import com.arth.repository.UserRepository;

@Controller
public class SessionController 
{
	
	@Autowired
	UserRepository userRepo;
	
	@Autowired
	BCryptPasswordEncoder bcryptPasswordEncoder;
	
	
	
	@GetMapping("signup")
	public String signUp()
	{
		return "SignUp";
	}
	
	
	@GetMapping("login")
	public String login()
	{
		return "Login";
	}
	
	@PostMapping("saveuser")
	public String saveUser(UserEntity user)
	{
		String encoPassword = bcryptPasswordEncoder.encode(user.getPassword());
		user.setPassword(encoPassword);
		
		userRepo.save(user);
		
		return "Login";
	}
	
	@PostMapping("authuser")
	public String authUSer()
	{
		return "Home";
	}
}

