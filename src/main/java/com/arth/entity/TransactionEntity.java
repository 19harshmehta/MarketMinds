package com.arth.entity;

import java.util.Date;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import lombok.Data;

@Entity
@Table(name = "transaction")
@Data
public class TransactionEntity 
{
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	Integer transactionId;
	Integer userId;
	Date createdAt;
	Integer statusInd;
	Integer planId;
	Float amount;
	Float tax;
	String authCode;
	String refcode;
}
