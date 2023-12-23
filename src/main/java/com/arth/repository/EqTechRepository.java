package com.arth.repository;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;

import com.arth.entity.EqTechnicalEntity;
import java.util.List;


public interface EqTechRepository extends JpaRepository<EqTechnicalEntity, Integer>
{
	EqTechnicalEntity findByEqId(Integer eqId);
}
