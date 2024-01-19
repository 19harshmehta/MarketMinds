package com.arth.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.arth.entity.SchedulerEntity;
import com.arth.repository.AlertRepository;
import com.arth.repository.SchedulerLogRepository;

import jakarta.servlet.http.HttpSession;

@Controller
public class AlertController 
{
	@Autowired
	SchedulerLogRepository scheduleRepo;
	
	@Autowired
	AlertRepository alertRepo;

	
	@GetMapping("/listlog")
	public String getAllLog(Model model) 
	{
		List<SchedulerEntity> logs = scheduleRepo.getScheduerlogsDesc();
		model.addAttribute("logs",logs);
		return "ListLogs";	
	}
	
	@GetMapping("/listalert")
	public String listAlert(Model model,HttpSession session)
	{
		Integer userId = (Integer) session.getAttribute("userId");
		List<Object[]> result = alertRepo.displayAlert(userId);
		model.addAttribute("alert",result);
		
		return "UserAlerts";
	}
}
