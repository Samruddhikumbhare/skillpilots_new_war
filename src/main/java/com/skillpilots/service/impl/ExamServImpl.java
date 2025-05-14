package com.skillpilots.service.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.skillpilots.model.AssessmentTest;
import com.skillpilots.model.Results;
import com.skillpilots.repository.AsssesmentRepository;
import com.skillpilots.repository.ResultRepository;
import com.skillpilots.service.ExamService;
@Service
public class ExamServImpl implements ExamService {

	
	@Autowired
	private AsssesmentRepository asssesmentRepository;
	@Autowired
	private ResultRepository resultRepository;
	@Override
	public List<AssessmentTest> getAllTests() {
		return asssesmentRepository.findAll();
	}

	@Override
	public AssessmentTest findByTestId(Long testId) {
		return asssesmentRepository.findById(testId).orElseThrow(()-> new RuntimeException("Test not found"));
	}

	@Override
	public List<Map<String, Object>> getTestsForStudent(Long studentId) {
		 List<AssessmentTest> tests = asssesmentRepository.findAll();
	        List<Map<String, Object>> response = new ArrayList<>();

	        for (AssessmentTest test : tests) {
	            Map<String, Object> testData = new HashMap<>();
	            testData.put("testId", test.getTesId());
	            testData.put("testName", test.getTestName());
	            testData.put("totalMarks", test.getTotal_mark());
	            testData.put("totalQuestions", test.getTotal_que());
	            testData.put("time", test.getTime());
	            
	            // Default status: "Start Test"
	            String status = "Start Test";

	            Results resultOpt = resultRepository.findByStudentIdAndTestId(studentId, test.getTesId());

	            if (resultOpt!=null) {
	              //  Results result = resultOpt.get();
	                Date testTakenDate = resultOpt.getTestTakenDate();
	                long currentTime = System.currentTimeMillis();
	                long testTime = testTakenDate.getTime();
	                long oneWeekMillis = 7 * 24 * 60 * 60 * 1000L;

	                if ((currentTime - testTime) < oneWeekMillis) {
	                    status = "You can give the test after 1 week";
	                } else {
	                    status = "Retake Test";
	                }
	            }

	            testData.put("status", status);
	            response.add(testData);
	        }
	        return response;
	    }
	}


