package com.arth.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.arth.services.SmsService;

@Controller
public class SmsController {

	
	@Autowired
	SmsService smsService; 
	
	@GetMapping("/newsms")
	public String newSms() {
		return "NewSms";
	}
	
	@PostMapping("/sendsms")
	public String sendSms(@RequestParam("mobile") String mobileNum,@RequestParam("msg") String message) {
		smsService.sendSms(mobileNum, message);
		return "NewSms";
	}
}
