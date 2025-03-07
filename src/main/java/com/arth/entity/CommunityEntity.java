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
@Table(name = "community")
@Data
public class CommunityEntity 
{
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer communityId;
	
	private String comment;
	private Integer equityId;
	private Date publishDate;
	@ManyToOne
	@JoinColumn(name = "userId")
	private UserEntity user;
}
