package com.arth.controller;

import java.util.Date;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import com.arth.entity.UserEntity;
import com.arth.repository.UserRepository;


@Controller
public class UserController 
{
	
	@Autowired
	UserRepository userRepo;

	@GetMapping("/listusers")
	public String listUsers(Model model)
	{
		List<UserEntity> users = userRepo.findAll();
		model.addAttribute("users",users);
		return "ListUsers";
	}
	
	@GetMapping("/listactiveusers")
	public String listActiveUsers(Model model) {

		List<UserEntity> users = userRepo.getActiveUsers(); // List<UserEn>
		model.addAttribute("users",users);
		return "ListActiveUsers";
	}
	
	
	
	@GetMapping("/deleteuser/{userId}")
	public String deleteUser(@PathVariable("userId") Integer userId)
	{
		
		Optional<UserEntity> userOpt = userRepo.findById(userId);
		UserEntity user = userOpt.get();
		user.setDeletedAt(new Date());
		userRepo.save(user);
		return "redirect:/listactiveusers";
		
	}
}
