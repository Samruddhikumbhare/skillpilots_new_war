package com.skillpilots.model;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;

import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;

import jakarta.persistence.Table;
import lombok.Data;
@Data
@Entity
@Table(name="section_ques")
public class SectionQuestion {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="question_id")
	private Long questionId;
	 private Long sectionId;
	    private String question;
	    private String quesType;
	    private int quesTime;
	   
	    private int mark_per_ques;
	    private String optionA;
	    private String optionB;
	    private String optionC;
	    private String optionD;
	    private String ans;
	
	
	
}
