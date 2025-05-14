package com.skillpilots.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.skillpilots.model.PlanDetails;
import com.skillpilots.repository.PlanDetailsRepo;
import com.skillpilots.service.PlanDetailsService;

@Service
public class PlanDetailsServiceImpl implements PlanDetailsService {

	@Autowired
	private PlanDetailsRepo planDetailsRepo;
	
	
	@Override
	public PlanDetails getPlanDetails(String user) {
		return planDetailsRepo.findByUser(user);
	}

}
