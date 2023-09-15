package com.arth.controller;



import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.arth.entity.PortfolioEntity;
import com.arth.repository.PortfolioRepository;

import jakarta.servlet.http.HttpSession;



@Controller
public class PortfolioController 
{
	@Autowired
	PortfolioRepository portfolioRepo;
	
	@GetMapping("/createportfolio")
	public String createPortfolio() {
		return "CreatePortfolio";
	}
	
	@PostMapping("/saveportfolio")
	public String savePortfolio(PortfolioEntity portfolio,HttpSession session) {
		
		Date date = new Date(); 
		portfolio.setUserId((Integer)session.getAttribute("userId"));
		portfolio.setCreatedAt(date);
		portfolioRepo.save(portfolio);
		
		return "redirect:/listequity";
	}
	
	
	
	 
	
	
	
}
