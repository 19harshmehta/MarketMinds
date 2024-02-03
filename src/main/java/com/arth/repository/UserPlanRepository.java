package com.arth.repository;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.arth.entity.UserPlanEntity;


public interface UserPlanRepository extends JpaRepository<UserPlanEntity, Integer>
{
	Optional<UserPlanEntity> findByUserId(Integer userId);
	
	@Query(value = "select * from userplan where user_id = :userId and status_ind = 1", nativeQuery = true)
	Optional<UserPlanEntity> currentPlan(Integer userId);
}
