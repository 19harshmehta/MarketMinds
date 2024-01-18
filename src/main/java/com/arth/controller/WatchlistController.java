package com.arth.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.arth.repository.EquityRepository;

@Controller
public class WatchlistController
{
	@Autowired
	EquityRepository eqRepo;
	
	@GetMapping("watchlist")
	public String wishlist(Model model)
	{
		model.addAttribute("eqs",eqRepo.findAll());
		return "WatchList";
	}
	
	@PostMapping("watchlist/equityId")
	public String wishlist()
	{
		return "";
	}
}
