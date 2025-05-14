package com.skillpilots.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.skillpilots.model.Results;

public interface ResultRepository extends JpaRepository<Results, Long> {
	
	public Results findByStudentId(Long studentId);
    Results findByStudentIdAndTestId(Long studentId, Long testId);
   // Optional<Results> findByStudentIdAndTestId(Long studentId, Long testId);
}
