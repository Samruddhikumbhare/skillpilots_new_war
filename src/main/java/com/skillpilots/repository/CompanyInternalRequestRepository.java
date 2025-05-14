package com.skillpilots.repository;

import java.util.Date;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.skillpilots.model.CollegeInternalRequest;
import com.skillpilots.model.CompanyInternalRequest;
import com.skillpilots.utility.ProjectConstants;

public interface CompanyInternalRequestRepository extends JpaRepository<CompanyInternalRequest, Long> {
	boolean existsById(Long id);
	@Query(value="SELECT * FROM comp_internal_req where company_id=:companyId",nativeQuery = true)
	List<CompanyInternalRequest> getRequestByUser(@Param("companyId") Long companyId);

	@Query(value="SELECT * FROM coll_internal_req WHERE for_company = :companyId AND for_users =:studentId AND approval_status IN ('6', '7')"
			, nativeQuery = true)
	CollegeInternalRequest isStudentAppliedAlready(@Param("companyId") Long companyId,@Param("studentId") Long studentId);
	
	
	@Query(value = "SELECT cir.request_id, col_data.college_name, cdl.dept_name, cir.request_msg, cir.technology, " +
	        "cir.duration, cir.for_users, cir.approval_status, cir.for_college, cir.against_ext_req, " +
	        "cir.expiration_date, cdl.comp_dept_link_id, u.username AS student_name, " +
	        "cir.user_type " +
	        "FROM comp_internal_req cir " +
	        "LEFT JOIN college_data4 col_data ON cir.for_college = col_data.college_id " +
	        "LEFT JOIN user u ON u.id = cir.for_users " +
	        "LEFT JOIN comp_dept_link cdl ON cir.for_team = cdl.dept_name " +
	        "WHERE cir.user_id = :company_id " +
	        "AND cdl.company_id = :company_id " +
	        "AND cdl.status = :dept_status " +
	        "AND (cdl.expiration_date >= :expiration_date OR cdl.expiration_date IS NULL) " +
	        "AND (cir.expiration_date >= :expiration_date OR cir.expiration_date IS NULL)",
	        nativeQuery = true)
	public List<Object[]> getInternalReqByRole(Long company_id,Date expiration_date,@Param("dept_status") String status);
	

	@Query(value = "SELECT cir.request_id, col_data.college_name, cdl.dept_name, cir.request_msg, cir.technology, " +
	        "cir.duration, cir.for_users, cir.approval_status, cir.for_college, cir.against_ext_req, " +
	        "cir.expiration_date, cdl.comp_dept_link_id , u.username " +
	        "FROM comp_internal_req cir " +
	        "LEFT JOIN college_data4 col_data ON cir.for_college = col_data.college_id " +
	        "JOIN comp_dept_link cdl ON cir.for_team = cdl.dept_name " +
	        "JOIN user u on u.id = cir.for_users " +
	        "WHERE cir.user_id = :company_id " +
	        "AND cdl.company_id = :company_id " +
	        "AND cdl.status = :dept_status " +
	        "AND (cdl.manager_id = :user_id OR cdl.internship_lead_id = :user_id) " +
	        "ORDER BY cir.request_id DESC", nativeQuery = true)
    public List<Object[]> getInternalReqByRoleManager(@Param("company_id") Long companyId, 
                                                       
                                                       @Param("dept_status") String status, 
                                                       @Param("user_id") Long userId);

    @Query(value = """
		    SELECT
		        cir.request_id, col_data.college_name, cdl.dept_name, cir.request_msg,
		        cir.technology, cir.duration, cir.for_users, cir.approval_status,
		        cir.for_college, cir.against_ext_req, cir.expiration_date,
		        cdl.comp_dept_link_id, cir.user_type, u.username
		    FROM
		        comp_internal_req cir
		    LEFT JOIN
		        college_data4 col_data ON cir.for_college = col_data.college_id
		    JOIN
		        comp_dept_link cdl ON cir.for_team = cdl.dept_name
		    JOIN 
    			user u ON u.id=cir.for_users 
		    WHERE
		        cir.user_id = :company_id
		        AND cdl.company_id = :company_id
		        AND cdl.status = :dept_status
		    ORDER BY
		        cir.request_id DESC
		    LIMIT 0, 3
		""", nativeQuery = true)
		List<Object[]> getInternalLastThreeReqByRole(
		    @Param("company_id") Long companyId,
		    @Param("dept_status") String status
		);

    @Query("select c FROM CompanyInternalRequest c WHERE c.for_users LIKE %:forUser% AND c.approval_status IN (:statuses) AND"
    		+ " (c.expiration_date IS NULL OR c.expiration_date >= :currentDate)")
    List<CompanyInternalRequest> findValidRequestsByUser(@Param("forUser") Long student_id, @Param("statuses") List<String> statuses, @Param("currentDate") Date currentDate);
	
    
    @Query(value="select * from comp_internal_req where against_ext_req=:external_req_id",nativeQuery = true)
	CompanyInternalRequest getCompIntReqFromExtReqId(@Param("external_req_id") Long against_request);


}