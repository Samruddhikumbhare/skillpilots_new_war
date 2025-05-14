package com.skillpilots.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.skillpilots.model.CampusDrive;


public interface CampusDriveRepository extends JpaRepository<CampusDrive, Long>{

	CampusDrive findByEmailId(String email);

}
