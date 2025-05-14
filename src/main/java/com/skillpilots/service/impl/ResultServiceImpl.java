package com.skillpilots.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.skillpilots.Dto.QuestionResponse;
import com.skillpilots.model.AssessmentTest;
import com.skillpilots.model.Results;
import com.skillpilots.repository.AsssesmentRepository;
import com.skillpilots.repository.ResultRepository;
import com.skillpilots.service.ResultService;
@Service
public class ResultServiceImpl implements ResultService{
	
	@Autowired
	private AsssesmentRepository asssesmentRepository;
	@Autowired
	private ResultRepository resultRepository;

	@Override
	public void submitTest(Long studentId, Long testId, List<QuestionResponse> questionResponses) {
		int correctAns = 0;
        int wrongAns = 0;
        int noAns = 0;
        int totalMarks = 0;
        int outof = questionResponses.size();

        AssessmentTest assessmentTest = asssesmentRepository.findById(testId).orElseThrow();
        // Calculate marks
        for (QuestionResponse response : questionResponses) {
            if (response.getSelectedOption() != null && response.getSelectedOption().equals(response.getCorrectAnswer())) {
                correctAns++;
                totalMarks += response.getMark();
            } else if (response.getSelectedOption() != null && !response.getSelectedOption().equals(response.getCorrectAnswer())) {
                wrongAns++;
            } else {
                noAns++;
            }
        }

        // Calculate result status
        String resultStatus;
        if (totalMarks >= assessmentTest.getCut_off()) {
            resultStatus = "Pass";
        } else {
            resultStatus = "Fail";
        }

        // Save test result
        Results result = new Results();
        result.setStudentId(studentId);
        result.setTestId(testId);; // Set the AssessmentTest reference
        result.setCorrectAns(correctAns);
        result.setWrongAns(wrongAns);
        result.setNoAns(noAns);
        result.setOutof(outof);
        result.setTotalMarks(totalMarks);
        result.setResultStatus(resultStatus);
        resultRepository.save(result);
    }

	@Override
	public Results saveResult(Results results) {
		return resultRepository.save(results);
	}

	@Override
	public Results getResultByStudentIdTestId(Long id,Long testId) {
		return resultRepository.findByStudentIdAndTestId(id, testId);
	}

	
}
