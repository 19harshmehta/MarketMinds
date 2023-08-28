package com.arth.controller;


import java.util.List;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import com.arth.entity.PlanEntity;
import com.arth.repository.PlanRepository;


@Controller
public class PlanController 
{
	
	@Autowired
	PlanRepository planRepo;

	@GetMapping("/addplan")
	public String getPlan(Model model)
	{
		return "AddPlan";
	}
	
	
	
	@PostMapping("/addplan")
	public String addPlan(PlanEntity plan)
	{
		plan.setActiveInd(0);
		
		planRepo.save(plan);
		return "Home";
		
	}
	
	@GetMapping("/listplans")
	public String listPlans(Model model)
	{
		List<PlanEntity> plans = planRepo.getAllPlans(); // List<UserEn>
		model.addAttribute("plans",plans);
		return "ListPlans";
		
//		List<PlanEntity> plans = planRepo.findAll();
//		model.addAttribute("plans",plans);
//		return "ListPlans";
	
	}
	
	@GetMapping("/deleteplan/{planId}")
	public String deletePlan(@PathVariable("planId") Integer planId)
	{
		
		Optional<PlanEntity> planOpt = planRepo.findById(planId);
		PlanEntity plan = planOpt.get();
		plan.setActiveInd(1);
		planRepo.save(plan);
		return "redirect:/listplans";
		
	}
	
	@GetMapping("/activateplan/{planId}")
	public String activatePlan(@PathVariable("planId") Integer planId)
	{
		
		Optional<PlanEntity> planOpt = planRepo.findById(planId);
		PlanEntity plan = planOpt.get();
		plan.setActiveInd(0);
		planRepo.save(plan);
		return "redirect:/listplans";
		
	}
	
}
