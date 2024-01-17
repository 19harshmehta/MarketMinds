package com.arth.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.arth.entity.SchedulerEntity;
import com.arth.repository.SchedulerLogRepository;

@Controller
public class AlertController 
{
	@Autowired
	SchedulerLogRepository scheduleRepo;
	
	

	
	@GetMapping("/listlog")
	public String getAllLog(Model model) 
	{
		List<SchedulerEntity> logs = scheduleRepo.getScheduerlogsDesc();
		model.addAttribute("logs",logs);
		return "ListLogs";	
	}
	
	
}
