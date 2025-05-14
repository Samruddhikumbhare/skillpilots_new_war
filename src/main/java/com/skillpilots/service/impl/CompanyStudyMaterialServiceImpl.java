package com.skillpilots.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.skillpilots.model.CompanyStudyMaterial;
import com.skillpilots.repository.CompanyStudyMaterialRepo;
import com.skillpilots.service.CompanyStudyMaterialService;

@Service
class  CompanyStudyMaterialServiceImpl implements CompanyStudyMaterialService 
{
	@Autowired
	private CompanyStudyMaterialRepo companyStudyMaterialRepo;

	@Override
	public CompanyStudyMaterial saveMaterial(CompanyStudyMaterial companyStudyMaterial) {
		return companyStudyMaterialRepo.save(companyStudyMaterial);
	}

	@Override
	public List<CompanyStudyMaterial> getAllStudyMaterial() {
		return companyStudyMaterialRepo.findAll();
	}

	@Override
	public void deleteMaterialById(Long id) {
		companyStudyMaterialRepo.deleteById(id);
		
	}

	@Override
	public List<CompanyStudyMaterial> getMaterialByCompany(Long companyId) {
		return companyStudyMaterialRepo.findByCompanyId(companyId);
	}

	@Override
	public CompanyStudyMaterial findStudyById(Long id) {
		
		return companyStudyMaterialRepo.findById(id).orElseThrow(()-> new RuntimeException("Material Not Found"));
	}
	

}
