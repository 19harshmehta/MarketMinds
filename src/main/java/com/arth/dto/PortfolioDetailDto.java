package com.arth.dto;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class PortfolioDetailDto {

	String equityName;
	Double lastTradePrice;
	private Integer qty;
 	private Float purchasedPrice;
 	private Date purchasedAt;

}
