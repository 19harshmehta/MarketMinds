package com.arth.entity;

import java.util.ArrayList;

import java.util.List;

import com.fasterxml.jackson.annotation.JsonIgnore;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.ManyToMany;
import jakarta.persistence.Table;
import lombok.Data;

@Data
@Entity
@Table(name = "equity")
public class EquityEntity 
{
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	Integer equityId;
	String equityName;
	String symbol;
	String series;
	Double high52;
	Double low52;
	Double todayOpen;
	Double todayClose;
	Double todayHigh;
	Double todayLow;
	Double price;
	Integer activeInd;
	Integer buysellInd;
	String industryName;
	Integer wishlistInd;
	
	@JsonIgnore
	@ManyToMany(mappedBy = "equities")
	private List<PortfolioEntity> portfolios = new ArrayList<>();
	

}
