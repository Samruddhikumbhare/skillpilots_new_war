package com.skillpilots.service;

import java.util.List;
import java.util.Map;

import com.skillpilots.model.AssessmentTest;

public interface ExamService {
	

	public List<AssessmentTest> getAllTests();
	
	 public List<Map<String, Object>> getTestsForStudent(Long studentId);
	public AssessmentTest findByTestId(Long testId);
}
