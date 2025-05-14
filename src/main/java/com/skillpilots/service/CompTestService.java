package com.skillpilots.service;

import java.util.Collection;
import java.util.HashMap;
import java.util.List;
import java.util.Optional;

import org.springframework.data.repository.query.Param;

import com.skillpilots.model.CompanyTest;
import com.skillpilots.model.SectionQuestion;
import com.skillpilots.model.TestSection;

public interface CompTestService {

	void save(CompanyTest companyTest);

	List<CompanyTest> getCompanyTestByCompanyId(Long company_id);

	List<CompanyTest> getCompanyTestByCompanyId2(Long companyId);

	List<CompanyTest> getCompanyTestData_by_status1(Long companyId,String status);

      CompanyTest getCompanyTestData_by_id(Long test_id);

	List<TestSection> getTestSections(Long test_id);

	List<SectionQuestion> getRandomQuestions(Long section_id, int total_ques);
	
	TestSection getTestSection(Long section_id);
	
    void updateCompanyTestStatus( Long testId, boolean status);


}
