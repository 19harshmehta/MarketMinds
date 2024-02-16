package com.arth.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.arth.entity.CommunityEntity;
import com.arth.entity.FaqsEntity;
import com.arth.repository.CommunityRepository;
import com.arth.repository.EquityRepository;
import com.arth.repository.FaqRepository;

@Controller
public class AnalystController
{
	@Autowired
	EquityRepository eqRepo;
	
	@Autowired
	FaqRepository faqRepo;
	
	@Autowired
	CommunityRepository comRepo;
	
	@GetMapping("/analystdashboard")
	public String analystdashboard(Model model)
	{
		model.addAttribute("eqs",eqRepo.findAll());
		return "AnalystDashboard";
	}
	
	@GetMapping("analystfaqs")
	public String analystfaq(Model model)
	{
		List<FaqsEntity> faqs = faqRepo.findAll();
		model.addAttribute("faqs",faqs);
		return "AnalystFaq";
	}
	
	@GetMapping("/contactanalyst")
	public String contactanalyst()
	{
		
		return "ContactAnalyst";
	}
	
	@GetMapping("/analystprofile")
	public String analystProfile()
	{
		
		return "Analyst-MyProfile";
	}
	
	@GetMapping("/anycom")
	public String analystCommunity(Model model) {
		
		List<CommunityEntity> cmts = comRepo.getAllAnalystCmts();
		model.addAttribute("cmts",cmts);
		
		return "CommunityAnalyst";
	}
	
	
}
