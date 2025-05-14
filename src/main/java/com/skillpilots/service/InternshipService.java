package com.skillpilots.service;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.data.repository.query.Param;

import com.skillpilots.Dto.InternshipDto;
import com.skillpilots.Dto.InternshipWithStudentDTO;
import com.skillpilots.model.Internships;
import com.skillpilots.model.StudentRequest;

public interface InternshipService {

	

	void saveInternship(Internships internships);

	

	List<Internships> getUserDataListByUserId(Long userId);


	List<Internships> getOngoingInternshipStude(Long userId);
	List<Internships> getCompletedInternshipStude(Long userId);
	List<Internships> getCancelledInternshipStude(Long userId);



	List<Internships> getCurrentInternshipsOfStudent(Long student_id);

    public boolean getInternshipStatusOfStudents(Long studentId) ;


	List<Internships> getUserDataListByCompanyId(Long companyId);
	List<Internships> getUserDataListByCompanyId2(Long companyId);
	List<Internships> getUserDataListByCompanyId3(Long companyId);
	List<Internships> getUserDataListByCompanyId4(Long companyId);

	 public ArrayList<Internships> getPastOrPendingOrCancelledInternshipsOfStudent(Long student_id,String status);

	boolean getInternshipStatusOfStudent(Long studentId);



	List<Internships> getAllUserDataListByCompanyId(Long companyId);

    public boolean isStudentAlreadyApplied(Long studentId, Long companyId) ;


	Internships getInternship(Long internship_id);


    List<Object[]> getInternshipsOfCompany(Long companyId, String status,Long user_id);

    List<Object[]> getInternshipsOfCompanies(Long companyId, String status);

    
    List<Object[]>  getInternshipsOfCollege( Long college_id,  String status);
    
	List<InternshipDto> getCertificate(Long id);



	List<InternshipDto> getAllStudent(Long id);



	List<InternshipDto> getStudCertificate(Long id);



	List<InternshipDto> getCollStudentCertificate(Long college_id);



	List<InternshipDto> getStudentCertificate(Long college_id, Long dept_id);

	List<InternshipWithStudentDTO> findByTeamsAndStatus(String department, String company_name, Long coll_dept,
			String status, String technology, Integer duration, Long college_id);
// api for selected one
//working 	List<InternshipWithStudentDTO> findByTeamsAndStatus2(String department, String status, String technology, Integer  duration, Long college_id);
	
//	List<InternshipWithStudentDTO> findByTeamsAndStatus2(String department,String company_name, Long coll_dept, String status,
//			String technology, Integer duration, Long college_id);


	 public List<InternshipWithStudentDTO> findByTeamsAndStatus2(Long company_id,String department,
			 String company_name ,Long coll_dept, String status, String technology, Integer duration, Long college_id) ;

	List<Internships> getCompanies(Long id);

	List<InternshipWithStudentDTO> findByCollegeId(Long college_id);

	 public List<InternshipWithStudentDTO> findByTeamsAndStatus3(Long college_id,String department,String company_name ,Long coll_dept, String status, String technology, Integer duration, Long collegeId) ;





	List<StudentRequest> getRecordByid(Long id);
	


	

}
