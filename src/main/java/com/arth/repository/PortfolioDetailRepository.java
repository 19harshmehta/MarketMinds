package com.arth.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.arth.entity.PortfolioDetailEntity;

@Repository
public interface PortfolioDetailRepository extends JpaRepository<PortfolioDetailEntity, Integer>
{
	List<PortfolioDetailEntity> findByPortfolioId(Integer portfolioId);
	List<PortfolioDetailEntity> findByEquityId(Integer equityId);
	List<PortfolioDetailEntity> findByEquityIdAndPortfolioId(Integer equityId, Integer portfolioId);
	
 //	List<PortfolioDetailEntity> findByPortfolioId(Integer portfolioId);
}
