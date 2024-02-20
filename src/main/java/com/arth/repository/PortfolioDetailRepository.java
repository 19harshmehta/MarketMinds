package com.arth.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.arth.entity.PortfolioDetailEntity;

@Repository
public interface PortfolioDetailRepository extends JpaRepository<PortfolioDetailEntity, Integer>
{
	List<PortfolioDetailEntity> findByPortfolioId(Integer portfolioId);
	List<PortfolioDetailEntity> findByEquityId(Integer equityId);
	List<PortfolioDetailEntity> findByEquityIdAndPortfolioId(Integer equityId, Integer portfolioId);
	
 //	List<PortfolioDetailEntity> findByPortfolioId(Integer portfolioId);
	
//	@Query(value = "select e.equity_name ,e.price as lastTradePrice, pd.price as purchasedPrice ,pd.qty ,pd.purchased_at   from equity e,portfolio p,pfdetail pd where p.portfolio_id = :portfolioId and e.equity_id = pd.equity_id and pd.portfolio_Id = :portfolioId",nativeQuery = true)
//	@Query(value = "select e.equity_name ,e.price as lastTradePrice, sum(pd.price*pd.qty) / sum(pd.qty) as purchasedPrice,sum(pd.price*pd.qty) as totalInvestment,sum(pd.qty) as qty ,pd.purchased_at,e.equity_id as eqId   from equity e,portfolio p,pfdetail pd where p.portfolio_id = :portfolioId and e.equity_id = pd.equity_id and pd.portfolio_Id = :portfolioId group by e.equity_name,e.price;",nativeQuery = true)
//	List<Object[]> getData(Integer portfolioId);
	@Query(value = "SELECT e.equity_name, e.price as lastTradePrice, SUM(pd.price*pd.qty) / SUM(pd.qty) as purchasedPrice, SUM(pd.price*pd.qty) as totalInvestment, SUM(pd.qty) as qty, MIN(pd.purchased_at) as earliestPurchaseDate, e.equity_id as eqId FROM equity e, portfolio p, pfdetail pd WHERE p.portfolio_id = :portfolioId AND e.equity_id = pd.equity_id AND pd.portfolio_Id = :portfolioId GROUP BY e.equity_name, e.price, e.equity_id", nativeQuery = true)
	List<Object[]> getData(Integer portfolioId);


	@Query(value = "SELECT pfdetail.*, equity.equity_name FROM pfdetail JOIN equity ON pfdetail.equity_id = equity.equity_id WHERE pfdetail.equity_id = :equityId AND pfdetail.portfolio_id = :portfolioId",nativeQuery = true)
	List<Object[]> getEachSharePortfolio(Integer equityId,Integer portfolioId);
}
