package com.skillpilots.controller.college;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.skillpilots.model.CompAdvertisement;
import com.skillpilots.model.Student;
import com.skillpilots.model.User;
import com.skillpilots.service.ComponyService;
import com.skillpilots.service.DepartmentService;
import com.skillpilots.service.TechnologyService;

import jakarta.servlet.http.HttpSession;



@Controller
public class CollegeDashboardController {
	@Autowired
	private ComponyService componyService;
	@Autowired
	private DepartmentService departmentService;
	@Autowired
	private TechnologyService technologyService;

	@RequestMapping("college_dashboard")
	public String studentHome(HttpSession session, Model model) {
	    User user = (User) session.getAttribute("user");
	    List<CompAdvertisement> adv=null;
	   
	    		adv =	componyService.getAllCompAdvertisements();
	    	
		List<String> allCities = componyService.getAllCities();
			List<String> dept_names = departmentService.getDeptNameList();
			List<String> tech_names = technologyService.getTechList();
			model.addAttribute("dept_names", dept_names);
			model.addAttribute("tech_names", tech_names);
			model.addAttribute("cities", allCities);
			System.out.println("allCities"+allCities);

			
			
			System.out.println("dept_names"+dept_names);
			System.out.println("tech_names"+ tech_names);
			//model.addAttribute("com_list", getCityWiseCompnayList);
		

	        model.addAttribute("adv", adv);
	        model.addAttribute("user", user);
	    
	        return "college_dashboard";
	    } 
}


