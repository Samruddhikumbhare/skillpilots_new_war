package com.skillpilots.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.skillpilots.model.CompanyTest;
import com.skillpilots.model.SectionQuestion;
import com.skillpilots.model.TestSection;

public interface SectionQuestionRepository extends JpaRepository<SectionQuestion, Long> {

	@Query(value=" select * from  section_ques where section_id=:sectionId ",nativeQuery = true)
	List<SectionQuestion> getAllSectionQuestionBySectionId(@Param("sectionId") Long sectionId);
	

	
	  @Query(value = "SELECT * FROM section_ques " +
              "WHERE section_id = :sectionId " +
              "ORDER BY RAND() " +
              "LIMIT :noOfQuestions", nativeQuery = true)
List<SectionQuestion> getRandomQuestions(@Param("sectionId") Long sectionId, 
                                        @Param("noOfQuestions") int noOfQuestions);



	;


}
