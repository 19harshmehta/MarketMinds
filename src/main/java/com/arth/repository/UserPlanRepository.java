package com.arth.repository;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;

import com.arth.entity.UserPlanEntity;


public interface UserPlanRepository extends JpaRepository<UserPlanEntity, Integer>
{
	Optional<UserPlanEntity> findByUserId(Integer userId);
}
