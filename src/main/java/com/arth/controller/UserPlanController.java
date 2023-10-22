package com.arth.controller;

import java.util.Calendar;
import java.util.Date;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import com.arth.entity.PlanEntity;
import com.arth.entity.TransactionEntity;
import com.arth.entity.UserEntity;
import com.arth.entity.UserPlanEntity;
import com.arth.repository.PlanRepository;
import com.arth.repository.TransactionRepository;
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
	
	@Autowired 
	TransactionRepository transactionRepo;
	
	
	@GetMapping("/plan/{planId}")
	public String saveUserPlan(@PathVariable("planId") Integer planId,TransactionEntity transactionEntity,UserPlanEntity userPlanEntity,HttpSession session)
	{
		Date startDate = new Date();
		Date currentDate = new Date(); 
		Optional<UserEntity> opt = userRepo.findById((Integer) session.getAttribute("userId"));
		Optional<PlanEntity> planOpt = planRepo.findById(planId);
		if((Integer) session.getAttribute("premiumInd") == 0) 
		{
			System.out.println((Integer) session.getAttribute("premiumInd"));
			System.out.println((Integer) session.getAttribute("userId"));
			if (opt.isPresent()) { 
				System.out.println("in if 1");
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
				
				//transaction
				transactionEntity.setUserId((Integer) session.getAttribute("userId"));
				transactionEntity.setPlanId(planId);
				transactionEntity.setStatusInd(0);
				transactionEntity.setAmount(planOpt.get().getAmount());
				transactionEntity.setTax(planOpt.get().getTax());
				transactionEntity.setAuthCode("aaa");
				transactionEntity.setRefcode("aaa");
				transactionEntity.setCreatedAt(currentDate);
				
				
				userRepo.save(userEntity);	
				userPlanRepo.save(userPlanEntity);
				transactionRepo.save(transactionEntity);
			}
		}
		else {
		    if (opt.isPresent()) {System.out.println("in if 2");
		        UserEntity userEntity = opt.get();
		        
		        // Retrieve the existing user plan
		        Optional<UserPlanEntity> existingUserPlanOpt = userPlanRepo.findByUserId(userEntity.getUserId());
		        
		        if (existingUserPlanOpt.isPresent()) {
		            UserPlanEntity existingUserPlan = existingUserPlanOpt.get();
		            
		            // Set the start date of the new plan to be the end date of the existing plan
		            Date newStartDate = existingUserPlan.getEndDate();
		           
		            userEntity.setPremiumInd(1);
		            userPlanEntity.setUserId(userEntity.getUserId());
		            userPlanEntity.setPlanId(planId);
		            userPlanEntity.setStatusInd(2);
		            userPlanEntity.setStartDate(newStartDate);
		            Calendar calendar = Calendar.getInstance();
		            calendar.setTime(newStartDate);
		    
		            // Add months
		            calendar.add(Calendar.MONTH, planOpt.get().getDuration());
		    
		            // Get the updated Date object
		            Date newEndDate = calendar.getTime();
		    
		            userPlanEntity.setEndDate(newEndDate);
		            userPlanEntity.setTransactionId(0);
		            
		          //transaction
					transactionEntity.setUserId((Integer) session.getAttribute("userId"));
					transactionEntity.setPlanId(planId);
					transactionEntity.setStatusInd(0);
					transactionEntity.setAmount(planOpt.get().getAmount());
					transactionEntity.setTax(planOpt.get().getTax());
					transactionEntity.setAuthCode("aaa");
					transactionEntity.setRefcode("aaa");
					transactionEntity.setCreatedAt(currentDate);
		            
		            // Save user entity and new user plan
		            userRepo.save(userEntity);
		            userPlanRepo.save(userPlanEntity);
		            transactionRepo.save(transactionEntity);
		        }
		    }
		}

		
		
		
		return "Home";
	}
}
