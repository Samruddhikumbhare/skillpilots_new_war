package com.skillpilots.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.skillpilots.model.CompanyAssignment;
import com.skillpilots.repository.CompanyAssignmentRepo;
import com.skillpilots.service.CompanyAssignmentService;

@Service
public class CompanyIAssignmentSerImpl implements CompanyAssignmentService{

	
	@Autowired
	private CompanyAssignmentRepo assignmentRepo;

	@Override
	public List<Map<String, Object>> getAssignmentDetailsByStudent(Long studentId) {
        List<Object[]> results = assignmentRepo.getAssignmentDetailsByStudent(studentId);
        List<Map<String, Object>> assignmentDetails = new ArrayList<>();

        for (Object[] row : results) {
            Map<String, Object> map = new HashMap<>();
            map.put("companyName", row[0]);
            map.put("name", row[1]);
            map.put("description", row[2]);
            map.put("filePath", row[3]);
            map.put("companyId", row[4]);
            map.put("createdAt", row[5]);
            map.put("assignMentId", row[6]);
            assignmentDetails.add(map);
        }

        return assignmentDetails;
    }
	
	

}
