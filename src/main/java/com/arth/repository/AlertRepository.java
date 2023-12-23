package com.arth.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.arth.entity.AlertEntity;

public interface AlertRepository extends JpaRepository<AlertEntity, Integer>
{
	List<AlertEntity> findByActiveInd(Integer activeInd);
}
