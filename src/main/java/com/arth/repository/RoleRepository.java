package com.arth.repository;


import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;


import com.arth.entity.RoleEntity;



@Repository
public interface RoleRepository extends JpaRepository<RoleEntity,Integer>
{
	RoleEntity findByRoleName(String roleName);
	
	@Query(value = "select * from roles where status_ind = 0", nativeQuery = true)
	List<RoleEntity> getActiveroles();
	
	
	
}
