package com.arth.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.arth.entity.NewsEntity;

@Repository
public interface NewsRepository extends JpaRepository<NewsEntity, Integer>
{
	
}
