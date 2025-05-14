package com.skillpilots.service;

import java.util.List;
import java.util.Map;

import com.skillpilots.model.CompanyAssignment;

public interface CompanyAssignmentService {

    public List<Map<String, Object>> getAssignmentDetailsByStudent(Long studentId) ;
	
}
