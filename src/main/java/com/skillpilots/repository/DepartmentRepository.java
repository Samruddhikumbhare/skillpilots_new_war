package com.skillpilots.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.skillpilots.model.Department;

public interface DepartmentRepository extends JpaRepository<Department, Long>{
	
	@Query(value="select dept_name from department_data",nativeQuery = true)
	public List<String> getDeptNameList();

	@Query(value = "select d.dept_id,d.dept_name from department_data d left join coll_dept_link cd" +
			" on d.dept_id=cd.dept_id where cd.college_id=:collegeId and cd.status='A'",nativeQuery = true)
	List<Object[]> getDept(Long collegeId);
	
}
