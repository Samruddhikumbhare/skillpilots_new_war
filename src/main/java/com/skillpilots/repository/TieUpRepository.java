package com.skillpilots.repository;

import java.time.LocalDate;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.skillpilots.model.CollCompTieup;

public interface TieUpRepository extends JpaRepository<CollCompTieup, Long> {

	@Query(value = "SELECT * FROM coll_comp_tieup where status='pending' and college_id=:collegeId and requested_by=:requested_by", nativeQuery = true)
	List<CollCompTieup> findAllReceiveComp(@Param("collegeId") Long collegeId,String requested_by);
	
	@Query(value = "SELECT * FROM coll_comp_tieup where status='Accepted'and college_id=:collegeId and requested_by=:requested_by", nativeQuery = true)
	List<CollCompTieup> findTieComp(@Param("collegeId") Long collegeId,String requested_by);
	
	
	
	//college to company tieup
	@Query(value = "SELECT * FROM coll_comp_tieup where status='pending' and  college_id=:collegeId and requested_by=:requested_by", nativeQuery = true)
	List<CollCompTieup> findAllByStatus3(@Param("collegeId") Long collegeId,String requested_by);
	
	@Query(value = "SELECT * FROM coll_comp_tieup where status='Accepted' and company_id=:companyId and requested_by=:requested_by ", nativeQuery = true)
	List<CollCompTieup> findTieCollege(@Param("companyId") Long companyId ,String requested_by);
	
	
		@Modifying
		@Query(value = "UPDATE coll_comp_tieup y SET y.status = ?2, y.updation_date = ?3 WHERE y.tieup_id = ?1", nativeQuery = true)
	    void updateStatusById(Long tieupId, String status, LocalDate date);
		
		@Query(value = "SELECT * FROM coll_comp_tieup where status='pending' and company_id=:companyId and requested_by=:requested_by", nativeQuery = true)
		List<CollCompTieup> getCompanyTieUpList(@Param("companyId") Long companyId,String requested_by);
	
		@Query(value = "SELECT * FROM coll_comp_tieup where status='pending' and company_id=:companyId and requested_by=:requested_by", nativeQuery = true)
		List<CollCompTieup> findAllReceiveColllege(@Param("companyId") Long companyId ,String requested_by );



}
