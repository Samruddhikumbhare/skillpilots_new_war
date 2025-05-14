package com.skillpilots.service;

import java.util.List;

import com.skillpilots.Dto.QuestionDTO;
import com.skillpilots.model.SectionQuestion;

public interface SectionQuestionService {

	SectionQuestion saveQuestion(SectionQuestion question);

	List<SectionQuestion> findAllBySectionId(Long sectionId);

	void updateQuestion(QuestionDTO questionDTO);

	void deleteById(Long questionId);

}
