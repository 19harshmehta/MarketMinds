package com.arth.entity;

import java.util.Date;


import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;

@Entity
@Table(name = "users")
public class UserEntity 
{
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	Integer userId;
	String firstName;
	String lastName;
	String email;
	String password;
	@Column(length = 8)
	String otp;
	Date otpCreated;
	Date otpValidity;
	Date deletedAt;
	Integer premiumInd;
	Integer statusInd;
	Date premiumDate;
	
	@ManyToOne
	@JoinColumn(name = "roleId",referencedColumnName = "roleId")
	RoleEntity role;
	
	
	public Date getPremiumDate() {
		return premiumDate;
	}
	public void setPremiumDate(Date premiumDate) {
		this.premiumDate = premiumDate;
	}
	
	public Integer getUserId() {
		return userId;
	}
	public void setUserId(Integer userId) {
		this.userId = userId;
	}
	public String getFirstName() {
		return firstName;
	}
	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}
	public String getLastName() {
		return lastName;
	}
	public void setLastName(String lastName) {
		this.lastName = lastName;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getOtp() {
		return otp;
	}
	public void setOtp(String otp) {
		this.otp = otp;
	}
	public Date getOtpCreated() {
		return otpCreated;
	}
	public void setOtpCreated(Date otpCreated) {
		this.otpCreated = otpCreated;
	}
	public Date getOtpValidity() {
		return otpValidity;
	}
	public void setOtpValidity(Date otpValidity) {
		this.otpValidity = otpValidity;
	}
	public Date getDeletedAt() {
		return deletedAt;
	}
	public void setDeletedAt(Date deletedAt) {
		this.deletedAt = deletedAt;
	}
	public RoleEntity getRole() {
		return role;
	}
	public void setRole(RoleEntity role) {
		this.role = role;
	}
	public Integer getPremiumInd() {
		return premiumInd;
	}
	public void setPremiumInd(Integer premiumInd) {
		this.premiumInd = premiumInd;
	}
	public Integer getStatusInd() {
		return statusInd;
	}
	public void setStatusInd(Integer statusInd) {
		this.statusInd = statusInd;
	}
	
	

}
