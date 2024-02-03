package com.arth.controller;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.arth.entity.PortfolioEntity;
import com.arth.repository.PortfolioRepository;

import jakarta.servlet.http.HttpSession;

@Controller
public class PortfolioController {
	@Autowired
	PortfolioRepository portfolioRepo;

	@GetMapping("/createportfolio")
	public String createPortfolio(HttpSession session) {
		
		Integer portfolioCount = portfolioRepo.countPortfolio((Integer) session.getAttribute("userId"));
		System.out.println(portfolioCount);
		if((Integer)session.getAttribute("premiumInd")==0 && portfolioCount < 1 ) {
			System.out.println("in if");
			return "CreatePortfolio";
		}else if ((Integer)session.getAttribute("premiumInd")==1 && portfolioCount < 5 ) {
			return "CreatePortfolio";
		}
		else {
			return "Home";
		}		
	}

	@PostMapping("/saveportfolio")
	public String savePortfolio(PortfolioEntity portfolio, HttpSession session) {
		Date date = new Date();
		portfolio.setUserId((Integer) session.getAttribute("userId"));
		portfolio.setCreatedAt(date);
		portfolioRepo.save(portfolio);

		return "redirect:/listportfolio";
	}

	@GetMapping("/test")
	public String testDemo() {
		return "AddToPortfolio";
	}
	

	@GetMapping("/listportfolio")
	public String listPortfolio(Model model, HttpSession session) {
		Integer userId = (Integer) session.getAttribute("userId");
		List<PortfolioEntity> portfolios = portfolioRepo.findByUserId(userId);
		model.addAttribute("portfolios", portfolios);

		return "ListPortfolio";
	}

}
