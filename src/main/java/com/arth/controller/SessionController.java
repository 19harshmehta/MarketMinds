package com.arth.controller;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.arth.dto.LoginDto;
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
	
	
	@GetMapping(value = { "/","login"})
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
	
	@PostMapping("authenticate")
	public String authenticate(LoginDto loginDto,Model model)
	{
		
		Optional<UserEntity> opt = userRepo.findByEmail(loginDto.getEmail());

		if (opt.isPresent()) {
			UserEntity user = opt.get();
			if (bcryptPasswordEncoder.matches(loginDto.getPassword(), user.getPassword())) {
				//
				return "Home";
			}
		}
		model.addAttribute("error","Invalid Credentials...");
		return "Login";
	}
	
	@GetMapping("forgotpassword")
	public String forgotPwd()
	{
		return "ForgotPassword";
	}
	
	@PostMapping("forgotpassword")
	public String forgotPassword(LoginDto loginDto,Model model)
	{
		Optional<UserEntity> opt = userRepo.findByEmail(loginDto.getEmail());
		if(opt.isPresent())
		{
			return "ChangePassword";
		}else {
			model.addAttribute("error","Invalid email please check again or Sign up");
			return "ForgotPassword";
		}
	}
	
	@PostMapping("changepassword")
	public String changePassword()
	{
		return "Login";
	}
//	@GetMapping("login"})
//	public String root() {
//		return "Login";
//	}
	
	
}

