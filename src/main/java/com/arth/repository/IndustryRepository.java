package com.arth.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.arth.entity.IndustryEntity;

@Repository
public interface IndustryRepository extends JpaRepository<IndustryEntity, Integer>
{

}
