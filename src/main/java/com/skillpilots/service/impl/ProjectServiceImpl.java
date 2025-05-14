package com.skillpilots.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.skillpilots.model.LiveProject;
import com.skillpilots.repository.ProjectRepository;
import com.skillpilots.service.ProjectService;

@Service
public class ProjectServiceImpl implements ProjectService{
	
	@Autowired
	private ProjectRepository projectRepository;

	@Override
	public LiveProject getLastProjectByUserId(Long userId) {
		 return projectRepository.findTop1ByUserIdOrderByIdDesc(userId)
		            .stream()
		            .findFirst()
		            .orElse(null);
	}

}
