package com.skillpilots.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.skillpilots.model.SolvedAssignments;

public interface SolvedAssignmentRepo extends JpaRepository<SolvedAssignments, Long>  {
	

	SolvedAssignments findByStudentId(Long studentId);
}
