package com.skillpilots.repository;

import java.util.List;
import java.util.Map;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.skillpilots.model.User;

public interface UserRepository extends JpaRepository<User, Long> {
	Optional<User> findByEmail(String email);
	User findByEmailAndOtp(String email, String otp);
	
	@Query(value = "SELECT * FROM user u WHERE u.role = '3' AND u.type = 0", nativeQuery = true)
	List<User> getUserByManger();
	@Query(value = "SELECT * FROM user u WHERE u.role = '3' AND u.type = 1", nativeQuery = true)
	List<User> getUserByMangerDeleted();
	@Query(value = "SELECT * FROM user u WHERE u.role = '4' AND u.type = 1", nativeQuery = true)
	List<User> getUserByInternshipLeadDeleted();
	@Query(value = "SELECT * FROM user u WHERE u.role = '5' AND u.type = 0", nativeQuery = true)
	List<User> findAllByRole();

	@Query(value = "SELECT * FROM user u WHERE u.role = '2' AND u.type = 0", nativeQuery = true)
	List<User> findAllByRole2();
	@Query(value = "SELECT * FROM user u WHERE u.role = '4' AND u.type = 0", nativeQuery = true)
	List<User> findAllByRole3();
	@Query(value = "SELECT * FROM user u WHERE u.role = '8' AND u.type = 0", nativeQuery = true)
	List<User> findAllByRole4();
	@Query(value = "SELECT * FROM user u WHERE u.role = '6' AND u.type = 0", nativeQuery = true)
	List<User> findAllByRole5();
	
	@Query(value = "SELECT username, id FROM user u WHERE u.role = '0' OR u.role = '10'  AND u.type = 0", nativeQuery = true)
	List<Map<String, Object>> findAllByRole6();
	
	@Query(value = "SELECT * FROM user u WHERE u.role = '7' AND u.type = 0", nativeQuery = true)
	List<User> findAllByRole7();
	boolean existsByEmail(String email);
	User findByCommonId(Long commonId);
	User findByUsername(String username);
	@Query(value = "SELECT * FROM user u WHERE u.role = '7' AND u.type = 0 AND u.common_id = :commaonId", nativeQuery = true)
	List<User> findAllByCommonId(@Param("commaonId") Long commaonId);
	@Query(value = "SELECT * FROM user u WHERE u.role = '8' AND u.type = 0 AND u.common_id = :commaonId", nativeQuery = true)
	List<User> findAllByCommonIddeptLead(Long commaonId);
	@Query(value = "SELECT * FROM user u WHERE u.role = '4' AND u.type = 0 AND u.common_id = :commaonId", nativeQuery = true)
	List<User> findAllByCommonIdinternshiptLead(Long commaonId);
	@Query(value = "SELECT * FROM user u WHERE u.role = '1' AND u.type = 0 AND u.institute_id = :instid", nativeQuery = true)
	User findbyInstituteId(Long instid);
	@Query(value = "SELECT * FROM user u WHERE u.id = :student_id  AND u.hodverified = 0", nativeQuery = true)
	List<User> findById(String student_id);
	
	User findByInstituteId(Long instituteId);
	
	User findByEmailIdCommon(String emailId);
	@Query(value=" select * from user where role=:role and email_id_common=:emailId and department=:department and verified=1",nativeQuery = true)
	User getUserByemailAndRole(String role,@Param("emailId") String emailId,Long department);
	@Query(value="select * from user u where u.email=:email",nativeQuery = true)
	User getUserEmail(String email);
    
	@Query(value=" select * from user where role=:role and email_id_common=:emailId ",nativeQuery = true)
    User findByEmailAndRole(String role,@Param("emailId")String email);
	
	@Query(value=" select * from user where role=:role and email_id_common=:emailId ",nativeQuery = true)
	List<User> findByEmail(String role,@Param("emailId")String email);
	
	@Query(value="select * from user where role=:role and email=:email_id and email_id_common=:email and team_name=:teamName",nativeQuery = true)
    User findByRoleAndEmailIdCommonAndTeamName(@Param("email_id")String email_id,String role,@Param("email") String email, @Param("teamName") String teamName);

	@Query("select id from User where college_id=:college_id and role='0' or role='20'")
	List<Long> getAppliedStudentCollege(@Param("college_id") int college_id );
	
	@Query("Select u from User u where u.id=:id")
	List<User> getUserById(Long id);
	
	@Query(value = "SELECT * FROM user WHERE (role = 7 OR role = 8) AND department = :deptId AND email_id_common = :email_id ", nativeQuery = true)
	List<User> findByEmailIdCommonForNotification(String email_id, Long deptId);
	
	@Query(value = "SELECT * FROM user WHERE role = 2 AND email_id_common = :email ", nativeQuery = true)
	Optional<User> findByEmailAndRole2(String email);
	
	
	@Query(value = "SELECT * FROM user WHERE role = 7 AND  department = :depart AND email_id_common = :clgEmail ", nativeQuery = true)
	User findByEmailAndRoleAndDeprt(String clgEmail,Long depart);
	
	
	@Query(value = "SELECT * FROM user u WHERE u.role = '6' AND u.college_id = :collegeId", nativeQuery = true)
	 List<User>  getTpo(int collegeId);
	
	
	@Query(value = "SELECT username, id FROM user WHERE role = '6'", nativeQuery = true)
	List<Map<String, Object>> getTpo();
	
	@Query(value = "SELECT username, id FROM user WHERE role = '1'", nativeQuery = true)
	List<Map<String, Object>> getCompany();
	
	@Query("select u from User u where u.college_id=:collegeId  "
			+ "and u.department=:deptId and role='0' ")
	List<User>getStudentByDeptAndCollege(Long collegeId, int deptId);
 
}


