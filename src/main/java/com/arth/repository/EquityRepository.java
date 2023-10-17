package com.arth.repository;


import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.arth.entity.EquityEntity;
import java.util.List;


@Repository
public interface EquityRepository extends JpaRepository<EquityEntity, Integer> 
{
	Optional<EquityEntity> findBySymbol(String symbol);
	List<EquityEntity> findByEquityId(Integer eqId);
	List<EquityEntity> findByEquityName(String equityName);
}
