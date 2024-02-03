package com.arth.controller;

import java.util.Date;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import com.arth.entity.PortfolioEntity;
import com.arth.repository.PortfolioRepository;

import jakarta.servlet.http.HttpSession;

@Controller
public class PortfolioController {
	@Autowired
	PortfolioRepository portfolioRepo;

	@GetMapping("/createportfolio")
	public String createPortfolio(HttpSession session,Model model) {
		Integer portfolioCount = portfolioRepo.countPortfolio((Integer) session.getAttribute("userId"));
		System.out.println(portfolioCount);
		if((Integer)session.getAttribute("premiumInd")==0 && portfolioCount < 1 ) {
			System.out.println("in if");
			return "CreatePortfolio";
		}else if ((Integer)session.getAttribute("premiumInd")==1 && portfolioCount < 5 ) {
			return "CreatePortfolio";
		}
		else {
			
			if((Integer)session.getAttribute("premiumInd")==0) {
				String m1 = "You are not a Premium use <a href='/upgradetopremium'><strong>Click Here !</strong></a> to become a premium User";
				System.out.println("else => if "+m1);
				model.addAttribute("m",m1);
				return "redirect:/listportfolio?m="+m1;
		
			}else {
				String m2 = "You are trying to create more number of Portfolio then specified <a href='/upgradetopremium'><strong>Click Here !</strong></a> to Upgrade Your Plan";
				System.out.println("else => if "+m2);
				model.addAttribute("m", m2);
				return "redirect:/listportfolio";
			}
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
