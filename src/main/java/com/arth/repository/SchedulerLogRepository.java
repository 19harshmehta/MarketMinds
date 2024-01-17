package com.arth.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.arth.entity.SchedulerEntity;

public interface SchedulerLogRepository extends JpaRepository<SchedulerEntity, Integer>
{
	@Query(value = "select * from schedulerlog order by schedula"+ "r_id DESC", nativeQuery = true)
	List<SchedulerEntity> getScheduerlogsDesc();
	
}
