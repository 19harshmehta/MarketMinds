package com.arth.entity;




import java.sql.Date;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import lombok.Data;

@Entity
@Table(name = "pfdetail")
@Data
public class PortfolioDetailEntity 
{
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer portfoliodetailId;
	private Integer qty;
	private Integer portfolioId;
	private Float price;
	private Integer equityId;
	private Date purchasedAt;
	@Column(length = 5)
	private String bsInd;
	
	
	
}
