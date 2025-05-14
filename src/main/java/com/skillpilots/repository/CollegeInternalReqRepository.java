package com.skillpilots.repository;

import java.util.Date;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.skillpilots.model.CollegeInternalRequest;
import com.skillpilots.utility.ProjectConstants;

import jakarta.transaction.Transactional;

public interface CollegeInternalReqRepository extends JpaRepository<CollegeInternalRequest, Long> {
	
	 @Query(value = "SELECT cir.user_id, cir.request_msg, cir.rejection_msg, cir.technology, cir.duration, cir.approval_status, " +
	            "cir.against_ext_req, cir.for_users, cir.advertisement_id, cir.request_id, cir.creation_date, cir.updation_date, " +
	            "cir.expiration_date, company.company_name " +
	            "FROM coll_internal_req cir " +
	            "INNER JOIN company_data2 company ON cir.for_company = company.company_id " +
	            "WHERE cir.user_id = :user_id AND cir.for_dept = :dept_id", nativeQuery = true)
	    List<Object[]> getAllInternalReqByCollge(@Param("user_id") Long userId, @Param("dept_id") Long deptId);
	    
	    
	    @Query(value="select cir.request_msg,cir.request_id,"
					+ "(SELECT company_name FROM company_data2 WHERE company_id=cir.for_company),"
					+ "cir.user_id,cir.creation_date,cir.updation_date,cir.rejection_msg,"
					+ "cir.for_users,cir.approval_status,cir.expiration_date,"
					+ "(SELECT dept_name FROM department_data WHERE dept_id=cir.for_dept)" 
					+ "FROM coll_internal_req cir "
					+ "WHERE cir.user_id=:user_id  "
					+ "AND (approval_status in ('" + ProjectConstants.coll_internal_req_approval_status_approved + "','"
							+ ProjectConstants.coll_internal_req_approval_status_III + "','" 
							+ ProjectConstants.coll_internal_req_approval_status_dept_del + "') OR (approval_status = '"
							+ ProjectConstants.coll_internal_req_approval_status_rejected + "' AND last_status = '"
							+ ProjectConstants.coll_internal_req_approval_status_III + "'))" ,nativeQuery = true)
	    List<Object[]>  getAllInternalRequestsbyCollege(@Param("user_id") Long user_id);
	    
	    @Transactional
	    @Modifying
	    @Query(value="update coll_internal_req cir set cir.request_msg=:request_msg where request_id=:request_id ",nativeQuery = true)
	    void updateRequestMessage(String request_msg, Long request_id);

	    @Query(value="select cm.company_name,cir.user_id,cir.request_msg,cir.rejection_msg,"
				+ "cir.technology,cir.duration,cir.approval_status,cir.against_ext_req,"
				+ "cir.for_users,cir.creation_date,cir.updation_date,cir.expiration_date,"
				+ "cir.request_id,stdt.test_data_id,stdt.expiration_date as expdate,stdt.status as testStatus "
				+ "FROM coll_internal_req cir INNER JOIN company_data2 cm ON cir.for_company=cm.company_id "
				+ "LEFT JOIN student_test_data stdt ON (stdt.against_ext_req=cir.against_ext_req and stdt.student_id=:student_id) "
				+ "WHERE user_id=:user_id AND ((cir.approval_status<>:approval_status AND "
				+ "(cir.expiration_date>=:expiration_date OR cir.expiration_date is null)) OR cir.approval_status=:approval_status) "
				+ "AND cir.for_users =:for_users ", nativeQuery = true)
	public List<Object[]> getClgInternalReqOfStudentWithDept(@Param("for_users")Long student, Long student_id,@Param("user_id")Long college_id,Date expiration_date,@Param("approval_status") String status);


	  @Query("select c FROM CollegeInternalRequest c WHERE c.for_company = :forCompany AND "
	            + ProjectConstants.check_stud_in_coll_int_req)
	    List<CollegeInternalRequest> findCollegeInternalRequests(@Param("forCompany") Long for_company, 
	                                                             @Param("for_users") String forUsers, 
	                                                             @Param("expiration_date") Date expirationDate);



}
