package com.skillpilots.service;

import java.util.List;

import com.skillpilots.model.CompanyStudyMaterial;

public interface CompanyStudyMaterialService
{
	public CompanyStudyMaterial saveMaterial(CompanyStudyMaterial companyStudyMaterial);
	/*
	List<CompanyStudyMaterial> getStudyMaterialsByCompanyId(Company companyId);
	
	public List<CompanyStudyMaterial> getStudyMaterialsByEmailId(String emailId);  */
	
	public List<CompanyStudyMaterial> getAllStudyMaterial();
	
	public void deleteMaterialById(Long id);
	
	List<CompanyStudyMaterial> getMaterialByCompany(Long companyId);

	public CompanyStudyMaterial findStudyById(Long id);
}
