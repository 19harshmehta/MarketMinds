package com.arth.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.arth.services.EquityTechnicalScrapService;

@Controller
public class ScapTechnicalEqController 
{
	@Autowired
	EquityTechnicalScrapService eqTechnical;
	
	@GetMapping("/technicals")
	public String scapTechnical()
	{
		try 
		{
			Runnable r = () ->{
				
			};
			Thread t = new Thread(r);
			t.start();
			eqTechnical.scrapTechnical();
			System.out.println("in Tech scrap");
		}catch(Exception e) {
			e.printStackTrace();
			
		}
//		eqTechnical.getSids();
//		eqTechnical.scrapTechnical();
		return "Home";
	}
}
