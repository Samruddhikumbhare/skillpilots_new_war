package com.skillpilots.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.skillpilots.model.Universities;
import com.skillpilots.repository.UniversitiesRepo;
import com.skillpilots.service.UniversitiesService;

@Service
public class UniversitiesServiceImpl implements UniversitiesService {
	@Autowired
	private UniversitiesRepo universitiesRepo;
	
	
	@Override
	public List<Universities> getAllUniversities() {
		// TODO Auto-generated method stub
		return universitiesRepo.findAll();
	}
}