package com.arth.controller.rest;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.arth.entity.PlanEntity;
import com.arth.repository.PlanRepository;
import com.arth.services.UserPlanService;
import com.stripe.Stripe;
import com.stripe.exception.StripeException;
import com.stripe.model.PaymentIntent;
import com.stripe.param.PaymentIntentCreateParams;
import com.stripe.param.PaymentIntentCreateParams.ConfirmationMethod;

import jakarta.servlet.http.HttpSession;

@RestController
public class TranscationRestController {

	@Autowired
	PlanRepository planRepo;
	@Autowired
	UserPlanService userPlanService;

	@PostMapping("/charge")
	public ResponseEntity<?> charge(@RequestBody Map<String, String> data,HttpSession session) {
		// planID
		// price
		HashMap<String, String> hm = new HashMap<>();

		PlanEntity plan = planRepo.findByPlanId(Integer.parseInt(data.get("planId")));
		
		System.out.println("#################################" + plan.getPlanId());
		System.out.println(data);
		System.out.println("paymentMethodId => " + data.get("paymentMethodId"));
		Stripe.apiKey = "sk_test_51O4j86SJOPbiqQsfqbd4Z7E8dz3Y4kBMPwuHtspaZW2TMjww2MLm0w71hrgFGA25ixHa7CGnZx0ncYMYWbDG14pR00jEXmpyIk";
		try {

			Long amt =  plan.getAmount().longValue(); 
			PaymentIntentCreateParams params = new PaymentIntentCreateParams.Builder().setAmount( amt * 100L) // Amount
																												// in
					// cents
					.setCurrency("inr").addPaymentMethodType("card").setConfirmationMethod(ConfirmationMethod.MANUAL)
					.setConfirm(true).setPaymentMethod(data.get("paymentMethodId")).build();

			PaymentIntent paymentIntent = PaymentIntent.create(params);
			System.out.println(paymentIntent.getLastResponse().code());
			;
			System.out.println(paymentIntent.getLastPaymentError());

			if (paymentIntent.getLastPaymentError() == null) {

				System.out.println("PaymentIntent ID: " + paymentIntent.getId());
				hm.put("sucess", paymentIntent.getId());
				
//				public String saveUserPlan(@RequestParam("planId") Integer planId,TransactionEntity transactionEntity,UserPlanEntity userPlanEntity,HttpSession session)
				//plan 
				userPlanService.saveUserPlan(plan.getPlanId(),session);
				

			} else {
				System.out.println(paymentIntent.getLastPaymentError().getCode());
				System.out.println(paymentIntent.getLastPaymentError().getMessage());
				hm.put("error", paymentIntent.getLastPaymentError().getMessage());
			}

		} catch (StripeException e) {
			hm.put("error", e.getMessage());

			e.printStackTrace();
		}
		return ResponseEntity.ok(hm);
	}

}
