package com.skillpilots.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.skillpilots.model.TestSection;
import com.skillpilots.repository.TestSectionRepository;
import com.skillpilots.service.TestSectionService;
@Service
public class TestSectionServiceImpl implements TestSectionService{

	@Autowired
	private TestSectionRepository testSectionRepository;
	@Override
	public void saveAll(List<TestSection> sections) {
		// TODO Auto-generated method stub
		testSectionRepository.saveAll(sections);
		
	}
	@Override
	public List<TestSection> findAllByTest_Id(Long testId) {
		// TODO Auto-generated method stub
		return testSectionRepository.findAllByTest_Id(testId);
	}

}
