package com.skillpilots.repository;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.skillpilots.model.Internships;
import com.skillpilots.model.StudentRequest;

public interface InternshipRepository extends JpaRepository<Internships, Long> {
	@Query(value = "SELECT * FROM internships2  WHERE student_id = :studentId AND status = 'pending' AND type=0", nativeQuery = true)
	List<Internships> findAllByStudentId(@Param("studentId") Long userId);

	@Query(value = "SELECT * FROM internships2  WHERE student_id = :studentId AND status = 'ongoing' AND type=1", nativeQuery = true)
	List<Internships> findOngoingStudentInter(@Param("studentId") Long studentId);

	// completed internships type=2
	@Query(value = "SELECT * FROM internships2  WHERE student_id = :studentId AND status = 'Completed' ", nativeQuery = true)
	List<Internships> findCompletedStudentIntern(@Param("studentId") Long studentId);

	// canceled internships type=3
	@Query(value = "SELECT * FROM internships2  WHERE student_id = :studentId AND status = 'cancelled' AND type=3", nativeQuery = true)
	List<Internships> findCancelledStudentIntern(@Param("studentId") Long studentId);

	@Query(" select i FROM Internships i WHERE i.student_id = :studentId AND i.status IN (:statuses)")
	List<Internships> findOngoingOrPendingInternshipsByStudentId(@Param("studentId") Long studentId,
			@Param("statuses") List<String> statuses);

	@Query("SELECT i FROM Internships i WHERE i.commonId = :commonId AND i.type=0")
	List<Internships> findAllByCompanyId(Long commonId);

	@Query("SELECT i FROM Internships i WHERE i.commonId = :commonId AND i.type=1")
	List<Internships> findAllByCompanyId2(Long commonId);

	@Query("SELECT i FROM Internships i WHERE i.commonId = :commonId AND i.type=2")
	List<Internships> findAllByCompanyId3(Long commonId);

	@Query("SELECT i FROM Internships i WHERE i.commonId = :commonId AND i.type=3")
	List<Internships> findAllByCompanyId4(Long commonId);

	@Query("select i from Internships i where i.student_id=:student_id")
	public List<Internships> getCompanies(Long student_id);

	@Query("select i from Internships i where i.college_id=:collegeId")
	List<Internships> getCompanyId(Long collegeId);

	@Query(value = "SELECT COUNT(*) FROM internships2 WHERE student_id = :studentId AND status IN (:statuses)", nativeQuery = true)
	Long countByStudentIdAndStatusInNative(Long studentId, List<String> statuses);

	@Query(value = "select count(*) from internships2 where college_id=:college_id and company_id=:company_id and status='Completed'", nativeQuery = true)
	public Long getNoOfCompletedInternships(Long college_id, Long company_id);

	@Query(value = "SELECT inter.student_id, inter.college_id, inter.coll_dept, inter.duration, inter.date_started, "
			+ "inter.status, inter.internship_id, inter.technology, st.student_name, cl.college_name, "
			+ "dept.dept_name, inter.updation_date, inter.date_completed, cdl.dept_name as assigned_team, inter.reason "
			+ "FROM internships2 inter " + "INNER JOIN student_data st ON st.student_id = inter.student_id "
			+ "LEFT JOIN college_data4 cl ON cl.college_id = inter.college_id "
			+ "LEFT JOIN department_data dept ON dept.dept_id = inter.coll_dept "
			+ "LEFT JOIN comp_dept_link cdl ON inter.comp_dept_id = cdl.dept_name "
			+ "AND inter.company_id = cdl.company_id "
			+ "WHERE inter.company_id = :companyId AND inter.status = :status and cdl.manager_id=:user_id or cdl.internship_lead_id=:user_id", nativeQuery = true)
	List<Object[]> getInternshipsOfCompany(@Param("companyId") Long companyId, @Param("status") String status,
			Long user_id);

	@Query(value = "SELECT inter.student_id, inter.college_id, inter.coll_dept, inter.duration, inter.date_started, "
			+ "inter.status, inter.internship_id, inter.technology, st.student_name, cl.college_name, "
			+ "dept.dept_name, inter.updation_date, inter.date_completed, cdl.dept_name as assigned_team, inter.reason "
			+ "FROM internships2 inter " + "INNER JOIN student_data st ON st.student_id = inter.student_id "
			+ "LEFT JOIN college_data4 cl ON cl.college_id = inter.college_id "
			+ "LEFT JOIN department_data dept ON dept.dept_id = inter.coll_dept "
			+ "LEFT JOIN comp_dept_link cdl ON inter.comp_dept_id = cdl.dept_name "
			+ "AND inter.company_id = cdl.company_id "
			+ "WHERE inter.company_id = :companyId AND inter.status = :status ", nativeQuery = true)
	List<Object[]> getInternshipsOfCompanies(@Param("companyId") Long companyId, @Param("status") String status);

