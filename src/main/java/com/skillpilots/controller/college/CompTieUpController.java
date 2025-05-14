package com.skillpilots.controller.college;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.skillpilots.model.CollCompTieup;
import com.skillpilots.model.College;
import com.skillpilots.model.Company;
import com.skillpilots.model.User;
import com.skillpilots.service.CollegeService;
import com.skillpilots.service.ComponyService;
import com.skillpilots.service.TieUpService;
import com.skillpilots.service.UserService;

import jakarta.servlet.http.HttpSession;


@Controller
public class CompTieUpController {
	@Autowired
	private ComponyService componyService;
	@Autowired
	private HttpSession session;
	
	@Autowired
	private TieUpService tieupService;
	
	@Autowired
	private CollegeService collegeService;
	
	@RequestMapping(value = "/comp_tie_up", method = RequestMethod.GET)
	public String tie_up(Model model) {
		
		User user = (User) session.getAttribute("user");
		if(user==null) {
			return "coll_comp_tie_up";
		}
		
		if(user.getRole().equals("5")) {
		College college = collegeService.getCollegeByEmail(user.getEmail());
		
		  	  List<Company> companies = componyService.findAllByType();
			
			  List<CollCompTieup> sentRequests =
			  tieupService.getAllTieCompanesByStatus(user.getId(),"CL"); 
			  List<CollCompTieup> receivedRequest =
			  tieupService.getAllReceiveCompany(college.getCollege_id(),"CP");
			 
			  List<CollCompTieup> tiedupcompanies
			  = tieupService.getAllTieCompany(college.getCollege_id(),"CP");
			
		
			  model.addAttribute("companies", companies);
			
			  model.addAttribute("sentRequests", sentRequests);
			  model.addAttribute("receivedRequest", receivedRequest);
			  model.addAttribute("tiedupcompanies", tiedupcompanies);
			
			return "coll_comp_tie_up";
		}	
		else {
			College college = collegeService.getCollegeByEmail(user.getEmailIdCommon());
			 List<Company> companies = componyService.findAllByType();
				
			  List<CollCompTieup> sentRequests =
			  tieupService.getAllTieCompanesByStatus(user.getId(),"CL"); 
			  List<CollCompTieup> receivedRequest =
			  tieupService.getAllReceiveCompany(college.getCollege_id(),"CP");
			 
			  List<CollCompTieup> tiedupcompanies
			  = tieupService.getAllTieCompany(college.getCollege_id(),"CP");
			
		
			  model.addAttribute("companies", companies);
			
			  model.addAttribute("sentRequests", sentRequests);
			  model.addAttribute("receivedRequest", receivedRequest);
			  model.addAttribute("tiedupcompanies", tiedupcompanies);
			
			return "coll_comp_tie_up";

		}
	}
	
	@RequestMapping(value = "/comp_tieup_req", method = RequestMethod.POST)
	public String tieUpRequest(@RequestParam(name = "company_id") Long companyId,
            @RequestParam(name = "college_id") Long collegeId,@RequestParam(name="company_name") String companyName) {
		User user = (User) session.getAttribute("user");
		if(user==null) {
			return "coll_comp_tie_up";
		}
		
	
		tieupService.saveTieUpRequest(companyId, collegeId,companyName);
		return "redirect:comp_tie_up";
	}
	}
