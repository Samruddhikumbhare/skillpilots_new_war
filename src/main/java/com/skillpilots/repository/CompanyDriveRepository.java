package com.skillpilots.repository;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.skillpilots.model.CompanyDrive;

public interface CompanyDriveRepository extends JpaRepository<CompanyDrive, Long> {
	
	List<CompanyDrive> findByStatus(String status);
	List<CompanyDrive> findByStatusAndCompanyIdOrderByDriveIdDesc(String status, Long companyId);
	
	
	@Query("SELECT cd FROM CompanyDrive cd WHERE cd.status = :status AND cd.companyId = :companyId ORDER BY cd.creationDate DESC")
	Page<CompanyDrive> findByStatusAndCompanyIdOrderByDrive(@Param("status") String status, @Param("companyId") 
	Long companyId,Pageable pageable);

	

}
