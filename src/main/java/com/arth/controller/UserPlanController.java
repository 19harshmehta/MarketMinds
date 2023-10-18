package com.arth.controller;

import java.time.LocalDate;
import java.util.Calendar;
import java.util.Date;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import com.arth.entity.PlanEntity;
import com.arth.entity.UserEntity;
import com.arth.entity.UserPlanEntity;
import com.arth.repository.PlanRepository;
import com.arth.repository.UserPlanRepository;
import com.arth.repository.UserRepository;

import jakarta.servlet.http.HttpSession;

@Controller
public class UserPlanController 
{
	@Autowired
	UserPlanRepository userPlanRepo;
	
	@Autowired
	UserRepository userRepo;
	
	@Autowired
	PlanRepository planRepo;
	
	
	@GetMapping("/plan/{planId}")
	public String saveUserPlan(@PathVariable("planId") Integer planId,UserPlanEntity userPlanEntity,HttpSession session)
	{
		Date startDate = new Date();
		Optional<UserEntity> opt = userRepo.findById((Integer) session.getAttribute("userId"));
		Optional<PlanEntity> planOpt = planRepo.findById(planId);
		if((Integer) session.getAttribute("premiumInd") == 0) 
		{
			if (opt.isPresent()) {
				UserEntity userEntity = opt.get();
				userEntity.setPremiumInd(1);
				userPlanEntity.setUserId(userEntity.getUserId());
				userPlanEntity.setPlanId(planId);
				userPlanEntity.setStatusInd(1);
				userPlanEntity.setStartDate(startDate);
				Calendar calendar = Calendar.getInstance();
		        calendar.setTime(startDate);
	
		        // Add months
		        calendar.add(Calendar.MONTH, planOpt.get().getDuration());
	
		        // Get the updated Date object
		        Date endDate = calendar.getTime();
	
				userPlanEntity.setEndDate(endDate);
				userPlanEntity.setTransactionId(0);
				
				userPlanRepo.save(userPlanEntity);
				userRepo.save(userEntity);	
			}
		}else {
//			if (opt.isPresent()) {
//				UserEntity userEntity = opt.get();
//				userEntity.setPremiumInd(1);
//				userPlanEntity.setUserId(userEntity.getUserId());
//				userPlanEntity.setPlanId(planId);
//				userPlanEntity.setStatusInd(1);
//				userPlanEntity.setStartDate(startDate);
//				Calendar calendar = Calendar.getInstance();
//		        calendar.setTime(startDate);
//	
//		        // Add months
//		        calendar.add(Calendar.MONTH, planOpt.get().getDuration());
//	
//		        // Get the updated Date object
//		        Date endDate = calendar.getTime();
//	
//				userPlanEntity.setEndDate(endDate);
//				userPlanEntity.setTransactionId(0);
//				
//				userPlanRepo.save(userPlanEntity);
//				userRepo.save(userEntity);	
//			}
		}
		
		
		
		return "";
	}
}
