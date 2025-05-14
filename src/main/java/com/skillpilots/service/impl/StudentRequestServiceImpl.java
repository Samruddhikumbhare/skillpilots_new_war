package com.skillpilots.service.impl;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Service;

import com.skillpilots.Dto.CollegeInternalReqDto;
import com.skillpilots.model.CollegeInternalRequest;
import com.skillpilots.model.CompAdvertisement;
import com.skillpilots.model.StudentRequest;
import com.skillpilots.model.User;
import com.skillpilots.repository.CollegeInternalReqRepository;
import com.skillpilots.repository.CompanyInternalRequestRepository;
import com.skillpilots.repository.StudentRequestRepository;
import com.skillpilots.service.StudentRequestService;
import com.skillpilots.service.StudentService;
import com.skillpilots.service.UserService;
import com.skillpilots.utility.ProjectConstants;

import jakarta.servlet.http.HttpSession;
@Service
public  class StudentRequestServiceImpl implements StudentRequestService {
	@Autowired
	private StudentRequestRepository studentRequestRepository;
	@Autowired
	private CompanyInternalRequestRepository companyInternalRequestRepository;
	@Autowired
	private CollegeInternalReqRepository collegeInternalReqRepository;
	@Autowired
	private HttpSession session;
	@Autowired
	private UserService userService;
	@Autowired
	private StudentService studentService;
	@Override
	public StudentRequest saveStudentRequest(CompAdvertisement compAdvertisement ) {
		
		User user = (User) session.getAttribute("user");
		
		StudentRequest student_req = new StudentRequest();
		
		
		student_req.setStudent_id(user.getId());
		student_req.setAdvertisement_id(compAdvertisement.getId());
		student_req.setCompany_id(compAdvertisement.getCompanyId());
		student_req.setCreation_date(new Date());
		student_req.setDuration(compAdvertisement.getDuration());
		student_req.setApproval_status("pending");
		student_req.setTechnology_name(compAdvertisement.getTechnology());
		student_req.setExpiration_date(userService.getDateAfterDays(new Date(), ProjectConstants.req_expiration_after_days));
		
		return studentRequestRepository.save(student_req);
		 
	}
	@Override
	public List<Object[]> getAppliedStudentOfCompany(Long studentId) {
		return studentRequestRepository.getAppliedStudentsOfCompany(studentId);
	}
	@Override
	public StudentRequest findApprovalStatusById(Long studentId) {
		return studentRequestRepository.getApprovelStatusById(studentId);
	}
	@Override
	public List<StudentRequest> findInternshipByConpanyId(Long companyId) {
		return studentRequestRepository.findAllByCompanyId(companyId);
	}
	@Override
	public StudentRequest findStudentReqByCommonId(Long commonId) {
		return studentRequestRepository.findByCommonId(commonId);
	}
	@Override
	public List<StudentRequest> getExternalStudentRequest(Long companyId) {
	
		return studentRequestRepository.getExternalStuedentRequest(companyId);
	}
	 
	@Override
	  public StudentRequest approveStudentRequest(Long request_id) {
	        StudentRequest studentRequest = studentRequestRepository.findById(request_id)
	            .orElseThrow(() -> new RuntimeException("Request not found with ID: " + request_id));

	        
	        return studentRequest;
	    }
	@Override
	public StudentRequest getStudentRequest(Long request_id) {
		StudentRequest studentRequest = studentRequestRepository.findById(request_id)
	            .orElseThrow(() -> new RuntimeException("Request not found with ID: " + request_id));

	        
	        return studentRequest;
	}
	@Override
	public List<String> getAppliedCompanies(Long student_id) {
		
		return studentRequestRepository.getAppliedCompanies(student_id);
	}
	@Override
	public StudentRequest getStudentReqAgainstAdv(Long studentId,Long avdId) {
	    
	    	return studentRequestRepository.getStudentReqAgainstAdvNotPresent(studentId,avdId);
	    }
	
	@Override
	public CollegeInternalRequest isStudentApplied(Long companyId, Long studentId) {
		
		return companyInternalRequestRepository.isStudentAppliedAlready(companyId, studentId);
	}
	@Override
	public List<CollegeInternalReqDto> getClgInternalReqOfStudentWithDept(Long student, Long student_id, Long college_id, Date expiration_date, String status) {
        List<Object[]> resultList = collegeInternalReqRepository.getClgInternalReqOfStudentWithDept(student, student_id, college_id, expiration_date, status);
        List<CollegeInternalReqDto> dtos = new ArrayList<>();
        for (Object[] result : resultList) {
        	CollegeInternalReqDto dto = new CollegeInternalReqDto();
            dto.setCompanyName((String) result[0]);
            dto.setUserId((Long) result[1]);
            dto.setRequestMsg((String) result[2]);
            dto.setRejectionMsg((String) result[3]);
            dto.setTechnology((String) result[4]);
            dto.setDuration((int) result[5]);
            dto.setApprovalStatus((String) result[6]);
            dto.setAgainstExtReq((Long) result[7]);
            dto.setForUsers((String) result[8]);
            dto.setCreationDate((Date) result[9]);
            dto.setUpdationDate((Date) result[10]);
            dto.setExpirationDate((Date) result[11]);
            dto.setRequestId((Long) result[12]);
            dto.setTestDataId((Long) result[13]);
           // dto.setTestDataExpirationDate((Date) result[14]);
            dto.setTestDataStatus((String) result[15]);
            
            dtos.add(dto);
        }
        return dtos;
    }
	@Override
	public StudentRequest saveRequest(StudentRequest studentRequest) {
		return studentRequestRepository.save(studentRequest);
	}
	@Override
	public List<Map<String, Object>> getStudentRequests(Long company_id, Date expiration_date) {
	    List<Object[]> results = studentRequestRepository.getAllStudentRequest(company_id, expiration_date);
	    List<Map<String, Object>> studentRequestList = new ArrayList<>();
	    for (Object[] row : results) {
	        Map<String, Object> studentRequest = new HashMap<>();
	        studentRequest.put("request_id", row[0]);
	        studentRequest.put("approval_status", row[1]);
	        studentRequest.put("technology_name", row[2]);
	        studentRequest.put("creation_date", row[3]);
	        studentRequest.put("last_status", row[4]);
	        studentRequest.put("advertisement_id", row[5]);
	        studentRequest.put("student_id", row[6]);
	        studentRequest.put("company_id", row[7]);
	        studentRequest.put("expiration_date", row[8]);
	        studentRequest.put("username", row[9]);
	        studentRequest.put("institute_id", row[10]);
	      
	        studentRequestList.add(studentRequest);
	    }
	    return studentRequestList;
	}  
	@Override
	public List<Object[]> getAppliedStudentsFromCollege(Long college_id, Long dept_id) {
        Integer collegeIdInt = college_id != null ? college_id.intValue() : null;

		List<Long> studentIds = userService.getAppliedStudentCollege(collegeIdInt);
		
		if(dept_id!=null) {
			 return studentRequestRepository.getAppliedStudentWithDept(dept_id, studentIds);
		}
		else {
			return studentRequestRepository.getAppliedStudentsFromCollege(studentIds);
		}
	
	}

	}


