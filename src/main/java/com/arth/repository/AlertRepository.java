package com.arth.repository;

import java.util.List;


import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.arth.entity.AlertEntity;

public interface AlertRepository extends JpaRepository<AlertEntity, Integer>
{
	List<AlertEntity> findByActiveInd(Integer activeInd);

	@Query(value = " select a.* , e.equity_name from alerts a join users u on a.user_id = u.user_id join equity e on a.equity_id = e.equity_id where a.user_id = :userId",nativeQuery = true)
	List<Object[]> displayAlert(Integer userId);
}
