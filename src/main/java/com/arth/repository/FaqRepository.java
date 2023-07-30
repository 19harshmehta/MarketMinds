package com.arth.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.arth.entity.FaqsEntity;

public interface FaqRepository extends JpaRepository<FaqsEntity, Integer>
{

}
