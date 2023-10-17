package com.arth.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.arth.entity.EquityPriceDataEntity;

@Repository
public interface EquityPriceDataRepository extends JpaRepository<EquityPriceDataEntity,Integer>
{

}
