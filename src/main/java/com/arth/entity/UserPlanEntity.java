package com.arth.entity;

import java.util.Date;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import lombok.Data;

@Entity
@Data
@Table(name = "userplan")
public class UserPlanEntity 
{
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	Integer userplanId;
	Integer planId;
	Integer transactionId;
	Date startDate;
	Date endDate;
	Integer userId;
	Integer statusInd;
}
