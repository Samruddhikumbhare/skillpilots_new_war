package com.skillpilots.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.skillpilots.model.FeedbackData;

@Repository
public interface InternshipFeedbackRepository extends JpaRepository<FeedbackData, Long> {
	
	@Query(value=" select * from feedback_data where feedback_from=:college_id and feedback_for=:company_id",nativeQuery = true)
	public FeedbackData getFeedbackOfCollege(Long college_id, Long company_id) ;
		
	@Query(value="select * from  feedback_data where internship_id=:internship_id AND feedback_from=:feedback_from",nativeQuery = true)
	public FeedbackData getFeedbackData(Long internship_id,Long feedback_from) ;
		

}
