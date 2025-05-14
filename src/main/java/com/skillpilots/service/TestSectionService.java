package com.skillpilots.service;

import java.util.List;

import com.skillpilots.model.TestSection;

public interface TestSectionService {

	void saveAll(List<TestSection> sections);

	List<TestSection> findAllByTest_Id(Long testId);
	
	

}
