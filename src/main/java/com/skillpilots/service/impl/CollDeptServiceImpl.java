package com.skillpilots.service.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.skillpilots.Dto.CollDeptLinkDto;
import com.skillpilots.model.CollDeptLink;
import com.skillpilots.repository.CollDeptRepository;
import com.skillpilots.service.CollDeptService;
import com.skillpilots.utility.ProjectConstants;
@Service
public class CollDeptServiceImpl implements CollDeptService{
	@Autowired
	private CollDeptRepository collDeptRepository;

	@Override
	public void save(CollDeptLink dept) {
		collDeptRepository.save(dept);
	}

	@Override
	public CollDeptLink getDepartmentLink(Long userId) {
		return collDeptRepository.getDepartmentLink(userId);
	}

	@Override
	public List<CollDeptLinkDto> getAllColl_Dept_Link(Long collegeId, String status) {
	    List<Object[]> results = collDeptRepository.getAllCollDeptLink(collegeId, status);
	    List<CollDeptLinkDto> dtos = new ArrayList<>();

	    for (Object[] row : results) {
	        CollDeptLinkDto dto = new CollDeptLinkDto();
	        dto.setCollDeptLinkId((Long) row[0]);
	        dto.setDeptId((Long) row[1]);
	      //  dto.setExpirationDate((Date) row[2]);
	      //  dto.setUpdationDate((Date) row[3]);
	        dto.setHodId((Long) row[4]);
	        dto.setHodName((String) row[5]);
	        dto.setIiiId((Long) row[6]);
	        dto.setIiiName((String) row[7]);
	        dto.setBalanceDataId((Long) row[8]);
	        dto.setCommonId((Long) row[9]);
	      //  dto.setCreationDate((Date) row[10]);
	        dto.setCollegeId((Long) row[11]);
	       // dto.setEffectiveDate((Date) row[12]);
	        dto.setHeadId((Long) row[13]);
	        dto.setIiiDeptCoId((Long) row[14]);
	        dto.setStatus((String) row[15]);
	        dto.setDeptName((String) row[16]);
	        dtos.add(dto);
	    }

	    return dtos;
	}

	@Override
	public List<CollDeptLinkDto> getDeptLink(Long id, String status) {
		 List<Object[]> results = collDeptRepository.getCollDeptLink(id, status);
		 List<CollDeptLinkDto> dtos = new ArrayList<>();

		    for (Object[] row : results) {
		        CollDeptLinkDto dto = new CollDeptLinkDto();
		        dto.setCollDeptLinkId((Long) row[0]);
		        dto.setDeptId((Long) row[1]);
		      //  dto.setExpirationDate((Date) row[2]);
		      //  dto.setUpdationDate((Date) row[3]);
		        dto.setHodId((Long) row[4]);
		        dto.setHodName((String) row[5]);
		        dto.setIiiId((Long) row[6]);
		        dto.setIiiName((String) row[7]);
		        dto.setBalanceDataId((Long) row[8]);
		        dto.setCommonId((Long) row[9]);
		      //  dto.setCreationDate((Date) row[10]);
		        dto.setCollegeId((Long) row[11]);
		       // dto.setEffectiveDate((Date) row[12]);
		        dto.setHeadId((Long) row[13]);
		        dto.setIiiDeptCoId((Long) row[14]);
		        dto.setStatus((String) row[15]);
		        dto.setDeptName((String) row[16]);
		        dtos.add(dto);
		    }

		    return dtos;
		}

	@Override
	public CollDeptLink getDeptLinkBYID(Long dept_link_id) {
		return collDeptRepository.findById(dept_link_id).orElseThrow(()-> new RuntimeException("Department not found"));
		
	}

	@Override
	public CollDeptLink getDepartmentByDept_id(Long college_id,Long dept_id,String status,Date expiration_date ) {
		return collDeptRepository.getDepartmentByDept_id(college_id,dept_id, status, expiration_date);
	}

	@Override
	public List<CollDeptLink> getAllDept(Long college_id, Long head_id) {
		return collDeptRepository.getAllDept(college_id, head_id);
	}

	@Override
	public List<Object[]> getCollDepartment(Long college_id) {
		// TODO Auto-generated method stub
		return collDeptRepository.getCollDepartment(college_id, new Date(), ProjectConstants.coll_dept_link_status_active);
	}

	@Override
	public CollDeptLink getHeadId(int college_id, Long dept_id) {
		return collDeptRepository.getHeadId(college_id, dept_id, ProjectConstants.coll_dept_link_status_active, new Date());
	}

	

//	@Override
//	public List<CollDeptLinkDto> getAllColl_Dept_Link(Long college_id, String status) {
//		return (List<CollDeptLinkDto>) collDeptRepository.getAllCollDeptLink(college_id, status);
//	}
	
	

}
