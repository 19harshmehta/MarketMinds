package com.arth.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.arth.entity.UserEntity;

import java.util.List;
import java.util.Optional;


@Repository
public interface UserRepository extends JpaRepository<UserEntity, Integer> 
{
	Optional<UserEntity> findByEmail(String email);
	
	//sql    
	@Query(value = "select * from users where deleted_at is null", nativeQuery = true)
	List<UserEntity> getActiveUsers();
	List<UserEntity> findByPremiumInd(Integer premiumInd);
	
	Optional<UserEntity> findByUserId(Integer userId);

}
