package com.arth.services;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.arth.entity.PortfolioEntity;
import com.arth.repository.PortfolioRepository;

@Service
public class PortfolioService 
{
	@Autowired
    private PortfolioRepository portfolioRepository;

    public List<PortfolioEntity> getPortfolioByUserId(Integer userId) {
        return portfolioRepository.findByUserId(userId);
    }
    
    
   
}
