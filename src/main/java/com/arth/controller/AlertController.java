package com.arth.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.arth.entity.AlertEntity;
import com.arth.entity.SchedulerEntity;
import com.arth.entity.UserEntity;
import com.arth.repository.AlertRepository;
import com.arth.repository.SchedulerLogRepository;
import com.arth.services.AlertService;

@Controller
public class AlertController 
{
	@Autowired
	SchedulerLogRepository scheduleRepo;
	
	

	
	@GetMapping("/listlog")
	public String getAllLog(Model model) 
	{
		List<SchedulerEntity> logs = scheduleRepo.findAll();
		model.addAttribute("logs",logs);
		return "ListLogs";
	}
	
	
}
