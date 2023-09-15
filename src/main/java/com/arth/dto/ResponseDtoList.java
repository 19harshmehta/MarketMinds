package com.arth.dto;

import com.fasterxml.jackson.annotation.JsonProperty;

import lombok.Data;

@Data
public class ResponseDtoList 
{
	public int sId;
    public String sn;
    public String sc;
    public String in;
    public Object mc;
    public double cp;
    public double pchg;
    @JsonProperty("52h") 
    public double _52h;
    @JsonProperty("52l") 
    public double _52l;
    public Lt lt;
}
