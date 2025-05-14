package com.skillpilots.service;

import java.util.List;

import com.skillpilots.model.Questions;

public interface QuestionService {
	
	public List<Questions> getQuestionByTestId(Long testId);

}
