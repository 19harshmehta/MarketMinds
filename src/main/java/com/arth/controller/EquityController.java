package com.arth.controller;


import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;

import com.arth.repository.EquityRepository;


@Controller
public class EquityController 
{
	
	@Autowired
	EquityRepository eqRepo;
	
	
	@GetMapping("/listequity")
	public String listEquity(@RequestParam("portfolioId") Integer portfolioId, Model model)
	{
		model.addAttribute("eqs",eqRepo.findAll());
		return "ListEquity";
	}
	
	@GetMapping("/listequityadmin")
	public String listEquityAdmin(Model model)
	{
		model.addAttribute("eqs",eqRepo.findAll());
		return "ListEquityAdmin";
	}
	
	@GetMapping("/listequityuser")
	public String listEquityUser(Model model)
	{
		model.addAttribute("eqs",eqRepo.findAll());
		return "ListEquityUser";	
	}
	
	
	
	
	
	
	
	
	
	
	
	
////		@Autowired
////		CsvService csvservice;
//	
//	
//		@GetMapping("equity")
//		public String getEquity()
//		{
////			csvservice.saveCsvData("C:\\Users\\HP\\Downloads");
////			System.out.println("data imported");
//			return "AddEquity";
//		}
//		
//		@PostMapping("addequity")
//		public String postEquityByUpload(@RequestParam("file") MultipartFile file)
//		{
//			
//			return "AddEquity";
//		}
	
	
		
	
	

}
