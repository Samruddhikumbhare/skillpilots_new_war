package com.skillpilots.service;

import java.util.Date;
import java.util.List;
import java.util.Optional;

import com.skillpilots.Dto.CollDeptLinkDto;
import com.skillpilots.model.CollCompTieup;
import com.skillpilots.model.CollDeptLink;
import com.skillpilots.model.College;
import com.skillpilots.model.CompDeptLink;

public interface CollegeService {
	

    // Method to save a college entity
    boolean saveCollege(College college);

    // Method to update a college entity
    void updateCollege(College college);

    // Method to delete a college entity by ID
    void deleteCollegeById(Long collegeId);

    // Method to get a college entity by ID
    College getCollegeById(Long collegeId);

    // Method to get all colleges
    List<College> getAllColleges();

	List<College> getAllTieColleges();



	List<College> findAllByType(short type);



//	List<College> getAllTieCollegesByType();
	
	College getCollegeByEmail(String emailId);

	public CollDeptLink getBalanceDataId(Long college_id, Long dept_id,Date expiration_date);

	Optional<College> findById(int college_id);



	
	
}
