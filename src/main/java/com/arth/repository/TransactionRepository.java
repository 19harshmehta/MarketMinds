package com.arth.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.arth.entity.TransactionEntity;

@Repository
public interface TransactionRepository  extends JpaRepository<TransactionEntity, Integer>
{
	List<TransactionEntity> findByUserId(Integer userId);
}
