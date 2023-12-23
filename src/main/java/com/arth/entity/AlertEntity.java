package com.arth.entity;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import lombok.Data;

@Entity
@Table(name = "alerts")
@Data
public class AlertEntity 
{
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	Integer alertId;
	Integer userId;
	Integer equityId;
	Float targetPrice;
	Integer activeInd;
}
