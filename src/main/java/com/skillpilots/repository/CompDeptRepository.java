package com.skillpilots.repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.web.bind.annotation.RequestParam;

import com.skillpilots.model.CompDeptLink;
import com.skillpilots.utility.ProjectConstants;

public interface CompDeptRepository extends JpaRepository<CompDeptLink, Long> {
	
	@Query(value = "SELECT cdl.comp_dept_link_id AS comp_dept_link_id, " +
            "cdl.dept_name AS dept_name, " +
            "cdl.manager_id AS manager_id, " +
            "(SELECT username FROM user WHERE id = cdl.manager_id ) AS manager_name, " +
            "cdl.internship_lead_id AS internship_lead_id, " +
            "(SELECT username FROM user WHERE id = cdl.internship_lead_id) AS lead_name, " +
            "(SELECT team_name FROM user WHERE id = cdl.manager_id) AS team_name, " +
            "cdl.company_id AS company_id, " +
            "cdl.status AS status, " +
            "cdl.common_id AS common_id, " +
            "cdl.creation_date AS creation_date, " +
            "cdl.effective_date AS effective_date, " +
            "cdl.expiration_date AS expiration_date, " +
            "cdl.updation_date AS updation_date " +
            "FROM comp_dept_link cdl " +
            "WHERE cdl.company_id = :company_id and status=:status", nativeQuery = true)
    List<Object[]> getAllActiveCompDept(@Param("company_id") Long company_id,String status);


	@Query(value = "SELECT cdl.comp_dept_link_id AS comp_dept_link_id, " +
            "cdl.dept_name AS dept_name, " +
            "cdl.manager_id AS manager_id, " +
            "(SELECT username FROM user WHERE id = cdl.manager_id) AS manager_name, " +
            "cdl.internship_lead_id AS internship_lead_id, " +
            "(SELECT username FROM user WHERE id = cdl.internship_lead_id) AS lead_name, " +
            "(SELECT team_name FROM user WHERE id = cdl.manager_id) AS team_name, " +
            "cdl.company_id AS company_id, " +
            "cdl.status AS status, " +
            "cdl.common_id AS common_id, " +
            "cdl.creation_date AS creation_date, " +
            "cdl.effective_date AS effective_date, " +
            "cdl.expiration_date AS expiration_date, " +
            "cdl.updation_date AS updation_date " +
            "FROM comp_dept_link cdl " +
            "WHERE cdl.manager_id = :manager_id or cdl.internship_lead_id=:manager_id", nativeQuery = true)
	List<Object[]> getTeams(@Param("manager_id") Long manager_id);
	@Query(value = "SELECT cdl.comp_dept_link_id AS comp_dept_link_id, " +
            "cdl.dept_name AS dept_name, " +
            "cdl.manager_id AS manager_id, " +
            "(SELECT username FROM user WHERE id = cdl.manager_id) AS manager_name, " +
            "cdl.internship_lead_id AS internship_lead_id, " +
            "(SELECT username FROM user WHERE id = cdl.internship_lead_id) AS lead_name, " +
            "(SELECT team_name FROM user WHERE id = cdl.manager_id) AS team_name, " +
            "cdl.company_id AS company_id, " +
            "cdl.status AS status, " +
            "cdl.common_id AS common_id, " +
            "cdl.creation_date AS creation_date, " +
            "cdl.effective_date AS effective_date, " +
            "cdl.expiration_date AS expiration_date, " +
            "cdl.updation_date AS updation_date " +
            "FROM comp_dept_link cdl " +
            "WHERE (cdl.manager_id = :manager_id OR cdl.internship_lead_id = :manager_id) " +
            "AND (SELECT team_name FROM user WHERE id = cdl.manager_id) = :team_name", nativeQuery = true)
List<Object[]> getManagerAndLead(@Param("manager_id") Long managerId, @Param("team_name") String teamName);

	@Query(value="SELECT DISTINCT cd.manager_id, u.username " +
            "FROM user u " +
            "INNER JOIN comp_dept_link cd ON u.id = cd.manager_id " +
            "WHERE cd.company_id = :company_id AND cd.status = :status", nativeQuery = true)
List<Object[]> getAllCompManager(@Param("company_id") Long companyId, @Param("status") String status);

@Query("SELECT cdl FROM CompDeptLink cdl WHERE cdl.company_id = :company_id AND cdl.status = '"
	      + ProjectConstants.comp_dept_link_status_active + "' AND cdl.dept_name = :dept_name")
	CompDeptLink getCompDeptLink(@Param("company_id") Long company_id, @Param("dept_name") String dept_name);
/*
 * @Query("select * FROM comp_dept_link WHERE company_id=:company_id AND status='"
 * +ProjectConstants.comp_dept_link_status_active+"'" +
 * " AND dept_name=:dept_name") CompDeptLink getCompDeptLink(Long
 * company_id,@Param("dept_name") String for_team);
 */

@Query(value = "SELECT " +
        "cdl.comp_dept_link_id AS compDeptLinkId, " +
        "cdl.dept_name AS deptName, " +
        "cdl.manager_id AS managerId, " +
        "u.username AS managerName, " +
        "cdl.internship_lead_id AS internshipLeadId " +
        "FROM comp_dept_link cdl " +
        "LEFT JOIN user u ON cdl.manager_id = u.id " +
        "WHERE cdl.internship_lead_id = :leadId " +  // Space added before AND
        "AND cdl.company_id = :companyId", nativeQuery = true)
List<Map<String, Object>> getManagerforLead(@Param("leadId") Long leadId, @Param("companyId") Long companyId);

@Query(value = "SELECT " +
        "cdl.comp_dept_link_id AS compDeptLinkId, " +
        "cdl.dept_name AS deptName, " +
        "cdl.manager_id AS leadId, " +
        "u.username AS leadName, " +
        "cdl.internship_lead_id AS internshipLeadId " +
        "FROM comp_dept_link cdl " +
        "LEFT JOIN user u ON cdl.internship_lead_id = u.id " +
        "WHERE cdl.manager_id = :managerId " +  // Space added before AND
        "AND cdl.company_id = :companyId", nativeQuery = true)
List<Map<String, Object>> getLeadforManager(Long managerId,Long companyId);

@Query("select cp FROM CompDeptLink cp  WHERE cp.company_id=:company_id AND cp.dept_name=:dept_name AND cp.status=:status")
public CompDeptLink getAllCompManager(Long company_id, String dept_name,String status);

}
