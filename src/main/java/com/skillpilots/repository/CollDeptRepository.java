package com.skillpilots.repository;

import java.util.Date;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.skillpilots.Dto.CollDeptLinkDto;
import com.skillpilots.model.CollDeptLink;

public interface CollDeptRepository extends JpaRepository<CollDeptLink, Long> {
	
	
	
	@Query(value="select  * From coll_dept_link where (head_id =:userId OR iii_dept_co_id=:userId)",nativeQuery = true)
	CollDeptLink getDepartmentLink(@Param("userId") Long userId );

	@Query(value="select cd.coll_dept_link_id as coll_dept_link_id, cd.dept_id as dept_id, cd.expiration_date as expiration_date,"
			+ "cd.updation_date as updation_date, u1.id as hodid, u1.username as hodname, "
			+ "u2.id as iiiid, u2.username as iiiname, "
			+"cd.balance_data_id as balance_data_id, cd.common_id as common_id, cd.creation_date as creation_date, "
            + "cd.college_id as college_id, cd.effective_date as effective_date, cd.head_id as head_id, "
            + "cd.iii_dept_co_id as iii_dept_co_id, cd.status as status, dept.dept_name as dept_name "
			+ "FROM coll_dept_link cd INNER JOIN department_data dept ON dept.dept_id=cd.dept_id "
			+ "INNER JOIN user u1 ON u1.id=cd.head_id LEFT JOIN user u2 ON u2.id=cd.iii_dept_co_id "
			+ "WHERE cd.college_id=:college_id AND cd.status=:status", nativeQuery = true)
	List<Object[]> getAllCollDeptLink(@Param("college_id") Long college_id, @Param("status") String status);


	@Query(value="select cd.coll_dept_link_id as coll_dept_link_id, cd.dept_id as dept_id, cd.expiration_date as expiration_date,"
		+ "cd.updation_date as updation_date, u1.id as hodid, u1.username as hodname, "
		+ "u2.id as iiiid, u2.username as iiiname, "
		+"cd.balance_data_id as balance_data_id, cd.common_id as common_id, cd.creation_date as creation_date, "
        + "cd.college_id as college_id, cd.effective_date as effective_date, cd.head_id as head_id, "
        + "cd.iii_dept_co_id as iii_dept_co_id, cd.status as status, dept.dept_name as dept_name "
		+ "FROM coll_dept_link cd INNER JOIN department_data dept ON dept.dept_id=cd.dept_id "
		+ "INNER JOIN user u1 ON u1.id=cd.head_id LEFT JOIN user u2 ON u2.id=cd.iii_dept_co_id "
		+ "WHERE cd.head_id=:headId or cd.iii_dept_co_id=:headId AND cd.status=:status", nativeQuery = true)
	List<Object[]> getCollDeptLink(@Param("headId") Long headId, @Param("status") String status);


	
	@Query(value= "select * From coll_dept_link where (college_id=:college_id and dept_id=:dept_id and status=:status)"
			+ " and (expiration_date>=:expiration_date or expiration_date is null)",nativeQuery = true)
	public CollDeptLink getDepartmentByDept_id(Long college_id,Long dept_id,String status,Date expiration_date );
	
	@Query(value="select * From coll_dept_link WHERE college_id=:college_id "
			+ "AND dept_id=:dept_id AND status='A' AND (expiration_date>=:expiration_date OR expiration_date is null)",nativeQuery = true)
	public CollDeptLink getBalanceDataId(Long college_id, Long dept_id,Date expiration_date);
	
	@Query(value=" select * FROM coll_dept_link WHERE college_id=:college_id AND head_id=:head_id",nativeQuery = true)
	public List<CollDeptLink> getAllDept(Long college_id,Long head_id) ;
	
	
	@Query("SELECT distinct dd.deptId,dd.dept_name FROM CollDeptLink cdl,Department dd "
				+ "WHERE cdl.college_id =:college_id and dd.deptId=cdl.deptId")
	public List<Object[]> getDepartments(Long college_id) ;

	@Query("select dept.dept_name "
			+ "from CollDeptLink cd "
			+ "INNER JOIN Department dept ON dept.deptId=cd.deptId "
			+ "where cd.college_id=:college_id "
			+ "AND cd.status=:status AND (cd.expiration_date>=:expiration_date OR cd.expiration_date is null) ORDER BY dept.dept_name ASC")
	public List<Object[]> getCollDepartment(Long college_id,Date expiration_date,String status) ;

    @Query(" select cd FROM CollDeptLink cd WHERE cd.college_id=:college_id AND cd.deptId=:dept_id "
			+ "AND cd.status=:status AND (cd.expiration_date>=:expiration_date OR cd.expiration_date is null)")
	public CollDeptLink getHeadId(int college_id, Long dept_id,String status, Date expiration_date);

	


}
