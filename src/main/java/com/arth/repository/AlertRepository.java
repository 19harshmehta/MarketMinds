package com.arth.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.arth.entity.AlertEntity;

public interface AlertRepository extends JpaRepository<AlertEntity, Integer>
{
	List<AlertEntity> findByActiveInd(Integer activeInd);
	
	@Query(value = "select count(*) from alerts where user_id = :userId", nativeQuery = true)
	Integer allAlertsCount(Integer userId);
	
	@Query(value = "select count(*) from alerts where user_id = :userId and active_ind = 0", nativeQuery = true)
	Integer compleatedAlerts(Integer userId);
}