	@Query("SELECT inter.student_id, inter.college_id,inter.coll_dept,inter.company_id,inter.comp_dept_id,inter.duration,"
			+ "inter.internship_id, inter.technology,inter.date_started,inter.date_completed,inter.updation_date,"
			+ "inter.advertisement_id,st.student_name,cp.company_name,inter.reason "
			+ "FROM Internships inter,Student st,Company cp, CollDeptLink cdl "
			+ "WHERE st.student_id = inter.student_id AND cp.company_id = inter.company_id AND inter.coll_dept = cdl.deptId "
			+ "AND inter.college_id=:college_id AND inter.status=:status "
			+ "AND inter.college_id=cdl.college_id AND cdl.status='A' ")
	List<Object[]> getInternshipsOfCollege(@Param("college_id") Long college_id, @Param("status") String status);

	@Query(value = "SELECT inter.* FROM internships2 inter,company_data2 "
			+ "cp WHERE cp.company_id=inter.company_id AND inter.student_id=:student_id AND inter.status='ongoing'", nativeQuery = true)
	List<Internships> getCurrentInternshipsOfStudent(Long student_id);

	@Query(value = "SELECT inter.* FROM internships2 inter,company_data2 "
			+ "cp WHERE cp.company_id=inter.company_id AND inter.student_id=:student_id AND inter.status=:status", nativeQuery = true)
	public ArrayList<Internships> getPastOrPendingOrCancelledInternshipsOfStudent(Long student_id, String status);

	@Query(value = "SELECT ir.student_id AS studentId, ir.company_id AS companyId, ir.college_id AS collegeId, "
			+ "cd.company_name AS companyName, ir.technology, sdr.student_name AS studentName, "
			+ "ir.duration, ir.date_started AS dateStarted, ir.date_completed AS dateCompleted, "
			+ "ir.download_url AS downloadUrl, " + "ir.internship_id AS internshipId " + "FROM internships2 ir "
			+ "JOIN student_data sdr ON ir.student_id = sdr.student_id "
			+ "JOIN company_data2 cd ON ir.company_id = cd.company_id "
			+ "WHERE ir.student_id = :studentId AND ir.date_completed IS NOT NULL", nativeQuery = true)
	List<Object[]> getCertificate(@Param("studentId") Long studentId);

	@Query(value = "Select r.id,r.username from user r JOIN internships2 i on r.id=i.student_id "
			+ "WHERE company_id=:companyId",nativeQuery = true)
	List<Object[]> getAllInterns(Long companyId);

	@Query(value = "SELECT inter.student_id, inter.college_id,cd.company_name, inter.coll_dept, inter.duration, inter.date_started, "
			+ "inter.status, inter.internship_id, inter.technology, sdr.student_name, inter.date_completed, inter.company_id "
			+ "FROM internships2 inter " + "JOIN student_data sdr ON inter.student_id = sdr.student_id "
			+ "JOIN company_data2 cd ON inter.company_id = cd.company_id "
			+ "WHERE inter.company_id = :user_id AND inter.date_completed IS NOT NULL", nativeQuery = true)
	List<Object[]> getAllStudent(@Param("user_id") Long id);

	@Query(value = "SELECT inter.student_id, inter.college_id, inter.coll_dept, inter.duration, inter.date_started, "
			+ "inter.status, inter.internship_id, inter.technology, sdr.student_name,  "
			+ " inter.updation_date, inter.date_completed,  inter.reason , cd.company_name , inter.company_id "
			+ "FROM internships2 inter "
			+ "JOIN student_data sdr ON inter.student_id=sdr.student_id JOIN company_data2 cd ON inter.company_id=cd.company_id WHERE inter.college_id=:college_id "
			+ "AND inter.date_completed is not null ", nativeQuery = true)
	public List<Object[]> getStudCertificate(@Param("college_id") Long id);

