package com.arth.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class TicketController {

	@GetMapping("/ticket")
	public String ticket()
	{
		return "Ticket";
	}
}
