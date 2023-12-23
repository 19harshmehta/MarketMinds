package com.arth.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.arth.repository.EquityRepository;

@Controller
public class AdminController {

	@Autowired
	EquityRepository eqRepo;
	
	@GetMapping("/dashboard")
	public String dashboard(Model model) {
		model.addAttribute("eqs",eqRepo.findAll());
		
		return "Dashboard";
	}
}
