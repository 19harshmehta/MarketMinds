package com.arth.dto;

import java.util.ArrayList;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

import lombok.Data;

@JsonIgnoreProperties(ignoreUnknown = true)
@Data
public class Root 
{
	private Result result;
	private ArrayList<ResponseDtoList> responseDTOList;
	@JsonIgnore
	private ArrayList<Object> industryList;
	@JsonIgnore
	public boolean isThisEndOfResponse;

	@JsonIgnore
	private Integer totalListSize;

	private LastUpdatedTime lastUpdateTime;
}
