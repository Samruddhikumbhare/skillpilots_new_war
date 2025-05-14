package com.skillpilots.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.skillpilots.model.CollegeStudyMaterial;

public interface CollegeStudyMaterialRepo extends JpaRepository<CollegeStudyMaterial, Long> {

	List<CollegeStudyMaterial> findByCollegeIdAndDeptIdOrderByStudyMaterialIdDesc(int collegeId,Long deptId);

}
