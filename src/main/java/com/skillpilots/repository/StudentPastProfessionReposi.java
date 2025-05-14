package com.skillpilots.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.skillpilots.model.StudentPast;

public interface StudentPastProfessionReposi extends JpaRepository<StudentPast, Long> {
	
	
	@Query(value="select * from students_past where student_id=:student_id ", nativeQuery = true)
	public StudentPast findByStudentId(Long student_id);

}
