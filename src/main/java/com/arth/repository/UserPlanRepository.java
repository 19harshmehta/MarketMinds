package com.arth.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.arth.entity.UserPlanEntity;

public interface UserPlanRepository extends JpaRepository<UserPlanEntity, Integer>
{

}
