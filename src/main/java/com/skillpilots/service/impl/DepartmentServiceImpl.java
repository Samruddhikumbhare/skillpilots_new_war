package com.skillpilots.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.skillpilots.model.Department;
import com.skillpilots.repository.DepartmentRepository;
import com.skillpilots.service.DepartmentService;
@Service
public class DepartmentServiceImpl  implements DepartmentService
{
	@Autowired
	private DepartmentRepository  departmentRepository;
	@Override
	public List<Department> getAllDepartment() {
		return departmentRepository.findAll();
	}
	@Override
	public List<String> getDeptNameList() {
		return departmentRepository.getDeptNameList();
	}
	@Override
	public Department getDepartmentById(Long dept) {
		return departmentRepository.findById(dept).orElseThrow(()-> new RuntimeException("Department Not Found"+ dept));
	}

}
