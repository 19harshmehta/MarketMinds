package com.arth.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.arth.entity.PlanEntity;

public interface PlanRepository extends JpaRepository<PlanEntity, Integer>
{
	@Query(value = "select * from plan order by active_ind", nativeQuery = true)
	List<PlanEntity> getAllPlans();
	
	@Query(value = "select * from plan where active_ind = 1", nativeQuery = true)
	List<PlanEntity> getActiveplans();

}
