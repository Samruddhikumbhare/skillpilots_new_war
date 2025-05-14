package com.skillpilots.repository;

import java.util.HashMap;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.skillpilots.model.CompanyTest;
import com.skillpilots.model.SectionQuestion;
import com.skillpilots.model.TestSection;

import jakarta.transaction.Transactional;

public interface CompanyTestRepository extends JpaRepository<CompanyTest, Long> {
	@Query(value=" select * from  company_test where company_id=:companyId ",nativeQuery = true)
	List<CompanyTest> getCompanyTestByCompanyId(@Param("companyId") Long company_id);
	
	
	

	@Query(value = "SELECT t.test_id AS test_id, t.test_name AS test_name, t.test_type AS test_type, t.test_time AS test_time, " +
	        "t.total_marks AS total_marks, t.total_ques AS total_ques,  " +
	        "t.company_id AS company_id, t.status AS status, SUM(s.section_time) AS section_time, " +
	        "SUM(s.cut_off) AS cut_off, t.creation_date AS creation_date, t.expiration_date AS expiration_date, t.institute_id AS institute_id, " +
	        "t.mark_per_ques AS mark_per_ques, " +
	        "t.updation_date AS updation_date " +
	        "FROM company_test t JOIN test_section s " +
	        "ON t.test_id = s.test_id " +
	        "WHERE t.company_id = :companyId AND t.status = :test_status " + // Added space before "GROUP BY"
	        "GROUP BY t.test_id", nativeQuery = true)
	List<CompanyTest> getTestDataByCompanyId(@Param("companyId") Long companyId, @Param("test_status") String status);

	@Transactional
    @Modifying
    @Query("update CompanyTest ct set ct.status = :status where ct.test_id = :testId")
    void updateCompanyTestStatus(@Param("testId") Long testId, @Param("status") String status);

	
}

	
	

