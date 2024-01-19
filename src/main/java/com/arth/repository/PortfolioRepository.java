package com.arth.repository;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.arth.entity.PortfolioEntity;


public interface PortfolioRepository extends JpaRepository<PortfolioEntity,Integer>
{
	List<PortfolioEntity> findByUserId(Integer userId);//1 -- n 
	
	
	@Query(value = "select count(*) from portfolio where user_id = :userId", nativeQuery = true)
	Integer countPortfolio(Integer userId);
	
	
	
}
