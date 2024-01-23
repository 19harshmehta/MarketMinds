package com.arth.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.arth.repository.EquityRepository;

@Controller
public class ChartController {

	@Autowired
	EquityRepository eqRepo;
	
	@GetMapping("/chart")
	public String chart(@RequestParam("equityId") Integer equityId,Model model) {

		//equityId -> equity detail 
		//daily record -> date price 
		
		return "Chart";//jsp 
	}
}

