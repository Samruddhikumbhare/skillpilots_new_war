package com.skillpilots.Dto;

import lombok.Data;

@Data
public class QuestionResponse {
	  private Long questionId;
	    private String selectedOption;
	    private String correctAnswer;
	    private int mark;
}
