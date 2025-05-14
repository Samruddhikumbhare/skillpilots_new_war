package com.skillpilots.repository;

import java.time.LocalDate;
import java.util.Date;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.skillpilots.model.ExternalRequest;
import com.skillpilots.utility.ProjectConstants;

public interface ExternalRequestRepository extends JpaRepository<ExternalRequest, Long>{
	
	
	@Query(value="select er.request_id,er.for_user_id,er.from_user_id,er.creation_date,er.student_ids,"
			+ "er.approval_status,er.request_msg,er.rejection_msg,er.technology,er.duration,"
			+ "er.advertisement_id,er.expiration_date,er.type,cl.college_id,cl.college_name from "
			+ "external_req er left join college_data4 cl ON cl.college_id=er.from_user_id"
			+ " WHERE er.for_user_id =:for_user_id"
			+ " AND approval_status <> '" + ProjectConstants.external_req_approval_status_cancelled +"' "
			+ " AND (er.expiration_date>=:expiration_date OR er.expiration_date is null)",nativeQuery = true)
	public List<Object[]> getExternal_req(@Param("for_user_id") Long userid ,Date expiration_date);
	
	@Query("select er.request_id,er.for_user_id,er.from_user_id,er.creation_date,er.student_ids,"
	+ "er.approval_status,er.request_msg,er.rejection_msg,er.technology,er.duration,"
	+ "er.advertisement_id,er.expiration_date,cd.company_id,cd.company_name from "
	+ "ExternalRequest er left join Company cd ON cd.company_id=er.company_id where "
	+ "er.from_user_id =:from_user_id "
	+ "AND (er.expiration_date>=:expiration_date OR er.expiration_date is null)")
	public List<Object[]> getExternal_reqs(@Param("from_user_id") Long userid,Date expiration_date);
	
	@Query("select e FROM ExternalRequest e WHERE e.for_user_id = :for_user_id AND "
            + ProjectConstants.check_stud_in_ext_req)
    List<ExternalRequest> findExternalRequests(@Param("for_user_id") String forUserId, 
                                               @Param("student_id") String studentId, 
                                               @Param("expiration_date") Date expirationDate
                                              );
	
	@Query("SELECT e FROM ExternalRequest e WHERE (e.from_user_id = :for_user_id ) " +
		       "AND e.request_id = :request_id AND (e.expiration_date >= :expiration_date OR expiration_date IS NULL)")
		public ExternalRequest getExternalRequest(Long for_user_id, Long request_id, Date expiration_date);


}
