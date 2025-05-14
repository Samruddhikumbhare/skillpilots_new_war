package com.skillpilots.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.skillpilots.model.PlanDetails;

public interface PlanDetailsRepo extends JpaRepository<PlanDetails, Long>{

	public PlanDetails findByUser(String user);
	
}
