package com.skillpilots.service;

import java.util.List;

import com.skillpilots.model.CollegeInternalRequest;



public interface CollegeInternalRequestService {
	
	  List<Object[]> getAllInternalReqByCollge( Long userId,Long deptId);

	CollegeInternalRequest saveInternalReq(CollegeInternalRequest collegeInternalRequest);

	CollegeInternalRequest getInternalRequest(Long req_id);

	List<Object[]>  getAllInternalRequestsbyCollege(Long user_id);
	
	 void updateRequestMessage(String request_msg,Long request_id);
}
