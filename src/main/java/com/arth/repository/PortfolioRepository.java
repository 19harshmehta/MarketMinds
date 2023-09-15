package com.arth.repository;

import java.util.Optional;


import org.springframework.data.jpa.repository.JpaRepository;

import com.arth.entity.PortfolioEntity;


public interface PortfolioRepository extends JpaRepository<PortfolioEntity,Integer>
{
	Optional<PortfolioEntity> findByUserId(Integer userId);
//	Optional<PortfolioEntity> findByUserId(Integer userId);
}
