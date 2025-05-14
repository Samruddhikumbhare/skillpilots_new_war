package com.skillpilots.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.skillpilots.model.Questions;

public interface QuestionRepository extends JpaRepository<Questions, Long> {

    List<Questions> findByAssessmentTestTesId(Long testId);

	
}