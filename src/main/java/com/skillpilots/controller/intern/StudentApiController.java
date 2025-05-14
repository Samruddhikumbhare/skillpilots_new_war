package com.skillpilots.controller.intern;

import java.util.Arrays;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.skillpilots.model.Department;
import com.skillpilots.model.Student;
import com.skillpilots.model.StudentPast;
import com.skillpilots.service.StudentService;

@Controller
public class StudentApiController {
	
	@Autowired
	private StudentService studentService;
	
	
	
	@RequestMapping(value = "/getStudentData", method = RequestMethod.GET)
	public @ResponseBody HashMap<String,Object> getStudentData(@RequestParam Long student_id) {
		System.out.println("Student Id:-" + student_id);
		Student student = studentService.getSpecificStudent(student_id);
		List<StudentPast> educationalDetails=studentService.getStudentPastEducation(student_id);
//		//replace dept_id with name
//		List<Department> departments = departmentService.getAllDeprtment();
//		HashMap<String,String> dept = new HashMap<>();
//		departments.forEach(d -> dept.put(""+d.getDept_id(), d.getDept_name()));
//		dept.put("ARTS","Arts");
//		dept.put("SCIENCE","Science");
//		dept.put("COMMERCE","Commerce");
//		educationalDetails.forEach(past -> {if(dept.containsKey(past.getDepartment())) past.setDepartment(dept.get(past.getDepartment()));});
//		//sort qualification order
//		List<String> orderList=Arrays.asList(ProjectConstants.qualificationOrder);
//		Collections.sort(educationalDetails,(s1,s2)->Integer.valueOf(orderList.indexOf(s1.getCategory())).compareTo(Integer.valueOf(orderList.indexOf(s2.getCategory()))));
//		List<StudentPast> studPastProfessions=studentService.getStudentsPastProfessions(student_id);
		HashMap<String, Object> dataMap=new HashMap<>();
		dataMap.put("student", student);
		dataMap.put("educationalDetails", educationalDetails);
		//dataMap.put("studPastProfessions",studPastProfessions);
		return dataMap;
	}

	
}
