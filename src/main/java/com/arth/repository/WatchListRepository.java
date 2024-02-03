package com.arth.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.arth.entity.WatchListEntity;

public interface WatchListRepository extends JpaRepository<WatchListEntity, Integer> 
{
	@Query(value = "SELECT e.* FROM Equity e JOIN WatchList w ON e.equity_id = w.equity_id WHERE w.user_id = :userId",nativeQuery = true)
	List<Object[]> displayWatchList(Integer userId);

	@Query(value = "SELECT count(*) from watchlist WHERE user_id = :userId",nativeQuery = true)
	Integer watchlistCount(Integer userId);
}
