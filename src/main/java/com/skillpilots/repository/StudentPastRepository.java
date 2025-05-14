package com.skillpilots.repository;

import java.util.List;
import java.util.Map;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.skillpilots.model.Internships;
import com.skillpilots.model.StudentPast;

public interface StudentPastRepository extends JpaRepository<StudentPast, Long> {

	@Query("SELECT sp FROM StudentPast sp WHERE sp.student_id = :studentId")
    List<StudentPast> findAllByStudentId(@Param("studentId") Long studentId);
	
	
	@Query("SELECT sp AS studentPast, d.dept_name AS departmentName FROM StudentPast sp JOIN Department d ON d.deptId = sp.department WHERE sp.student_id = :studentId")
	List<Map<String, Object>> getStudentPast(@Param("studentId") Long studentId);
	
	
	




}
