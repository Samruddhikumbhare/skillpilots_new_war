package com.skillpilots.repository;

import java.time.LocalDate;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.skillpilots.model.Student;

public interface StudentRepository extends JpaRepository<Student, Long> {


	@Query(value="select * from student_data c where c.student_id =:studentId" ,nativeQuery =true)
	Student findBystudent_id(@Param("studentId")Long userId);

	@Query(value="select sd.*,u.hodverified FROM student_data sd JOIN user u ON sd.student_id = u.id WHERE u.hodverified = 0 AND sd.dept =:deptId And u.college_id=:collegeId " ,nativeQuery =true)
	List<Student> findAllByDept(Long deptId,Long collegeId);
	@Query(value="select sd.*,u.hodverified FROM student_data sd JOIN user u ON sd.student_id = u.id WHERE u.hodverified = 1 AND sd.dept =:deptId And u.college_id=:collegeId" ,nativeQuery =true)
	List<Student> findAllByDept2(Long deptId,Long collegeId);

	@Query(value="select sd.*,u.hodverified FROM student_data sd JOIN user u ON sd.student_id = u.id WHERE u.hodverified = 2 AND sd.dept =:deptId And u.college_id=:collegeId" ,nativeQuery =true)
	List<Student> getRejectedStudents(Long deptId,Long collegeId);
	
	@Query(value="select * from student_data where dept=:dept and college_id =:college_id",nativeQuery = true)
	List<Student> getStudentsByDept(Long dept,Long college_id);
	
	@Query(value = "SELECT sd.*, sp.* FROM student_data sd JOIN students_past sp ON sd.student_id = sp.student_id WHERE sd.student_id = :student_id", nativeQuery = true)
    List<Object[]> getStudentDetails(Long student_id);

    @Query("SELECT s FROM Student s WHERE EXTRACT(MONTH FROM s.d_o_b) = ?1 AND EXTRACT(DAY FROM s.d_o_b) = ?2")
    List<Student> findStudentsWithBirthday(int month, int day);

    
    
}
