package com.arth.controller;


import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.arth.entity.PortfolioDetailEntity;
import com.arth.entity.PortfolioEntity;
import com.arth.repository.PortfolioDetailRepository;
import com.arth.repository.PortfolioRepository;
import com.arth.services.PortfolioDetailService;
import com.arth.services.PortfolioService;

import jakarta.servlet.http.HttpSession;

@Controller
public class PortfolioDetailController {

	@Autowired
	PortfolioDetailRepository pfDetailRepo;
	
	@Autowired
	PortfolioRepository pfRepo;
	
	
	@Autowired
    private PortfolioService portfolioService;
	
	@Autowired
	private PortfolioDetailService pfDetailService;
    	
	@GetMapping("addequity/{equityId}")
	public String addEquity(@PathVariable("equityId") Integer eqId) 
	{
//		model.addAttribute("eqId",eqId);
		return "AddEquityToPortfolio";
	}
	
	@PostMapping("addequity/saveequity")
	public String saveEquity(@RequestParam("equityId") Integer equityId,HttpSession session,PortfolioDetailEntity pfDetailEntity)
	{
		
		Optional<PortfolioEntity> opt = pfRepo.findByUserId((Integer)session.getAttribute("userId"));
		if(opt.isPresent())
		{
			PortfolioEntity pfEntity = opt.get();
			pfDetailEntity.setPortfolioId(pfEntity.getPortfolioId());
		}
		pfDetailEntity.setEquityId(equityId);
		System.out.println(pfDetailEntity.getPurchasedAt());
		pfDetailRepo.save(pfDetailEntity);
		System.out.println("Stock Added Sucess");
		return "redirect:/home";
	}
	

	@GetMapping("listmypoerfolio")
	public String getAllEquityData(Model model,HttpSession session)
	{
		Optional<PortfolioEntity> portfolio = portfolioService.getPortfolioByUserId((Integer)session.getAttribute("userId"));
		
		if(portfolio.isPresent()) {
			model.addAttribute("portfolioData",portfolio.get());
//			List<PortfolioDetailEntity> getdetails  = pfDetailService.getDetailsByPortfolioId(portfolio.get().getPortfolioId());
//			List<PortfolioDetailEntity> pfDetails = pfDetailRepo.findByEquityIdAndPortfolioId(getdetails.get(0).getEquityId(),portfolio.get().getPortfolioId());
//			model.addAttribute("pfDetails",pfDetails);
			return "MyPortfolio";
		}else {
			return null;
		}
        
        

        // Handle cases where data is not present

        
    }
		

	
	
	
}
