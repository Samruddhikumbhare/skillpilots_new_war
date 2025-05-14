package com.skillpilots.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.skillpilots.model.AssessmentTest;

public interface AsssesmentRepository extends JpaRepository<AssessmentTest, Long> {

}
