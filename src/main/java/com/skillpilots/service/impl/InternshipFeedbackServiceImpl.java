package com.skillpilots.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.skillpilots.model.FeedbackData;
import com.skillpilots.model.ProgressData;
import com.skillpilots.repository.InternshipFeedbackRepository;
import com.skillpilots.repository.InternshipRepository;
import com.skillpilots.repository.ProgressDataRepository;
import com.skillpilots.service.InternshipFeedbackService;



@Service
public class InternshipFeedbackServiceImpl implements InternshipFeedbackService {

	@Autowired
	private InternshipRepository internshipRepository;
	
	@Autowired
	private InternshipFeedbackRepository  internshipFeedbackRepository;
	
	@Autowired
	private ProgressDataRepository progressDataRepository;
	
	@Override
	public Long getNoOfCompletedInternships(Long college_id, Long company_id) {
		return internshipRepository.getNoOfCompletedInternships(college_id, company_id);
	}

	@Override
	public FeedbackData getFeedbackOfCollege(Long college_id, Long company_id) {
	
		return internshipFeedbackRepository.getFeedbackOfCollege(college_id, company_id);
	}

	@Override
	public void saveFeedback(FeedbackData feedbackData) {
		internshipFeedbackRepository.save(feedbackData);
	}

	@Override
	public FeedbackData getFeedbackData(Long internship_id, Long student_id) {
		
		return internshipFeedbackRepository.getFeedbackData(internship_id, student_id);
	}

	@Override
	public ProgressData getProgressData(Long internship_id) {
		return progressDataRepository.getProgressData(internship_id);
	}

	@Override
	public ProgressData saveProgressData(ProgressData progressData) {
		return progressDataRepository.save(progressData);
	}

}
