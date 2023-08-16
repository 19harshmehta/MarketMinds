package com.arth.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.arth.entity.PlanEntity;

public interface PlanRepository extends JpaRepository<PlanEntity, Integer>
{

}
