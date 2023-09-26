package com.arth.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.arth.dto.PortfolioDetailDto;
import com.arth.entity.PortfolioDetailEntity;

@Repository
public interface PortfolioDetailRepository extends JpaRepository<PortfolioDetailEntity, Integer>
{
	List<PortfolioDetailEntity> findByPortfolioId(Integer portfolioId);
	List<PortfolioDetailEntity> findByEquityId(Integer equityId);
	List<PortfolioDetailEntity> findByEquityIdAndPortfolioId(Integer equityId, Integer portfolioId);
	
 //	List<PortfolioDetailEntity> findByPortfolioId(Integer portfolioId);
	
	@Query(value = "select e.equity_name ,e.price as lastTradePrice, pd.price as purchasedPrice ,pd.qty ,pd.purchased_at   from equity e,portfolio p,pfdetail pd where p.portfolio_id = :portfolioId and e.equity_id = pd.equity_id and pd.portfolio_Id = :portfolioId",nativeQuery = true)
	List<Object[]> getData(Integer portfolioId);

}
