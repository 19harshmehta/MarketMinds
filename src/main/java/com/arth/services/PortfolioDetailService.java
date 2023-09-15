package com.arth.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.arth.entity.PortfolioDetailEntity;
import com.arth.repository.PortfolioDetailRepository;

@Service
public class PortfolioDetailService 
{
	@Autowired
    private PortfolioDetailRepository portfolioDetailRepository;

    public List<PortfolioDetailEntity> getDetailsByPortfolioId(Integer portfolioId) {
        return portfolioDetailRepository.findByPortfolioId(portfolioId);
    }
}
