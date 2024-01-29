package com.arth.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;

import com.arth.entity.PlanEntity;
import com.arth.entity.TransactionEntity;
import com.arth.repository.TransactionRepository;
import com.stripe.Stripe;
import com.stripe.exception.StripeException;
import com.stripe.model.PaymentIntent;
import com.stripe.param.PaymentIntentCreateParams;
import com.stripe.param.PaymentIntentCreateParams.ConfirmationMethod;

import jakarta.servlet.http.HttpSession;

@Controller
public class TransactionController {

	@Autowired
	TransactionRepository transactionRepo;

	@GetMapping("/viewhistory")
	public String viewHistory(Model model, HttpSession session) {
		List<TransactionEntity> transactions = transactionRepo.findByUserId((Integer) session.getAttribute("userId"));
		model.addAttribute("transactions", transactions);
		return "ViewTransactionHistory";
	}

	@GetMapping("/newtrans")
	public String newTransaction() {
		return "NewTrans";
	}

	}
