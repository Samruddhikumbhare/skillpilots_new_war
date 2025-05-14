package com.skillpilots.service.impl;

import java.time.LocalDate;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.skillpilots.repository.CollDeptRepository;
import com.skillpilots.repository.InternshipRepository;
import com.skillpilots.service.CollegeReportService;
@Service
public class CollegeReportServiceImpl implements CollegeReportService {
	@Autowired
	private CollDeptRepository collDeptRepository;
	@Autowired
	private InternshipRepository internshipRepository;
	
	@Override
	public List<Object[]> getDepartments(Long college_id) {
		// TODO Auto-generated method stub
		return collDeptRepository.getDepartments(college_id);
	}


	@Override
	public List<String> getInternshipTech(Long college_id, int dept_id) {
		// TODO Auto-generated method stub
		return internshipRepository.getInternshipTech(college_id, dept_id);
	}


	@Override
	public List<String[]> getInternshipInd(Long college_id, int dept_id) {
		// TODO Auto-generated method stub
		return internshipRepository.getInternshipInd(college_id, dept_id);
	}




	


	

}
