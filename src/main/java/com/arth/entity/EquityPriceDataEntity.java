package com.arth.entity;

import java.util.Date;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;
import lombok.Data;

@Entity
@Table(name = "equity_price_data")
@Data
public class EquityPriceDataEntity 
{
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	Integer equityPriceDataId;
	@ManyToOne
    @JoinColumn(name = "equityId", referencedColumnName = "equityId")
	EquityEntity equity;
	Date date;
	Double closingPrice;
}
