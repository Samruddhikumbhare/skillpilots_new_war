package com.skillpilots.service;

import java.time.LocalDate;
import java.util.List;

import com.skillpilots.model.CollCompTieup;
import com.skillpilots.model.College;

public interface TieUpService {



	void saveTieUpRequest(Long companyId, Long collegeId,String companyName);
	List<CollCompTieup> getAllReceiveCompany(Long collegeId,String requested_by);
//	List<CollCompTieup> getAllTieCollegesByStatus2(Long collegeId);
	
	void saveTieUpReqCompany(Long companyId, Long collegeId,String collegeName);
	
	void updateStatus(Long tieupId, String string,LocalDate date);
	//List<CollCompTieup> getAllTieCompaniesByStatus2();
	List<CollCompTieup> getAllTieCompanesByStatus(Long collegeId,String requested_by);
	List<CollCompTieup>getCompanyTieUpList(Long companyId,String requested_by);
	List<CollCompTieup> getCollegeReceivedReq(Long companyId,String requested_by);
	List<CollCompTieup> getAllTieCompany(Long collegeId,String requested_by);
	List<CollCompTieup> getCollegeTie(Long collegeId,String requested_by);

}
