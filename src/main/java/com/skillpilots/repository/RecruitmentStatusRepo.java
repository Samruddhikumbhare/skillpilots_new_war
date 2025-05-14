package com.skillpilots.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.skillpilots.Dto.AppliedCompanyDTO;
import com.skillpilots.model.RecruitmentStatus;

public interface RecruitmentStatusRepo extends JpaRepository<RecruitmentStatus, Long> {

	
	
	RecruitmentStatus findByStudentIdAndReqruitmentId(Long studentId,Long reqruitmentId);
    RecruitmentStatus findByStudentIdAndDriveId(Long studentId,Long driveId);
//    @Query("SELECT COALESCE(r.companyName, 'Unknown') AS companyName, " +
//    	       "COALESCE(r.profile, 'Not Available') AS profile, " +
//    	       "COALESCE(r.placementId, 0) AS placementId, " +
//    	       "COALESCE(r.placementDetails.jobDescription, 'No Description') AS jobDescription, " +
//    	       "COALESCE(r.placementDetails.city, 'Unknown') AS city, " +
//    	       "COALESCE(r.ctc, 0) AS ctc, " +
//    	       "COALESCE(s.status, 'Not Applied') AS status " +
//    	       "FROM Recruitment r LEFT JOIN RecruitmentStatus s ON s.reqruitmentId = r.placementId " +
//    	       "WHERE s.studentId = :studentId " +
//    	       "ORDER BY s.statusId DESC")  // Replace `applicationDate` with your actual field for sorting
//    	List<Map<String, Object>> getAppliedStatusForStudent(@Param("studentId") Long studentId);

    @Query("SELECT new com.skillpilots.Dto.AppliedCompanyDTO(c.companyName, c.jobRole, s.applyDate, s.status) " +
    	       "FROM CompanyDrive c LEFT JOIN RecruitmentStatus s ON s.driveId = c.driveId " +
    	       "WHERE s.studentId = :studentId ORDER BY s.driveId DESC")
    	List<AppliedCompanyDTO> getStudentRequestCompany(Long studentId);

    
    @Query("SELECT new com.skillpilots.Dto.AppliedCompanyDTO(c.companyName, c.jobRole, s.applyDate, s.status) " +
 	       "FROM CompanyDrive c LEFT JOIN RecruitmentStatus s ON s.driveId = c.driveId " +
 	       "WHERE s.studentId = :studentId and s.status='Applied' ORDER BY s.driveId DESC")
 	List<AppliedCompanyDTO> getAppliedCount(Long studentId);
    
    @Query("SELECT new com.skillpilots.Dto.AppliedCompanyDTO(c.companyName, c.jobRole, s.applyDate, s.status) " +
  	       "FROM CompanyDrive c LEFT JOIN RecruitmentStatus s ON s.driveId = c.driveId " +
  	       "WHERE s.studentId = :studentId and s.status='SELECTED' ORDER BY s.driveId DESC")
  	List<AppliedCompanyDTO> getSelectedCount(Long studentId);
     
    
    boolean existsByStudentIdAndReqruitmentId(Long studentId, Long reqruitmentId);
    
    
    boolean existsByStudentIdAndDriveId(Long studentId,Long driveId);
    
}
