package com.skillpilots.repository;

import java.util.Date;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.skillpilots.model.StudentRequest;
import com.skillpilots.utility.ProjectConstants;

public interface StudentRequestRepository extends JpaRepository<StudentRequest, Long> {
	@Query(value = "SELECT std_req.student_id, std_req.company_id, std_req.request_msg, "
	        + "std_req.rejection_msg, std_req.technology_name, std_req.duration, std_req.advertisement_id, "
	        + "std_req.request_id, std_req.creation_date, std_req.approval_status, st.student_name, "
	        + "cp.company_name, stdt.test_data_id, stdt.against_ext_req, stdt.expiration_date, stdt.status "
	        + "FROM student_req std_req "
	        + "INNER JOIN student_data st ON st.student_id = std_req.student_id "
	        + "LEFT JOIN company_data2 cp ON cp.company_id = std_req.company_id "
	        + "LEFT JOIN student_test_data stdt ON stdt.against_ext_req = std_req.request_id "
	        + "WHERE std_req.student_id = :studentId "
	        + "ORDER BY std_req.request_id", nativeQuery = true)
	List<Object[]> getAppliedStudentsOfCompany(@Param("studentId") Long studentId);



@Query(value = "SELECT * FROM student_req WHERE student_id = :studentId  ORDER BY creation_date DESC LIMIT 1", nativeQuery = true)
	StudentRequest getApprovelStatusById(@Param("studentId") Long studentId);


@Query(value = "SELECT * FROM student_req WHERE common_id = :commonId  && student_role=0", nativeQuery = true)
List<StudentRequest> findAllByCompanyId(@Param("commonId")Long companyId);


@Query(value = "SELECT * FROM student_req WHERE common_id = :commonId && approval_status = 'pending' ", nativeQuery = true)
StudentRequest findByCommonId(@Param("commonId")Long commonId);


	
 @Query(value = "SELECT * FROM student_req WHERE common_id = :commonId  && student_role=10", nativeQuery = true)
 List<StudentRequest> getExternalStuedentRequest(@Param("commonId")Long companyId);



  @Query(value = "SELECT company_id FROM student_req WHERE student_id = :studentId AND " + ProjectConstants.stud_req_conditions, nativeQuery = true)
  List<String> getAppliedCompanies(@Param("studentId") Long studentId);

  @Query(value="SELECT * FROM student_req WHERE student_id = :id AND (:advertisement_id IS NULL OR advertisement_id = :advertisement_id)", nativeQuery = true)
  public StudentRequest getStudentReqAgainstAdv(Long id, Long advertisement_id);


  @Query(value="SELECT * FROM student_req WHERE student_id = :id and advertisement_id=:avdId", nativeQuery = true)
  public StudentRequest getStudentReqAgainstAdvNotPresent(Long id,Long avdId);
  
  
//   @Query(value="select sr.*,u.username,u.institute_id from student_req sr,user u where "
//		+ "u.id=sr.student_id and sr.company_id=:company_id and "
//		+ "(sr.expiration_date is null OR sr.expiration_date>=:expiration_date) "
//		,nativeQuery = true)
//   public List<StudentRequest> getAllStudentRequest(Long company_id,Date expiration_date) ;
  
  
  @Query(value = """
		    SELECT sr.request_id,
		           sr.approval_status,
		           sr.technology_name,
		           sr.creation_date,
		           sr.last_status,
		           sr.advertisement_id,
		           sr.student_id,
		           sr.company_id,
		           sr.expiration_date,
		           u.username,
		           u.institute_id
		    FROM student_req sr
		    JOIN user u ON u.id = sr.student_id
		    WHERE sr.company_id = :company_id
		      AND (sr.expiration_date IS NULL OR sr.expiration_date >= :expiration_date)
		      AND sr.approval_status <> 'S'  -- Use <> instead of !=
		    ORDER BY sr.creation_date DESC
		    """, nativeQuery = true)
		List<Object[]> getAllStudentRequest(
		    @Param("company_id") Long company_id, 
		    @Param("expiration_date") Date expiration_date
		);


  @Query("SELECT std_req.student_id, std_req.company_id,std_req.request_msg,std_req.rejection_msg,std_req.technology_name,std_req.duration, "
		+ "std_req.advertisement_id, std_req.request_id,std_req.creation_date,std_req.approval_status,st.student_name,cp.company_name,std_req.college_req_msg FROM StudentRequest std_req,Student st,Company cp"
		+ " WHERE st.student_id=std_req.student_id AND cp.company_id = std_req.company_id "
		+ "AND std_req.student_id in (:student_ids) ")
 public List<Object[]> getAppliedStudentsFromCollege(@Param("student_ids") List<Long> studentIds);
 
 
 @Query("SELECT std_req.student_id, std_req.company_id,std_req.request_msg,std_req.rejection_msg,std_req.technology_name,std_req.duration, "
					+ "std_req.advertisement_id, std_req.request_id,std_req.creation_date,std_req.approval_status,st.student_name,cp.company_name,std_req.college_req_msg FROM StudentRequest std_req,Student st,Company cp"
					+ " WHERE st.student_id=std_req.student_id AND st.dept=:dept_id "
					+ "AND cp.company_id = std_req.company_id AND std_req.student_id in (:student_ids) ")
					
 public List<Object[]> getAppliedStudentWithDept(@Param("dept_id") Long dept_id,@Param("student_ids") List<Long> studentIds);
 
 
 @Query("select s FROM StudentRequest s WHERE s.student_id = :student_id AND s.company_id = :companyId AND "
         + ProjectConstants.stud_req_conditions)
 List<StudentRequest> findStudentRequests(@Param("student_id") Long studentId, @Param("companyId") Long companyId
                                          );


@Query("select s FROM StudentRequest s WHERE s.student_id = :id")
List<StudentRequest> findByStudentId(@Param("id") Long id);


}