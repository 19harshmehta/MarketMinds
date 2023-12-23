package com.arth.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.arth.entity.SchedulerEntity;

public interface SchedulerLogRepository extends JpaRepository<SchedulerEntity, Integer>
{
	List<SchedulerEntity> findBySchedulerName(String schedulerName);
	
}
