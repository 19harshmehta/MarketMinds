package com.arth.repository;


import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;


import com.arth.entity.RoleEntity;


@Repository
public interface RoleRepository extends JpaRepository<RoleEntity,Integer>
{
	RoleEntity findByRoleName(String roleName);
	
	
	
}
