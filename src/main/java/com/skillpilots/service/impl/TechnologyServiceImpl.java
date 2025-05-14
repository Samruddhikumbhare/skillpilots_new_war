package com.skillpilots.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.skillpilots.model.Technologies;
import com.skillpilots.repository.TechnologyRepository;
import com.skillpilots.service.TechnologyService;
@Service
public class TechnologyServiceImpl implements TechnologyService {

	@Autowired
	private TechnologyRepository technologyRepository;
	
	@Override
	public List<Technologies> getAllTechnology() {
		return technologyRepository.findAll();
	}

	@Override
	public List<String> getTechnologyNameList() {
		return technologyRepository.getTechnologyNameList();
	}

	@Override
	public List<String> getTechList() {
		// TODO Auto-generated method stub
		return technologyRepository.getTechList();
	}

}
