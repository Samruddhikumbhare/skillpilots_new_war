package com.skillpilots.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.skillpilots.model.CollegeInternalRequest;
import com.skillpilots.repository.CollegeInternalReqRepository;
import com.skillpilots.service.CollegeInternalRequestService;
@Service
public class CollegeInternalReqSerImpl implements CollegeInternalRequestService {

	
	@Autowired
	private CollegeInternalReqRepository collegeInternalReqRepository;
	
	@Override
	public List<Object[]> getAllInternalReqByCollge(Long userId, Long deptId) {
		return collegeInternalReqRepository.getAllInternalReqByCollge(userId, deptId);
	}

	@Override
	public CollegeInternalRequest saveInternalReq(CollegeInternalRequest collegeInternalRequest) {
		return collegeInternalReqRepository.save(collegeInternalRequest);
	}

	@Override
	public CollegeInternalRequest getInternalRequest(Long req_id) {
		return collegeInternalReqRepository.findById(req_id).orElseThrow(()-> new RuntimeException("College request not found"+req_id));
	}

	@Override
	public List<Object[]> getAllInternalRequestsbyCollege(Long user_id) {
		return collegeInternalReqRepository.getAllInternalRequestsbyCollege(user_id);
	}

	@Override
	public void updateRequestMessage(String request_msg, Long request_id) {
		 collegeInternalReqRepository.updateRequestMessage(request_msg, request_id);
	}

}
