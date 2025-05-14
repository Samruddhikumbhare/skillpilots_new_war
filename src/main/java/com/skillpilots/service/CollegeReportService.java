package com.skillpilots.service;

import java.time.LocalDate;
import java.util.Date;
import java.util.List;

public interface CollegeReportService {

	List<Object[]> getDepartments(Long college_id);
	public List<String> getInternshipTech(Long college_id,int dept_id) ;
	List<String[]> getInternshipInd(Long college_id,int dept_id);
//	 public List<Object[]> getStudentDetails(Long instituteId, int department, String technology, String ind_data,
//             String duration, String status, Date dateStarted, Date dateCompleted);
	

}
