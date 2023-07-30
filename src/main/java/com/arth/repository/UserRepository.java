package com.arth.repository;

import org.springframework.data.jpa.repository.JpaRepository;


import org.springframework.stereotype.Repository;

import com.arth.entity.UserEntity;
import java.util.Optional;


@Repository
public interface UserRepository extends JpaRepository<UserEntity, Integer> 
{
	Optional<UserEntity> findByEmail(String email);
}
