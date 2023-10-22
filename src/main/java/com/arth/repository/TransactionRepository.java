package com.arth.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.arth.entity.TransactionEntity;

@Repository
public interface TransactionRepository  extends JpaRepository<TransactionEntity, Integer>
{

}
