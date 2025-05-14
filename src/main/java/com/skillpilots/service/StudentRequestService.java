package com.skillpilots.service;

import java.util.Date;
import java.util.List;
import java.util.Map;

import org.springframework.data.repository.query.Param;

import com.skillpilots.Dto.CollegeInternalReqDto;
import com.skillpilots.model.CollegeInternalRequest;
import com.skillpilots.model.CompAdvertisement;
import com.skillpilots.model.Student;
import com.skillpilots.model.StudentRequest;
import com.skillpilots.model.User;

public interface StudentRequestService {
	public StudentRequest saveStudentRequest(CompAdvertisement comp_advertisements);
	
	public StudentRequest saveRequest(StudentRequest studentRequest);
	public List<Object[]> getAppliedStudentOfCompany(Long studentId);

	public StudentRequest findApprovalStatusById(Long studentId);
	public List<StudentRequest> findInternshipByConpanyId(Long companyId);
	public StudentRequest findStudentReqByCommonId(Long commonId);
	
	public List<StudentRequest> getExternalStudentRequest(Long companyId);
	
	
	public StudentRequest approveStudentRequest(Long request_id);
	public StudentRequest getStudentRequest(Long request_id);

	public List<String> getAppliedCompanies(Long student_id);
	public StudentRequest getStudentReqAgainstAdv(Long id, Long avdId);

	public CollegeInternalRequest isStudentApplied(Long companyId ,Long studentId);
	public List<CollegeInternalReqDto> getClgInternalReqOfStudentWithDept(Long student, Long student_id,Long college_id,Date expiration_date,String status);
	//public List<StudentRequest> getAllStudentRequest(Long company_id,Date expiration_date) ;

	public List<Object[]> getAppliedStudentsFromCollege(Long college_id,Long dept_id);
	
	

	public List<Map<String, Object>> getStudentRequests(Long company_id, Date expiration_date) ;

	
	
}
