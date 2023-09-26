package com.arth.controller;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import com.arth.services.EquityScrapService;

@Controller
public class EquityScrapController 
{
	@Autowired
	EquityScrapService eqScrapService;

	@GetMapping("/scrap")
	public String scrap()
	{
		System.out.println("in scrap");
		
		Runnable r = () ->{	
			eqScrapService.scrapPriceForDb();
		};
		
		Thread t = new Thread(r);
		t.start();
		
		return "redirect:/listequity";
	}


}
