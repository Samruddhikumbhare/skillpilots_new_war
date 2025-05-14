package com.skillpilots.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.skillpilots.model.Technologies;

public interface TechnologyRepository extends JpaRepository<Technologies, Long> {
	@Query(value="select  technology_name  from technologies",nativeQuery = true)
	List<String> getTechnologyNameList();
	
	@Query(value="select Distinct technology from advertisements_comp", nativeQuery = true)
	List<String> getTechList();
	
	


}
