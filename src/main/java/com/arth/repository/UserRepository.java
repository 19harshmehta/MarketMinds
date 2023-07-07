package com.arth.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.arth.entity.UserEntity;

@Repository
public interface UserRepository extends JpaRepository<UserEntity, Integer> 
{

}
