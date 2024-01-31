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
		eqTechnical.getSids();
		eqTechnical.scrapTechnical();
		return "Home";
	}
}
