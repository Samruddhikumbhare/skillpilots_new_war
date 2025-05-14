package com.skillpilots.service;

import java.util.List;

import com.skillpilots.model.Department;

public interface DepartmentService {
	public List<Department> getAllDepartment();

		public List<String> getDeptNameList();

		public Department getDepartmentById(Long dept);

	


}
