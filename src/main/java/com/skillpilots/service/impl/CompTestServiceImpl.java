package com.skillpilots.service.impl;

import java.util.Collection;
import java.util.HashMap;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.skillpilots.model.CompanyTest;
import com.skillpilots.model.SectionQuestion;
import com.skillpilots.model.TestSection;
import com.skillpilots.repository.CompanyTestRepository;
import com.skillpilots.repository.SectionQuestionRepository;
import com.skillpilots.repository.TestSectionRepository;
import com.skillpilots.service.CompTestService;
import com.skillpilots.utility.ProjectConstants;

@Service
public class CompTestServiceImpl implements CompTestService {

	@Autowired
	private CompanyTestRepository companyTestRepository;
	@Autowired
	private TestSectionRepository testSectionRepository; 
	@Autowired
	private SectionQuestionRepository sectionQuestionRepository; 
	@Override
	public void save(CompanyTest companyTest) {
		companyTestRepository.save(companyTest);
	}
	@Override
	public List<CompanyTest> getCompanyTestByCompanyId(Long company_id) {
		return companyTestRepository.getCompanyTestByCompanyId(company_id);
	}
	@Override
	public List<CompanyTest> getCompanyTestByCompanyId2(Long companyId) {
		return companyTestRepository.getCompanyTestByCompanyId(companyId);
	}
	@Override
	public List<CompanyTest> getCompanyTestData_by_status1(Long companyId,String status) {
		
		return companyTestRepository.getTestDataByCompanyId(companyId,status);
	}
	@Override
	public CompanyTest getCompanyTestData_by_id(Long test_id) {
		
		return companyTestRepository.findById(test_id).orElseThrow(()-> new  RuntimeException("Company Test Not Found"));
	}
	@Override
	public List<TestSection> getTestSections(Long test_id) {
		return testSectionRepository.findSectionByTestId(test_id);
		
		
	   
	}
	@Override
	public List<SectionQuestion> getRandomQuestions(Long section_id, int total_ques) {
		
		return sectionQuestionRepository.getRandomQuestions(section_id, total_ques);
	}
	@Override
	public TestSection getTestSection(Long section_id) {
		return testSectionRepository.findById(section_id).orElseThrow(()-> new RuntimeException("Test Section not found"));
	}
	@Override
	public void updateCompanyTestStatus(Long testId, boolean status) {
		  String statusValue = status ? ProjectConstants.COMPANY_TEST_STATUS_ACTIVE : ProjectConstants.COMPANY_TEST_STATUS_INACTIVE;
	        companyTestRepository.updateCompanyTestStatus(testId, statusValue);		
	}}


