package com.arth.controller;

import java.math.BigDecimal;

import java.sql.Date;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.arth.dto.PortfolioDetailDto;
import com.arth.entity.AlertEntity;
import com.arth.entity.PortfolioDetailEntity;
import com.arth.entity.PortfolioEntity;
import com.arth.repository.AlertRepository;
import com.arth.repository.PortfolioDetailRepository;
import com.arth.repository.PortfolioRepository;
import com.arth.services.PortfolioService;

import jakarta.servlet.http.HttpSession;

@Controller
public class PortfolioDetailController {

	@Autowired
	PortfolioDetailRepository pfDetailRepo;

	@Autowired
	PortfolioRepository portfolioRepository;

	@Autowired
	PortfolioRepository pfRepo;

	@Autowired
	private PortfolioService portfolioService;
	
	@Autowired
	AlertRepository alertRepo;

	
	@GetMapping("addequity")
	public String addEquity(@RequestParam("equityId") Integer eqId,@RequestParam("portfolioId") Integer portfolioId,Model model) {
//		model.addAttribute("eqId",eqId);
		model.addAttribute("jj",eqId);
		model.addAttribute("portfolioId",portfolioId);
		return "AddToPortfolio";
	}

	@PostMapping("saveequity")
	public String saveEquity(@RequestParam("equityId") Integer equityId,@RequestParam("portfolioId") Integer portfolioId, HttpSession session,
			PortfolioDetailEntity pfDetailEntity) {

	 
		pfDetailEntity.setEquityId(equityId);
		pfDetailEntity.setBsInd("buy");
		System.out.println(pfDetailEntity.getPurchasedAt());
		pfDetailRepo.save(pfDetailEntity);
		System.out.println("Stock Added Sucess");
		return "redirect:/listmyportfolio?portfolioId="+portfolioId;
	}

	
	
	@PostMapping("restructure")
	public String restructureEquity(@RequestParam("equityId") Integer equityId,@RequestParam("portfolioId") Integer portfolioId, HttpSession session,
			PortfolioDetailEntity pfDetailEntity) {

		if(pfDetailEntity.getBsInd().equals("buy")) {
			pfDetailEntity.setEquityId(equityId);
			System.out.println(pfDetailEntity.getPurchasedAt());
			pfDetailRepo.save(pfDetailEntity);
			System.out.println("Stock Added Sucess");
			return "redirect:/listmyportfolio?portfolioId="+portfolioId;
		}else {
			pfDetailEntity.setEquityId(equityId);
			pfDetailEntity.setQty(-pfDetailEntity.getQty());
			System.out.println(pfDetailEntity.getPurchasedAt());
			pfDetailRepo.save(pfDetailEntity);
			System.out.println("Stock Added Sucess");
			return "redirect:/listmyportfolio?portfolioId="+portfolioId;
		}
	}


	@GetMapping("/listmyportfolio")
	public String getAllEquityData(@RequestParam("portfolioId") Integer portfolioId, Model model, HttpSession session) {
		List<PortfolioDetailDto> pfd = new ArrayList<>();
		List<PortfolioEntity> portfolio = portfolioService
				.getPortfolioByUserId((Integer) session.getAttribute("userId"));
	 
	//
		PortfolioEntity pf = portfolioRepository.findById(portfolioId).get();
		
		
		if (portfolio.size() != 0) {
			model.addAttribute("portfolioData", pf);
		
				
			List<Object[]> obj = pfDetailRepo.getData(portfolioId);
			for(Object o[]: obj)
			{
				String equityName = (String) o[0];
				Double lastTradePrice = (Double) o[1];
				Double totalInvestment = (Double) o[3];
				BigDecimal qty = (BigDecimal) o[4];
				Double purchasedPrice = (Double) o[2];
			 	Date purchasedAt = (Date) o[5];
			 	Integer eqId = (Integer) o[6];
			 	PortfolioDetailDto pfdDto = new PortfolioDetailDto();
			 	pfdDto.setEquityName(equityName);
			 	pfdDto.setLastTradePrice(lastTradePrice);
			 	pfdDto.setPurchasedAt(purchasedAt);
			 	pfdDto.setPurchasedPrice(purchasedPrice);
			 	pfdDto.setQty(qty);
			 	pfdDto.setTotalInvestment(totalInvestment);
			 	pfdDto.setEquityId(eqId);
			 	
			 	pfd.add(pfdDto);
			 	
			}
			model.addAttribute("pfd",pfd);
			System.out.println(portfolio.get(0).getEquities().size());

//			List<PortfolioDetailEntity> getdetails  = pfDetailService.getDetailsByPortfolioId(portfolio.get().getPortfolioId());
//			List<PortfolioDetailEntity> pfDetails = pfDetailRepo.findByEquityIdAndPortfolioId(getdetails.get(0).getEquityId(),portfolio.get().getPortfolioId());
//			model.addAttribute("pfDetails",pfDetails);  
			return "MyPortfolio";
		} else {
			return null;
		}

		// Handle cases where data is not present

	}
	
	@GetMapping("settarget")
	public String setTarget(@RequestParam("equityId") Integer equityId,Model model,HttpSession session) {
		Integer alertCount = alertRepo.allAlertsCount((Integer) session.getAttribute("userId"));
		Integer premiumInd = (Integer) session.getAttribute("premiumInd");
		if(premiumInd == 0 && alertCount < 5) {
			System.out.println("settarget---------"+equityId);
			model.addAttribute("equityId",equityId);
		    return "SetTarget";
		}
		else if(premiumInd == 1 && alertCount < 15) {
			System.out.println("settarget---------"+equityId);
			model.addAttribute("equityId",equityId);
			return "SetTarget";
		}else {
			return "redirect:/userdashboard";
		}
	}

	@PostMapping("savealert")
	public String saveTarget(@RequestParam("equityId") Integer equityId, HttpSession session,
	        AlertEntity alertEntity) {
	    alertEntity.setUserId((Integer) session.getAttribute("userId"));
	    alertEntity.setEquityId(equityId);
	    alertEntity.setActiveInd(1);
	    alertRepo.save(alertEntity);
	    return "redirect:/listportfolio";
	}
	
	
	
	@GetMapping("/listEachShare")
    public String listEachShare(@RequestParam Integer equityId, @RequestParam Integer portfolioId, Model model) {
        List<Object[]> result = pfDetailRepo.getEachSharePortfolio(equityId, portfolioId);
        model.addAttribute("eachShareData", result);
        return "ListDetailSharePortfolio";
    }

}
