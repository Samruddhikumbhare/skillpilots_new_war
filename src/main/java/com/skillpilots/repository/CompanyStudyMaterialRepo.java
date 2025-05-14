package com.skillpilots.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.skillpilots.model.CompanyStudyMaterial;

public interface CompanyStudyMaterialRepo extends JpaRepository<CompanyStudyMaterial, Long> 
{

	List<CompanyStudyMaterial> findByCompanyId(Long companyId);
}
