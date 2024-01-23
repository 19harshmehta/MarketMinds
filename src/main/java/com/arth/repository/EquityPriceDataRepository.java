package com.arth.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.arth.entity.EquityPriceDataEntity;
import java.util.List;
import com.arth.entity.EquityEntity;


@Repository
public interface EquityPriceDataRepository extends JpaRepository<EquityPriceDataEntity,Integer>
{
	
	
	@Query(value = "select * from equity_price_data where equity_id = :equityId", nativeQuery = true)
	List<EquityPriceDataEntity> findByEquityId(Integer equityId);
}
