package com.arth.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.arth.entity.CommunityEntity;

public interface CommunityRepository extends JpaRepository<CommunityEntity, Integer>
{
	@Query(value = "SELECT * FROM community WHERE user_id IN (SELECT user_id FROM users WHERE role_id = 3);", nativeQuery = true)
	List<CommunityEntity> getAllAnalystCmts();
	
	List<CommunityEntity> findByEquityId(Integer equityId);
	
	
}