	@Query(value = "SELECT inter.student_id, inter.college_id, inter.coll_dept, inter.duration, inter.date_started, "
			+ "inter.status, inter.internship_id, inter.technology, sdr.student_name,  "
			+ "inter.updation_date, inter.date_completed, inter.reason , cd.company_name , inter.company_id  "
			+ "FROM internships2 inter "
			+ "JOIN student_data sdr ON inter.student_id=sdr.student_id JOIN company_data2 cd ON inter.company_id=cd.company_id "
			+ "WHERE inter.college_id=:college_id AND inter.date_completed is not null", nativeQuery = true)
	List<Object[]> getCollStudentCertificate(Long college_id);

	@Query(value = "Select distinct(ir.student_id),ir.company_id,ir.college_id,ir.technology,"
			+ "sdr.student_name,ir.duration,ir.date_started,ir.date_completed,cd.company_name FROM internships2 ir "
			+ "JOIN student_data sdr ON ir.student_id=sdr.student_id JOIN coll_dept_link cdl ON cdl.dept_id=ir.coll_dept JOIN company_data2 cd ON ir.company_id=cd.company_id"
			+ " WHERE ir.coll_dept=:coll_dept AND ir.college_id=:college_id AND ir.date_completed is not null", nativeQuery = true)
	List<Object[]> getStudentCertificate(Long college_id, @Param("coll_dept") Long dept_id);

	@Query("SELECT DISTINCT(technology) FROM Internships WHERE college_id = :college_id AND (:dept_id <= 0 OR coll_dept = :dept_id)")
	public List<String> getInternshipTech(Long college_id, int dept_id);

	@Query("SELECT DISTINCT(company_name),internships.company_id FROM Internships internships JOIN Company company_data "
			+ "ON internships.company_id=company_data.company_id WHERE internships.college_id =:college_id  AND (:dept_id <= 0 OR internships.coll_dept = :dept_id)")
	List<String[]> getInternshipInd(Long college_id, int dept_id);

//	@Query("SELECT i, s.student_name, c.college_name,d.dept_name FROM Internships i "
//			+ "JOIN Student s ON i.student_id = s.student_id " + "JOIN College c ON i.college_id = c.college_id "
//			+ "JOIN Department d ON i.coll_dept = d.deptId " + "WHERE (:team IS NULL OR i.comp_dept_id = :team) AND "
//			+ "(:companyName IS NULL OR i.companyName = :companyName) AND "
//			+ "(:coll_dept IS NULL OR i.coll_dept = :coll_dept) AND " + "(:status IS NULL OR i.status = :status) AND "
//			+ "(:technology IS NULL OR i.technology = :technology) AND "
//			+ "(:duration IS NULL OR i.duration = :duration) AND "
//			+ "(:college_id IS NULL OR i.college_id = :college_id)")
//	List<Object[]> findByCompDeptId(@Param("team") String team, @Param("companyName") String company_name,
//			Long coll_dept, @Param("status") String status, @Param("technology") String technology,
//			@Param("duration") Integer duration, @Param("college_id") Long college_id);
	@Query("SELECT i, s.student_name, c.college_name, d.dept_name FROM Internships i "
	        + "JOIN Student s ON i.student_id = s.student_id "
	        + "JOIN College c ON i.college_id = c.college_id "
	        + "JOIN Department d ON i.coll_dept = d.deptId "
	        + "WHERE (:team IS NULL OR i.comp_dept_id = :team) AND "
	        + "(:companyName IS NULL OR :companyName = '' OR i.companyName = :companyName) AND "
	        + "(:coll_dept IS NULL OR i.coll_dept = :coll_dept) AND "
	        + "(:status IS NULL OR :status = '' OR i.status = :status) AND "
	        + "(:technology IS NULL OR :technology = '' OR i.technology = :technology) AND "
	        + "(:duration IS NULL OR i.duration = :duration) AND "
	        + "(:college_id IS NULL OR i.college_id = :college_id)")
	List<Object[]> findByCompDeptId(
	        @Param("team") String team,
	        @Param("companyName") String companyName,
	        @Param("coll_dept") Long coll_dept,
	        @Param("status") String status,
	        @Param("technology") String technology,
	        @Param("duration") Integer duration,
	        @Param("college_id") Long college_id);

	@Query("SELECT college_name FROM College WHERE college_id = :college_id")
	String findCollegeNameById(@Param("college_id") Long college_id);

