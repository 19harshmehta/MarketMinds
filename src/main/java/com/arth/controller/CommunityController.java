package com.arth.controller;

import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;

import com.arth.entity.CommunityEntity;
import com.arth.repository.CommunityRepository;

import jakarta.servlet.http.HttpSession;

@Controller
public class CommunityController 
{
	@Autowired
	CommunityRepository communityRepo;
	
	@PostMapping("/postcommunity")
	public String postComment(CommunityEntity comment,HttpSession session) {
		Integer userId = (Integer)session.getAttribute("userId");
		Date currentDate = new Date();
		comment.setPublishDate(currentDate);
		comment.setUserId(userId);
		communityRepo.save(comment);
		return "redirect:/chart";
	}
}
