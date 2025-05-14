package com.skillpilots.controller.college;


import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;




@Controller
public class DepartmentController {


	
	@RequestMapping(value="/editDept/{dept_id}",method=RequestMethod.GET)
	public String editDepartment(){
		
		return"college_department";
	}
	
	@RequestMapping("/get_clg_department")
	public String getDepartment(){
		
		return "dept";
	}
	
	@RequestMapping(value="/getDepartmentDetails", method=RequestMethod.GET)
	public String getdetails(){
//		Department department=departmentService.getDepartment(Integer.parseInt(dept_id));
		return "department";
	}
	
	@RequestMapping(value="/getDepartmentsByType")
	public String dept_type(){
//		return departmentService.getAllCollege_Department(dept_type);
		return "deptType";
	}
}
	