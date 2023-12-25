package com.arth.controller;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.arth.repository.EquityRepository;
import com.arth.repository.UserRepository;

@Controller
public class AdminController {

	@Autowired
	EquityRepository eqRepo;
	
	@Autowired
	UserRepository userRepo;
	
	@GetMapping("/dashboard")
	public String dashboard(Model model) {
		model.addAttribute("eqs",eqRepo.findAll());
		
		return "Dashboard";
		
		
	}
	
	@GetMapping("/admin-myprofile")
	public String myProfile() 
	{
		return "Admin-Myprofile";
	}	
}
