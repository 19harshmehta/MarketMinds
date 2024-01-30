package com.arth.controller;

import java.time.LocalDate;

import java.time.ZoneId;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.arth.entity.EquityPriceDataEntity;
import com.arth.repository.EqTechRepository;
import com.arth.repository.EquityPriceDataRepository;
import com.arth.repository.EquityRepository;


@Controller
public class ChartController {

	@Autowired
	EquityPriceDataRepository eqDataRepo;
	
	@Autowired
	EquityRepository eqRepo;
	
	@Autowired
	EqTechRepository eqtech;

	
	@GetMapping("/chart")
	public String chart(@RequestParam("equityId") Integer equityId,Model model) {

		//equityId -> equity detail 
		//daily record -> date price 
		List<EquityPriceDataEntity> dailyData = eqDataRepo.findByEquityId(equityId);
		ArrayList<Double> prices = new ArrayList<>();
		ArrayList<String> date = new ArrayList<>();
//		prices.add(0.0);
		date.add(" ");
		for(EquityPriceDataEntity eqPriceDataentail : dailyData)
		{
			prices.add(eqPriceDataentail.getClosingPrice());
			LocalDate ld = eqPriceDataentail.getDate().toInstant().atZone(ZoneId.systemDefault()).toLocalDate();
			String x = ld.getDayOfMonth()+" "+ld.getMonth().name().substring(0,3) +" "+ld.getYear();
			date.add(x);
			
			
		}
		model.addAttribute("prices",prices);
		model.addAttribute("dates",date);
		
		
		model.addAttribute("eqs",eqRepo.findByEquityId(equityId));
		model.addAttribute("tech",eqtech.findByEqId(equityId));
		return "Chart";//jsp 
	}
	
	@GetMapping("/chartanalyst")
	public String chartAnalyst(@RequestParam("equityId") Integer equityId,Model model) {

		//equityId -> equity detail 
		//daily record -> date price 
		List<EquityPriceDataEntity> dailyData = eqDataRepo.findByEquityId(equityId);
		ArrayList<Double> prices = new ArrayList<>();
		ArrayList<String> date = new ArrayList<>();
//		prices.add(0.0);
		date.add(" ");
		for(EquityPriceDataEntity eqPriceDataentail : dailyData)
		{
			prices.add(eqPriceDataentail.getClosingPrice());
			LocalDate ld = eqPriceDataentail.getDate().toInstant().atZone(ZoneId.systemDefault()).toLocalDate();
			String x = ld.getDayOfMonth()+" "+ld.getMonth().name().substring(0,3) +" "+ld.getYear();
			date.add(x);
			
			
		}
		model.addAttribute("prices",prices);
		model.addAttribute("dates",date);
		
		
		model.addAttribute("eqs",eqRepo.findByEquityId(equityId));
		model.addAttribute("tech",eqtech.findByEqId(equityId));
		return "ChartAnalyst";//jsp 
	}
}

