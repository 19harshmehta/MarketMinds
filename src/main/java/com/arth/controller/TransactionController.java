package com.arth.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;

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

	@PostMapping("/charge")
	public String charge(@RequestBody Map<String, String> data) {
		// planID
		// price

		System.out.println(data);
		System.out.println("paymentMethodId => " + data.get("paymentMethodId"));
		Stripe.apiKey = "sk_test_51O4j86SJOPbiqQsfqbd4Z7E8dz3Y4kBMPwuHtspaZW2TMjww2MLm0w71hrgFGA25ixHa7CGnZx0ncYMYWbDG14pR00jEXmpyIk";
		try {

			PaymentIntentCreateParams params = new PaymentIntentCreateParams.Builder().setAmount(2000L * 100) // Amount in
																										// cents
					.setCurrency("inr").addPaymentMethodType("card").setConfirmationMethod(ConfirmationMethod.MANUAL)
					.setConfirm(true).setPaymentMethod(data.get("paymentMethodId")).build();

			PaymentIntent paymentIntent = PaymentIntent.create(params);
			System.out.println(paymentIntent.getLastResponse().code());
			;
			System.out.println(paymentIntent.getLastPaymentError());

			if (paymentIntent.getLastPaymentError() == null) {

				System.out.println("PaymentIntent ID: " + paymentIntent.getId());
			} else {
				System.out.println(paymentIntent.getLastPaymentError().getCode());
				System.out.println(paymentIntent.getLastPaymentError().getMessage());
			
				
			}

		} catch (StripeException e) {
			e.printStackTrace();
			return e.getLocalizedMessage();
		}
		return "Home";
	}
}
