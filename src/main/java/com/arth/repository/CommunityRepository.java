package com.arth.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.arth.entity.CommunityEntity;

public interface CommunityRepository extends JpaRepository<CommunityEntity, Integer>
{
	@Query(value = "select * from community where user_id = :userId and equity_id = :equityId", nativeQuery = true)
	List<CommunityEntity> getAllComments(Integer userId , Integer equityId);
}