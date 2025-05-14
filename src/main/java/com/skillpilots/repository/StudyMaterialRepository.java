package com.skillpilots.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.skillpilots.model.TraineeStudentMaterial;

public interface StudyMaterialRepository extends JpaRepository<TraineeStudentMaterial, Long>  {

	
	List<TraineeStudentMaterial> findByCollegeIdAndDeptId(int collegeId,Long deptId);
}
