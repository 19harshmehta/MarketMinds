package com.arth.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.arth.entity.CommunityEntity;

public interface CommunityRepository extends JpaRepository<CommunityEntity, Integer>
{
//	@Query(value = "SELECT c.community_id, c.comment, c.equity_id, c.publish_date, c.user_id, u.role_id , u.first_name,u.last_name FROM community c JOIN users u ON c.user_id = u.user_id where c.equity_id = :equityId order by u.role_id desc;", nativeQuery = true)
//	List<CommunityEntity> getAllComments(Integer equityId);
	
	List<CommunityEntity> findByEquityId(Integer equityId);
}