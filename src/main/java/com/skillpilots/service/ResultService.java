package com.skillpilots.service;

import java.util.List;

import com.skillpilots.Dto.QuestionResponse;
import com.skillpilots.model.Results;

public interface ResultService {
	
    public void submitTest(Long studentId, Long testId, List<QuestionResponse> questionResponses) ;
    
    public Results saveResult(Results results);

	public Results getResultByStudentIdTestId(Long id,Long testId);

}
