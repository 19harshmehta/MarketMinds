package com.arth.controller;

import java.util.Date;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.arth.entity.FaqsEntity;
import com.arth.entity.UserEntity;
import com.arth.repository.AlertRepository;
import com.arth.repository.EquityRepository;
import com.arth.repository.FaqRepository;
import com.arth.repository.PortfolioRepository;
import com.arth.repository.UserRepository;

import jakarta.servlet.http.HttpSession;


@Controller
public class UserController 
{
	@Autowired
	EquityRepository eqRepo;
	
	@Autowired
	UserRepository userRepo;
	
	@Autowired
	FaqRepository faqRepo;
	
	@Autowired
	PortfolioRepository portfolioRepo;
	
	@Autowired
	AlertRepository alertRepo;

	@GetMapping("/listusers")
	public String listUsers(Model model)
	{
		List<UserEntity> users = userRepo.findAll();
		model.addAttribute("users",users);
		return "ListUsers";
	}
	
	@GetMapping("/listactiveusers")
	public String listActiveUsers(Model model) {

		List<UserEntity> users = userRepo.getActiveUsers(); // List<UserEn>
		model.addAttribute("users",users);
		return "ListActiveUsers";
	}
	
	
	
	@GetMapping("/deleteuser")
	public String deleteUser(@RequestParam("userId") Integer userId)
	{
		
		Optional<UserEntity> userOpt = userRepo.findById(userId);
		UserEntity user = userOpt.get();
		user.setDeletedAt(new Date());
		userRepo.save(user);
		return "redirect:/listactiveusers";
		
	}
	@GetMapping("/listpremiumusers")
	public String listPremiumUsers(Model model) {

		List<UserEntity> pusers = userRepo.findByPremiumInd(1); // List<UserEn>
		model.addAttribute("pusers",pusers);
		return "ListPremiumUsers";
	}
	
	
	@PostMapping("/updateuser")
    public String updateUser(@ModelAttribute("user") UserEntity updatedUser,Model model,HttpSession session) {
        // Fetch the existing user from the database
        UserEntity existingUser = userRepo.findById(updatedUser.getUserId()).orElse(null);
      
        if (existingUser != null) {
            // Update the properties that are allowed to be updated
            existingUser.setFirstName(updatedUser.getFirstName());
            existingUser.setLastName(updatedUser.getLastName());
            existingUser.setEmail(updatedUser.getEmail());
            // Update other properties as needed

            // Save the updated user to the database
            userRepo.save(existingUser);
//            flag = 1;
        }
        // Redirect to the profile page after updating
//        model.addAttribute("update", flag);
        UserEntity user =  (UserEntity)session.getAttribute("user");
        if(user.getRole().getRoleId() == 1) 
        {
        	
        	return "redirect:/userprofile";
        }else {
        	
        	return "redirect:/admin-myprofile";
        }
//        return "Admin-Myprofile";
    }
	
	@GetMapping("/userdashboard")
	public String userdashboard(Model model,HttpSession session)
	{
		Integer countPortfolio = portfolioRepo.countPortfolio((Integer)session.getAttribute("userId"));
		Integer allAlertCount = alertRepo.allAlertsCount((Integer)session.getAttribute("userId"));
		Integer comletedAlertCount = alertRepo.compleatedAlerts((Integer)session.getAttribute("userId"));
		model.addAttribute("allAlertCount",allAlertCount);
		model.addAttribute("comletedAlertCount",comletedAlertCount);
		model.addAttribute("countPortfolio",countPortfolio);
		model.addAttribute("eqs",eqRepo.findAll());
		return "UserDashboard";
	}
	
	@GetMapping("userfaqs")
	public String userfaq(Model model)
	{
		List<FaqsEntity> faqs = faqRepo.findAll();
		model.addAttribute("faqs",faqs);
		return "UserFaq";
	}
	
	@GetMapping("/contactuser")
	public String contactuser()
	{
		
		return "ContactUser";
	}
	
	
	@GetMapping("/userprofile")
	public String userProfile()
	{
		
		return "User-MyProfile";
	}
	
}