	// ------------------------------------------for single
	// find-------------------------------------------------------------------------------------------------------------------
//	@Query("SELECT i, s.student_name, c.college_name, d.dept_name " + "FROM Internships i "
//			+ "JOIN Student s ON i.student_id = s.student_id " + "JOIN College c ON i.college_id = c.college_id "
//			+ "JOIN Department d ON i.coll_dept = d.deptId " + "WHERE (:team IS NOT NULL AND i.comp_dept_id = :team) "
//			+ "OR (:coll_dept IS NOT NULL AND i.coll_dept = :coll_dept) "
//			+ "OR (:company_name IS NOT NULL AND i.companyName = :company_name) "
//			+ "OR (:status IS NOT NULL AND i.status = :status) "
//			+ "OR (:technology IS NOT NULL AND i.technology = :technology) "
//			+ "OR (:duration IS NOT NULL AND i.duration = :duration) "
//			+ "OR (:college_id IS NOT NULL AND i.college_id = :college_id)")
//	List<Object[]> findByCompDeptId2(@Param("team") String team,
//
//			@Param("company_name") String company_name, @Param("coll_dept") Long coll_dept,
//			@Param("status") String status, @Param("technology") String technology, @Param("duration") Integer duration,
//			@Param("college_id") Long college_id);
//	
	
	@Query("SELECT i, s.student_name, c.college_name, d.dept_name " +
		       "FROM Internships i " +
		       "JOIN Student s ON i.student_id = s.student_id " +
		       "JOIN College c ON i.college_id = c.college_id " +
		       "JOIN Department d ON i.coll_dept = d.deptId " +
		       "WHERE i.company_id = :company_id " + // Mandatory condition
		       "AND (" +
		       "(:team IS NOT NULL AND i.comp_dept_id = :team) " +
		       "OR (:coll_dept IS NOT NULL AND i.coll_dept = :coll_dept) " +
		       "OR (:company_name IS NOT NULL AND i.companyName = :company_name) " +
		       "OR (:status IS NOT NULL AND i.status = :status) " +
		       "OR (:technology IS NOT NULL AND i.technology = :technology) " +
		       "OR (:duration IS NOT NULL AND i.duration = :duration) " +
		       "OR (:college_id IS NOT NULL AND i.college_id = :college_id))")
		List<Object[]> findByCompDeptId2(
		        @Param("company_id") Long company_id, // Mandatory parameter
		        @Param("team") String team,
		        @Param("company_name") String company_name,
		        @Param("coll_dept") Long coll_dept,
		        @Param("status") String status,
		        @Param("technology") String technology,
		        @Param("duration") Integer duration,
		        @Param("college_id") Long college_id);
		
		
		@Query("SELECT i, s.student_name, c.college_name, d.dept_name " +
			       "FROM Internships i " +
			       "JOIN Student s ON i.student_id = s.student_id " +
			       "JOIN College c ON i.college_id = c.college_id " +
			       "JOIN Department d ON i.coll_dept = d.deptId " +
			       "WHERE i.college_id = :collegeId " + // Mandatory condition
			       "AND (" +
			       "(:team IS NOT NULL AND i.comp_dept_id = :team) " +
			       "OR (:coll_dept IS NOT NULL AND i.coll_dept = :coll_dept) " +
			       "OR (:company_name IS NOT NULL AND i.companyName = :company_name) " +
			       "OR (:status IS NOT NULL AND i.status = :status) " +
			       "OR (:technology IS NOT NULL AND i.technology = :technology) " +
			       "OR (:duration IS NOT NULL AND i.duration = :duration))")
			List<Object[]> findByCompDeptId3(
			       @Param("collegeId") Long collegeId, // Mandatory parameter
			       @Param("team") String team,
			       @Param("company_name") String company_name,
			       @Param("coll_dept") Long coll_dept,
			       @Param("status") String status,
			       @Param("technology") String technology,
			       @Param("duration") Integer duration);


	@Query(value = "SELECT inter.* FROM internships2 inter,company_data2 "
			+ "cp WHERE inter.internship_id=:internshipId ", nativeQuery = true)
	Internships getDownoadurl(Long internshipId);
	
	@Query("SELECT i, s.student_name, c.college_name, d.dept_name " + "FROM Internships i "
			+ "JOIN Student s ON i.student_id = s.student_id " + "JOIN College c ON i.college_id = c.college_id "
			+ "JOIN Department d ON i.coll_dept = d.deptId " + "WHERE (:college_id IS NOT NULL AND i.college_id = :college_id)")
	List<Object[]> findByCompDeptId22(@Param("college_id") Long college_id);

}
