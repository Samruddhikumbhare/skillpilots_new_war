package com.skillpilots.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.skillpilots.Dto.QuestionDTO;
import com.skillpilots.model.SectionQuestion;
import com.skillpilots.repository.SectionQuestionRepository;
import com.skillpilots.service.SectionQuestionService;
@Service
public class SectionQuestionServiceImpl implements SectionQuestionService {
	@Autowired
	private SectionQuestionRepository sectionQuestionRepository;
	
	
	@Override
	public SectionQuestion saveQuestion(SectionQuestion question) {
		// TODO Auto-generated method stub
		return sectionQuestionRepository.save(question);
	}


	@Override
	public List<SectionQuestion> findAllBySectionId(Long sectionId) {
		// TODO Auto-generated method stub
		return sectionQuestionRepository.getAllSectionQuestionBySectionId(sectionId);
	}


	@Override
	public void updateQuestion(QuestionDTO questionDTO) {
		// Retrieve the existing question entity from the database
	    SectionQuestion existingQuestion = sectionQuestionRepository.findById(questionDTO.getQuestionId())
	                                                    .orElseThrow();

	    // Update the fields of the existing question entity with the values from the DTO
	    existingQuestion.setQuestion(questionDTO.getQuestion());
	    existingQuestion.setOptionA(questionDTO.getOptionA());
	    existingQuestion.setOptionB(questionDTO.getOptionB());
	    existingQuestion.setOptionC(questionDTO.getOptionC());
	    existingQuestion.setOptionD(questionDTO.getOptionD());
	    existingQuestion.setQuesTime(questionDTO.getQuesTime());
	    existingQuestion.setMark_per_ques(questionDTO.getMarkPerQues());
	    existingQuestion.setAns(questionDTO.getAns());

	    // Save the updated question entity back to the database
	    sectionQuestionRepository.save(existingQuestion);
		
	}


	@Override
	public void deleteById(Long questionId) {
		// TODO Auto-generated method stub
		sectionQuestionRepository.deleteById(questionId);
	}




}
