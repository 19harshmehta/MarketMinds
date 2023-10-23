package com.arth.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.arth.entity.TransactionEntity;
import com.arth.repository.TransactionRepository;

import jakarta.servlet.http.HttpSession;

@Controller
public class TransactionController 
{
	
	@Autowired
	TransactionRepository transactionRepo;
	
	
	@GetMapping("/viewhistory")
	public String viewHistory(Model model,HttpSession session)
	{
		List<TransactionEntity> transactions = transactionRepo.findByUserId((Integer) session.getAttribute("userId"));
		model.addAttribute("transactions", transactions);
		return "ViewTransactionHistory";
	}
}
