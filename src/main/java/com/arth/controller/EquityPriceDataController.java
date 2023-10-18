package com.arth.controller;

import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import com.arth.entity.EquityEntity;
import com.arth.entity.EquityPriceDataEntity;
import com.arth.repository.EquityPriceDataRepository;
import com.arth.repository.EquityRepository;

@Controller
public class EquityPriceDataController 
{
	@Autowired
    private EquityRepository equityRepo;
    
    @Autowired
    private EquityPriceDataRepository eqPriceRepo;
    
    @GetMapping("/scrapprice")
    public String saveEquityPrice() {
//    	equityName="Zuari Industries Ltd.";
    for(EquityEntity equity :equityRepo.findAll()) {
//        Eq(EquityEntity) equityRepo.findByEquityName(equityName).get(0);
        if (equity != null) {
            EquityPriceDataEntity equityPrice = new EquityPriceDataEntity();
            equityPrice.setEquity(equity);
            equityPrice.setDate(new Date());
            equityPrice.setClosingPrice(equity.getPrice());
            
            eqPriceRepo.save(equityPrice);
//            System.out.println("in price scrap");
            
            
        } else {
            // Handle case where equity with given name is not found
        }
    }
    	return "Home";
        
    }
}
