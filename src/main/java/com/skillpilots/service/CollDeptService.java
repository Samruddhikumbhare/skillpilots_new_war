package com.skillpilots.service;

import java.util.Date;
import java.util.List;

import com.skillpilots.Dto.CollDeptLinkDto;
import com.skillpilots.model.CollDeptLink;

public interface CollDeptService {

	void save(CollDeptLink dept);
	
	CollDeptLink getDepartmentLink(Long userId );
	
	//List<CollDeptLinkDto> getAllColl_Dept_Link(Long college_id,String status);
	
	public List<CollDeptLinkDto> getAllColl_Dept_Link(Long college_id, String status) ;
	
	List<CollDeptLinkDto> getDeptLink(Long id,String status);
	
	CollDeptLink getDeptLinkBYID(Long dept_link_id);
	
	public CollDeptLink getDepartmentByDept_id(Long college_id,Long dept_id,String status,Date expiration_date );
	
	public List<CollDeptLink> getAllDept(Long college_id,Long head_id) ;
	public List<Object[]> getCollDepartment(Long college_id);
	
	public CollDeptLink getHeadId(int college_id, Long dept_id) ;

}
