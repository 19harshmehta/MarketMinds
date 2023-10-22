package com.arth.entity;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name = "plan")
public class PlanEntity 
{
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	Integer planId;
	Integer duration; //In Months
	Float amount;
	Float 	tax;
	String 	title;
	Integer activeInd;
	
	
	
	
	
	public Integer getPlanId() {
		return planId;
	}
	public void setPlanId(Integer planId) {
		this.planId = planId;
	}
	public Integer getDuration() {
		return duration;
	}
	public void setDuration(Integer duration) {
		this.duration = duration;
	}
	public Float getAmount() {
		return amount;
	}
	public void setAmount(Float amount) {
		this.amount = amount;
	}
	public Float getTax() {
		return tax;
	}
	public void setTax(Float tax) {
		this.tax = tax;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public Integer getActiveInd() {
		return activeInd;
	}
	public void setActiveInd(Integer activeInd) {
		this.activeInd = activeInd;
	}  
	
	
}
