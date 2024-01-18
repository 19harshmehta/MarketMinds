package com.arth.controller.rest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

import com.arth.entity.EquityEntity;
import com.arth.repository.EquityRepository;

@RestController
public class RestEquityController 
{
	
	@Autowired
	EquityRepository eqRepo; 
	
	@GetMapping("/getequitybyidforrest/{equityId}")
	public EquityEntity getEntityById(@PathVariable("equityId") Integer equityId) {
		
		EquityEntity eq = eqRepo.findByEquityId(equityId);	
		
		
		EquityEntity eqq = new EquityEntity();
		eqq.setEquityName("ram");
		return eq; 
	}
}

//http://localhost:9999/getequitybyid/11 

