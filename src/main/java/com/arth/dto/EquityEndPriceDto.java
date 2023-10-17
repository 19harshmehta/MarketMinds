package com.arth.dto;

import java.util.Date;

import lombok.Data;

@Data
public class EquityEndPriceDto 
{
	public int equityPriceDataId;
	public int equityId;
	public Date date;
	public double closingPrice;
}
