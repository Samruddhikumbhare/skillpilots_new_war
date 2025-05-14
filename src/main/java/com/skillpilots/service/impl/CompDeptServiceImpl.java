package com.skillpilots.service.impl;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.skillpilots.Dto.CompManagerDto;
import com.skillpilots.Dto.TeamDto;
import com.skillpilots.model.CompDeptLink;
import com.skillpilots.model.User;
import com.skillpilots.repository.CompDeptRepository;
import com.skillpilots.service.CompDeptService;
import com.skillpilots.utility.ProjectConstants;
@Service
public class CompDeptServiceImpl implements CompDeptService{

	@Autowired
	private CompDeptRepository compDeptRepository;
	
	@Override
	public void saveCompDeptLink(CompDeptLink compDeptLink) {
		// TODO Auto-generated method stub
		compDeptRepository.save(compDeptLink);
	}



	@Override
	public List<TeamDto> getTeams(Long managerId) {
		List<Object[]> teamObjects = compDeptRepository.getTeams(managerId);
        List<TeamDto> teams = new ArrayList<>();

        for (Object[] obj : teamObjects) {
            TeamDto teamDto = new TeamDto();
            teamDto.setCompDeptLinkId((Long) obj[0]);
            teamDto.setDeptName((String) obj[1]);
            teamDto.setManagerId((Long) obj[2]);
            teamDto.setManagerName((String) obj[3]);
            teamDto.setInternshipLeadId((Long) obj[4]);
            teamDto.setLeadName((String) obj[5]);
            teamDto.setTeamName((String) obj[6]);
            teamDto.setCompanyId((Long) obj[7]);
            teamDto.setStatus((String) obj[8]);
            teamDto.setCommonId((Long) obj[9]);
//            teamDto.setCreationDate((LocalDate) obj[10]);
//            teamDto.setEffectiveDate((LocalDate) obj[11]);
//            teamDto.setExpirationDate((LocalDate) obj[12]);
//            teamDto.setUpdationDate((LocalDate) obj[13]);

            teams.add(teamDto);
        }
        return teams;
    }

	@Override
	public CompDeptLink getCompDeptLink(Long comp_dept_link_id) {
		// TODO Auto-generated method stub
		return compDeptRepository.findById(comp_dept_link_id).orElseThrow(()-> new RuntimeException("Compamy dept link"+ comp_dept_link_id));
	}



	@Override
	public List<TeamDto> getAllDept(Long company_id, String status) {
		List<Object[]> teamObjects = compDeptRepository.getAllActiveCompDept(company_id, status);
		  List<TeamDto> teams = new ArrayList<>();
		for (Object[] obj : teamObjects) {
            TeamDto teamDto = new TeamDto();
            teamDto.setCompDeptLinkId((Long) obj[0]);
            teamDto.setDeptName((String) obj[1]);
            teamDto.setManagerId((Long) obj[2]);
            teamDto.setManagerName((String) obj[3]);
            teamDto.setInternshipLeadId((Long) obj[4]);
            teamDto.setLeadName((String) obj[5]);
            teamDto.setTeamName((String) obj[6]);
            teamDto.setCompanyId((Long) obj[7]);
            teamDto.setStatus((String) obj[8]);
            teamDto.setCommonId((Long) obj[9]);
//            teamDto.setCreationDate((LocalDate) obj[10]);
//            teamDto.setEffectiveDate((LocalDate) obj[11]);
//            teamDto.setExpirationDate((LocalDate) obj[12]);
//            teamDto.setUpdationDate((LocalDate) obj[13]);

            teams.add(teamDto);
        }
        return teams;
	}



	@Override
	public List<CompManagerDto> getAllCompManager(Long companyId, String status) {
		List<Object[]> allCompManager = compDeptRepository.getAllCompManager(companyId, status)	;	
		
	 ArrayList<CompManagerDto> arrayList = new ArrayList<>();
	 
	 for(Object[] obj:allCompManager) {
		 
		 CompManagerDto compManagerDto = new CompManagerDto();
		 compManagerDto.setManagerId((Long)obj[0] );
		 compManagerDto.setUsername((String) obj[1]);
		 arrayList.add(compManagerDto);
	 }
	return arrayList;
	 
	}



	@Override
	public CompDeptLink findById(Long id) {
	    // TODO Auto-generated method stub
	    Optional<CompDeptLink> optionalCompDeptLink = compDeptRepository.findById(id);
	    return optionalCompDeptLink.orElseThrow();
	}
	
	@Override
	public CompDeptLink getCompDeptLink(Long company_id, String for_team) {
		// TODO Auto-generated method stub
		return compDeptRepository.getCompDeptLink(company_id, for_team);
	}



	@Override
	public CompDeptLink getAllCompManagers(Long company_id, String comp_dept_id) {
		// TODO Auto-generated method stub
		return compDeptRepository.getAllCompManager(company_id, comp_dept_id, ProjectConstants.coll_dept_link_status_active);
	}



	@Override
	public List<TeamDto> getManagerAndLead(Long managerId, String teamName) {
		List<Object[]> teamObjects = compDeptRepository.getManagerAndLead(managerId, teamName);
        List<TeamDto> teams = new ArrayList<>();

        for (Object[] obj : teamObjects) {
            TeamDto teamDto = new TeamDto();
            teamDto.setCompDeptLinkId((Long) obj[0]);
            teamDto.setDeptName((String) obj[1]);
            teamDto.setManagerId((Long) obj[2]);
            teamDto.setManagerName((String) obj[3]);
            teamDto.setInternshipLeadId((Long) obj[4]);
            teamDto.setLeadName((String) obj[5]);
            teamDto.setTeamName((String) obj[6]);
            teamDto.setCompanyId((Long) obj[7]);
            teamDto.setStatus((String) obj[8]);
            teamDto.setCommonId((Long) obj[9]);
//            teamDto.setCreationDate((LocalDate) obj[10]);
//            teamDto.setEffectiveDate((LocalDate) obj[11]);
//            teamDto.setExpirationDate((LocalDate) obj[12]);
//            teamDto.setUpdationDate((LocalDate) obj[13]);

            teams.add(teamDto);
        }
        return teams;

	}





//	@Override
//	public CompDeptLink getCompDeptLink(Long company_id, String for_team) {
//		// TODO Auto-generated method stub
//		return compDeptRepository.getCompDeptLink(company_id, for_team);
//	}

}
