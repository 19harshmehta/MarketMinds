package com.arth.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.arth.entity.EquityEntity;

@Repository
public interface EquityRepository extends JpaRepository<EquityEntity, Integer> 
{

}
