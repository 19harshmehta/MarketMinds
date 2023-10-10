package com.arth.entity;

import java.util.ArrayList;

import java.util.Date;
import java.util.List;

import jakarta.persistence.CascadeType;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.JoinTable;
import jakarta.persistence.ManyToMany;
import jakarta.persistence.Table;
import lombok.Data;

@Entity
@Table(name = "portfolio")
@Data
public class PortfolioEntity 
{
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer portfolioId;
	private Integer userId;
	private String portfolioName;
	private Date createdAt;
	
	@ManyToMany(cascade = { CascadeType.ALL })
	@JoinTable(
	        name = "pfdetail", 
	        joinColumns = {@JoinColumn(name = "portfolioId") }, 
	        inverseJoinColumns = { @JoinColumn(name = "equityId") }
	    )
	List<EquityEntity> equities = new ArrayList<>();
}

