package com.skillpilots.service;

import com.skillpilots.model.FeedbackData;
import com.skillpilots.model.ProgressData;

public interface InternshipFeedbackService {
	
	public Long getNoOfCompletedInternships(Long college_id,Long company_id);
	
	public FeedbackData getFeedbackOfCollege(Long college_id, Long company_id) ;

	public void saveFeedback(FeedbackData feedbackData);

	public FeedbackData getFeedbackData(Long internship_id, Long student_id);

	public ProgressData getProgressData(Long internship_id);

	public ProgressData saveProgressData(ProgressData progressData);

	
	
}
