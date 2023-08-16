package com.arth.entity;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name = "equity")
public class EquityEntity 
{
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	Integer equityId;
	String equityName ;
	String symbol;
	String series;
	Float WH52;
	Float WL52;
	Float todayOpen;
	Float todayClose;
	Float todayHigh;
	Float todayLow;
	Integer activeInd;
	Integer buySellInd;
	
	public Integer getEquityId() {
		return equityId;
	}
	public void setEquityId(Integer equityId) {
		this.equityId = equityId;
	}
	public String getEquityName() {
		return equityName;
	}
	public void setEquityName(String equityName) {
		this.equityName = equityName;
	}
	public String getSymbol() {
		return symbol;
	}
	public void setSymbol(String symbol) {
		this.symbol = symbol;
	}
	public String getSeries() {
		return series;
	}
	public void setSeries(String series) {
		this.series = series;
	}
	public Float getWH52() {
		return WH52;
	}
	public void setWH52(Float wH52) {
		WH52 = wH52;
	}
	public Float getWL52() {
		return WL52;
	}
	public void setWL52(Float wL52) {
		WL52 = wL52;
	}
	public Float getTodayOpen() {
		return todayOpen;
	}
	public void setTodayOpen(Float todayOpen) {
		this.todayOpen = todayOpen;
	}
	public Float getTodayClose() {
		return todayClose;
	}
	public void setTodayClose(Float todayClose) {
		this.todayClose = todayClose;
	}
	public Float getTodayHigh() {
		return todayHigh;
	}
	public void setTodayHigh(Float todayHigh) {
		this.todayHigh = todayHigh;
	}
	public Float getTodayLow() {
		return todayLow;
	}
	public void setTodayLow(Float todayLow) {
		this.todayLow = todayLow;
	}
	public Integer getActiveInd() {
		return activeInd;
	}
	public void setActiveInd(Integer activeInd) {
		this.activeInd = activeInd;
	}
	public Integer getBuySellInd() {
		return buySellInd;
	}
	public void setBuySellInd(Integer buySellInd) {
		this.buySellInd = buySellInd;
	}
	

}
