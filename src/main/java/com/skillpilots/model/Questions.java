package com.skillpilots.model;

import java.util.List;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.skillpilots.enumclass.QuestionType;

import jakarta.persistence.Column;
import jakarta.persistence.ElementCollection;
import jakarta.persistence.Entity;
import jakarta.persistence.EnumType;
import jakarta.persistence.Enumerated;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import lombok.Data;
@Entity
@Data
public class Questions {

	
	
	@Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "question_id")
    private Long id;
    
    private String text;

    private String option1;
    private String option2;
    private String option3;
    private String option4;

    private String correctAnswer;
    @ElementCollection
    private List<String> correctAnswers;  // To support multiple correct answers

    private int marksques;  // Marks for the question

    @Enumerated(EnumType.STRING)
    private QuestionType type;  // Type of the question

    private String difficultyLevel;  // Difficulty level of the question

    
    
    @JsonIgnore
    @ManyToOne
    @JoinColumn(name = "testId", nullable = false)
    private AssessmentTest assessmentTest;

}
