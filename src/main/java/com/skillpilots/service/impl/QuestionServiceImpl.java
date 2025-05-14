package com.skillpilots.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.skillpilots.model.Questions;
import com.skillpilots.repository.QuestionRepository;
import com.skillpilots.service.QuestionService;
@Service
public class QuestionServiceImpl implements QuestionService {
	
	@Autowired
	private QuestionRepository questionRepository;
	
	@Override
	public List<Questions> getQuestionByTestId(Long testId) {
		return questionRepository.findByAssessmentTestTesId(testId);
	}

}
