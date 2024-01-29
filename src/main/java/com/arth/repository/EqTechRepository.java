package com.arth.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.arth.entity.EqTechnicalEntity;



public interface EqTechRepository extends JpaRepository<EqTechnicalEntity, Integer>
{
	EqTechnicalEntity findByEqId(Integer eqId);
}
