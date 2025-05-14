package com.skillpilots.service;

import java.util.List;
import java.util.Optional;

import com.skillpilots.Dto.CompManagerDto;
import com.skillpilots.Dto.TeamDto;
import com.skillpilots.model.CompDeptLink;
import com.skillpilots.model.User;

public interface CompDeptService {

	void saveCompDeptLink(CompDeptLink compDeptLink);
	
	List<TeamDto> getAllDept(Long company_id,String status);
    public List<TeamDto> getTeams(Long managerId) ;
    
	public CompDeptLink getCompDeptLink(Long comp_dept_link_id);

	
	public List<CompManagerDto> getAllCompManager(Long companyId,String status);

	CompDeptLink findById(Long id);

	CompDeptLink getCompDeptLink(Long company_id, String for_team);
	
	//CompDeptLink getCompDeptLink(Long company_id, String for_team);

	public CompDeptLink getAllCompManagers(Long company_id, String comp_dept_id);
	
    public List<TeamDto> getManagerAndLead(Long managerId,String teamName) ;


    


}
