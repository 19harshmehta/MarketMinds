package com.arth.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.arth.entity.WatchListEntity;
import com.arth.repository.EquityRepository;
import com.arth.repository.WatchListRepository;

import jakarta.servlet.http.HttpSession;

@Controller
public class WatchlistController
{
	@Autowired
	EquityRepository eqRepo;
	
	@Autowired
	WatchListRepository watchRepo;
	
	
	@GetMapping("/addtowatchlist")
	public String addToWatchList(@RequestParam("equityId") Integer equityId,HttpSession session,WatchListEntity watchEntity) 
	{
		Integer userId = (Integer) session.getAttribute("userId");
		watchEntity.setEquityId(equityId);
		watchEntity.setUserId(userId);
		watchRepo.save(watchEntity);
		return "redirect:/userdashboard";
	}
	
	@GetMapping("/watchlist")
	public String wishlist(Model model,HttpSession session)
	{
		Integer userId = (Integer) session.getAttribute("userId");
		List<Object[]> result = watchRepo.displayWatchList(userId);
        model.addAttribute("watchlist", result);
		
		return "WatchList";
	}
	
	@PostMapping("watchlist/equityId")
	public String wishlist()
	{
		return "";
	}
}
