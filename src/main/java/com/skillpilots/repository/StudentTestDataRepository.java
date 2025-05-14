package com.skillpilots.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Service;

import com.skillpilots.model.StudentTestData;

@Service
public interface StudentTestDataRepository extends JpaRepository<StudentTestData, Long>{
	
		@Query(value="SELECT * FROM student_test_data WHERE against_ext_req = :against_request_id AND status = 'pending'", nativeQuery = true)
			List<StudentTestData> getStudPenStatusTestDataByReqId(@Param("against_request_id") Long against_request_id);

	

	    @Query(value = "SELECT td.test_data_id, td.test_id, td.against_ext_req, td.status, " + 
	                   "td.expiration_date, ct.test_name, cp.company_name, cp.company_id, td.student_id  " +
	                   "FROM student_test_data td " +
	                   "INNER JOIN company_test ct ON td.test_id = ct.test_id " +
	                   "LEFT JOIN company_data2 cp ON cp.company_id = ct.company_id " +
	                   "WHERE td.student_id = :studentId", nativeQuery = true)
	    List<Object[]> findTestDataByStudentId(@Param("studentId") Long studentId);
	  
		@Query(value="SELECT * FROM student_test_data WHERE against_ext_req = :against_request_id AND student_id=:student_id", nativeQuery = true)
	  		StudentTestData getStudTestDataAgainstReq(@Param("against_request_id") Long against_request_id, @Param("student_id") Long student_id);

}
