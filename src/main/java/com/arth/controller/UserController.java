package com.arth.controller;

import java.util.Date;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import com.arth.entity.UserEntity;
import com.arth.repository.UserRepository;

import jakarta.servlet.http.HttpSession;


@Controller
public class UserController 
{
	
	@Autowired
	UserRepository userRepo;

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
	
	
	
	@GetMapping("/deleteuser/{userId}")
	public String deleteUser(@PathVariable("userId") Integer userId)
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
    public String updateUser(@ModelAttribute("user") UserEntity updatedUser,Model model) {
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
        return "redirect:/admin-myprofile";
//        return "Admin-Myprofile";
    }
	
	
	
	
	
}
