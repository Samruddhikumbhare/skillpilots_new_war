package com.skillpilots.repository;

import java.util.Date;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.skillpilots.model.CompAdvertisement;
import com.skillpilots.model.Company;
import com.skillpilots.utility.ProjectConstants;

public interface ComponyRepository extends JpaRepository<Company, Long> {



	void save(CompAdvertisement company);
	
	@Query(value="select * from company_data2 c where c.email_id =:emailId" ,nativeQuery =true)
	public Company getCompanyDetailsById(@Param("emailId") String emailId);

	   @Query("SELECT c.company_id FROM Company c WHERE c.email_id = :email")
	    Long findByEmailOptimized(@Param("email") String email);
	@Query(value = "SELECT * FROM company_data2  WHERE type = 0", nativeQuery = true)
	List<Company> findAllByType();
	@Query(value = "SELECT * FROM company_data2  WHERE type = 1", nativeQuery = true)
	List<Company> findAllByType1();
	@Query(value = "SELECT * FROM company_data2  WHERE type = 2", nativeQuery = true)
	List<Company> findAllByType2();
	@Query(value = "SELECT * FROM company_data2  WHERE type = 3", nativeQuery = true)
	List<Company> findAllByType3();

	@Query(value="select company_name from company_data2 where company_id=:company_id",nativeQuery = true)
	String getCompanyName(Long company_id);
	@Query("SELECT intr.internship_id, intr.advertisement_id, intr.against_int_req_id, "
	        + "intr.comp_dept_id, intr.creation_date, intr.updation_date, intr.student_id, intr.college_id, "
	        + "intr.coll_dept, intr.company_id, intr.duration, intr.status as sstat, intr.technology, "
	        + "intr.date_started, intr.date_completed, cmdl.dept_name, std.student_id as stud_id, "
	        + "std.student_name, clg.college_id as clg_id, clg.college_name FROM Internships intr "
	        + "LEFT JOIN College clg ON intr.college_id = clg.college_id "
	        + "LEFT JOIN CompDeptLink cmdl ON cmdl.company_id = intr.company_id AND cmdl.dept_name = intr.comp_dept_id "
	        + "LEFT JOIN Student std ON intr.student_id = std.student_id "
	        + "WHERE cmdl.dept_name = :department "
	        + "AND intr.technology = :technology "
	        + "AND intr.status = :status "
	        + "AND intr.college_id = :institute "
	        + "AND intr.duration = :duration "
	        + "AND ("
	        + "(:dateType = 'started_bet' AND intr.date_started >= :fromDate AND intr.date_started <= :toDate) OR "
	        + "(:dateType = 'ended_bet' AND intr.date_completed >= :fromDate AND intr.date_completed <= :toDate) OR "
	        + "(:dateType = 'complete_bet' AND intr.date_started >= :fromDate AND intr.date_completed <= :toDate)"
	        + ") "
	        + "AND cmdl.status IN ('A', 'C')")
	List<Object[]> getCompanyReport(@Param("department") String department,
	                                @Param("technology") String technology,
	                                @Param("status") String status,
	                                @Param("institute") Long institute,
	                                @Param("duration") String duration,
	                                @Param("dateType") String dateType,
	                                @Param("fromDate") Date from_date,
	                                @Param("toDate") Date to_date);


    
    @Query("SELECT DISTINCT(dept_name) FROM CompDeptLink WHERE company_id =:company_id")
	public List<String> getDepartments(Long company_id) ;
  
    @Query("SELECT DISTINCT(college_name),i.college_id FROM Internships i JOIN College c "
			+ "ON i.college_id=c.college_id WHERE i.company_id =:company_id")
	public List<String[]> getInternshipInst(@Param("company_id") Long industry_id) ;

    @Query("SELECT DISTINCT(technology) FROM Internships WHERE company_id =:company_id")
    public List<String> getInternshipTech(@Param("company_id") Long industry_id) ;
		

}




