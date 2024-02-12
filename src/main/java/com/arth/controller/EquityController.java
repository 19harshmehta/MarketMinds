package com.arth.controller;


import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.arth.entity.EquityEntity;
import com.arth.repository.EquityRepository;
import com.arth.services.EquityScrapService;


@Controller
public class EquityController 
{
	
	@Autowired
	EquityRepository eqRepo;
	@Autowired
	EquityScrapService eqService;
	
	
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
	
	@GetMapping("/setbuyind")
	public String setBuyInd(@RequestParam("equityId") Integer equityId)
	{
		Optional<EquityEntity> eqOpt = eqRepo.findById(equityId);
		EquityEntity eqs = eqOpt.get();
		if(eqs.getBuysellInd()==1)
		{
			eqs.setBuysellInd(0);
		}
		else {
			eqs.setBuysellInd(1);
		}
		eqRepo.save(eqs);
		return "redirect:/analystdashboard";
	}
	
	@GetMapping("/setsellind")
	public String setSellInd(@RequestParam("equityId") Integer equityId)
	{
		Optional<EquityEntity> eqOpt = eqRepo.findById(equityId);
		EquityEntity eqs = eqOpt.get();
		if(eqs.getBuysellInd()==2)
		{
			eqs.setBuysellInd(0);
		}
		else {
			eqs.setBuysellInd(2);
		}
		eqRepo.save(eqs);
		return "redirect:/analystdashboard";
	}
	
	@GetMapping("/today")
	public String temp() 
	{
		eqService.scrapTodayOpen();
		return "Home";
	}
	
	@GetMapping("/close")
	public String temp2() 
	{
		eqService.scrapTodayClose();
		return "Home";
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
