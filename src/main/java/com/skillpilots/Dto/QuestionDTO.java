package com.skillpilots.Dto;

import lombok.Data;

@Data
public class QuestionDTO {
		private Long questionId;
		private Long sectionId;
	    private String question;
	    private String quesType;
	    private int quesTime;
	   
	    private int markPerQues;
	    private String optionA;
	    private String optionB;
	    private String optionC;
	    private String optionD;
	    private String ans;
}
