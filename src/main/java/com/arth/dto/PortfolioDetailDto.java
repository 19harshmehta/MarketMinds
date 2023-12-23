package com.arth.dto;

import java.math.BigDecimal;
import java.sql.Date;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class PortfolioDetailDto {

	String equityName;
	Double lastTradePrice;
	private BigDecimal qty;
 	private Double purchasedPrice;
 	private Date purchasedAt;
 	private Double totalInvestment;
 	private Integer equityId;

}
