package com.skillpilots.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.skillpilots.model.CompanyAssignment;

public interface CompanyAssignmentRepo extends JpaRepository<CompanyAssignment, Long> {

	
	 @Query(value = "SELECT cd.company_name, c.name, c.description, c.file_path, c.company_id, c.created_at, c.id " +
             "FROM company_assignment c " +
             "JOIN company_data2 cd ON c.company_id = cd.company_id " +
             "WHERE c.student_id = :studentId", 
     nativeQuery = true)
List<Object[]> getAssignmentDetailsByStudent(@Param("studentId") Long studentId);

	
}
