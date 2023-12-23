package com.arth.services;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.arth.entity.EquityEntity;
import com.arth.repository.EquityRepository;

@Service
public class EquityService 
{
	@Autowired
    private EquityRepository equityRepository;

//    public List<EquityEntity> getEquityByEqId(Integer eqId) 
//    {
//        return equityRepository.findByEquityId(eqId);
//    }
}
