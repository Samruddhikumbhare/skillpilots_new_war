package com.skillpilots.controller.company;



import java.util.Date;
import java.util.List;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.skillpilots.Dto.InternshipWithStudentDTO;
import com.skillpilots.model.College;
import com.skillpilots.model.Company;
import com.skillpilots.model.User;
import com.skillpilots.repository.CompanyDeptRepo;
import com.skillpilots.service.CollegeService;
import com.skillpilots.service.ComponyService;
import com.skillpilots.service.InternshipService;
import com.skillpilots.service.UserService;
import com.skillpilots.utility.ProjectConstants;

import jakarta.servlet.http.HttpSession;



@Controller
public class CompanyReportController {
  
	@Autowired
	private HttpSession session;
	@Autowired
	private UserService userService;
	
	@Autowired
	private ComponyService componyService;
	@Autowired
	private CompanyDeptRepo companyDeptRepo;
	@Autowired
	private InternshipService internshipService;
	
	@Autowired
	private CollegeService collegeService;
	
	@Autowired
	private ObjectMapper objectMapper;
	
	@GetMapping("/company_report")
	public String companyReport(Model model){
	User user = (User) session.getAttribute("user");
	 System.out.println("email "+ user.getEmail());
	  Long company =null;
	  if(user.getRole().equals(ProjectConstants.company)) {
       	company	= componyService.findByEmail(user.getEmail())    ;     	
       	System.out.println("Companyksssssssssssssssss"+company);
	  }
	  else {
		  User u = userService.findByEmailAndRole(user.getRole(), user.getEmailIdCommon());
	       	company	= componyService.findByEmail(u.getEmailIdCommon())    ;     	

	  }
	                List<String[]> institute_data =	componyService.getInternshipInst(company);
		
	            List<String> technology_data = componyService.getInternshipTech(company);
          List<String> dept_list = componyService.getDepartments(company);
          model.addAttribute("dept_data",dept_list);
	    		model.addAttribute("technology_data",technology_data);
    		
	    		model.addAttribute("institute_data",institute_data);
	System.out.println("dept data"+dept_list);
	
	  return "company_report";
	}

	@GetMapping("/getreport")
	 public ResponseEntity<List<InternshipWithStudentDTO>> getInternships(
	            @RequestParam(required = false) String department,
	            @RequestParam(required = false) String company_name,
	            @RequestParam(required = false) Long coll_dept,
	            @RequestParam(required = false) String status,
	            @RequestParam(required = false) String technology,
	            @RequestParam(required = false) Integer duration,
	            @RequestParam(required = false) Long college_id) {
		
		
		     
	        List<InternshipWithStudentDTO> internships = internshipService.findByTeamsAndStatus(department,company_name,coll_dept ,status, technology, duration, college_id);
	     
	       
	       
	        return ResponseEntity.ok(internships);
	    }
	
	
//	
//	@GetMapping("/getreportsingle")
//	public ResponseEntity<String> getDataByDepartment2(@RequestParam String department,@RequestParam(required = false) String company_name,@RequestParam(required = false) Long coll_dept, @RequestParam(required = false) String status, @RequestParam(required = false) String technology, @RequestParam(required = false) Integer  duration,@RequestParam(required = false) Long college_id) {
//	    // Call your service method with both department and status parameters
//	    List<InternshipWithStudentDTO> report = internshipService.findByTeamsAndStatus2(department,company_name, coll_dept, status , technology,duration ,college_id );
//	    String reportJson;
//	    try {
//	        reportJson = objectMapper.writeValueAsString(report);
//	        return ResponseEntity.ok(reportJson);
//	    } catch (JsonProcessingException e) {
//	        e.printStackTrace();
//	        return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("Error processing JSON");
//	    }
//	
//       	
//}
	
	@GetMapping("/getreportsingle")
	public ResponseEntity<String> getDataByDepartment2(
	        @RequestParam String department,
	        @RequestParam(required = false) String company_name,
	        @RequestParam(required = false) Long coll_dept,
	        @RequestParam(required = false) String status,
	        @RequestParam(required = false) String technology,
	        @RequestParam(required = false) Integer duration,
	        @RequestParam(required = false) Long college_id) {
	   
	    User user = (User) session.getAttribute("user"); // Get user from session
	    Long company = null;
	    College college = null;
	    String reportJson;
	    try {
	        // Determine the user's role and set `company` or `college`
	        if (user.getRole().equals(ProjectConstants.company)) {
	            company = componyService.findByEmail(user.getEmail());
	        } else if (user.getRole().equals(ProjectConstants.hr)) {
	            User u = userService.findByEmailAndRole(user.getRole(), user.getEmailIdCommon());
	            company = componyService.findByEmail(u.getEmailIdCommon());
	        } else if (user.getRole().equals(ProjectConstants.college)) {
	            college = collegeService.getCollegeByEmail(user.getEmail());
	        } else if (user.getRole().equals(ProjectConstants.tpheadiiicell)){ // Assume other roles are college-related
	        	 User tpHeadUser = userService.findByEmailAndRole(user.getRole(), user.getEmailIdCommon());
                college = collegeService.getCollegeByEmail(tpHeadUser.getEmailIdCommon());	           
	        }else if(user.getRole().equals(ProjectConstants.hod)|| user.getRole().equals(ProjectConstants.iii_role3deptIn)) {
	        	 User deptUser = userService.findByEmailAndRoleAndDepartment(user.getRole(), user.getEmailIdCommon(), user.getDepartment());
                  college = collegeService.getCollegeByEmail(deptUser.getEmailIdCommon());
	        }
	        else if(user.getRole().equals(ProjectConstants.iii_role4manager)|| user.getRole().equals(ProjectConstants.internshipLead)) {
	        	 User teamUser = userService.findByEmailAndRoleAndTeamName(user.getEmail(), user.getRole(), user.getEmailIdCommon(), user.getTeam_name());
	        	 company = componyService.findByEmail(teamUser.getEmail());	        }
	        // Call the appropriate service method based on role
	        if (company != null) {
	            // If role is company or HR
	            List<InternshipWithStudentDTO> report = internshipService.findByTeamsAndStatus2(
	                    company, department, company_name, coll_dept, status, technology, duration, college_id);
	            reportJson = objectMapper.writeValueAsString(report);
	        } else if (college != null) {
	            // If role is college
	            List<InternshipWithStudentDTO> report = internshipService.findByTeamsAndStatus3(
	            		college.getCollege_id(), department, company_name, coll_dept, status, technology, duration, college_id);
	            reportJson = objectMapper.writeValueAsString(report);
	            
	        } else {
	            return ResponseEntity.status(HttpStatus.BAD_REQUEST).body("Invalid role or missing data");
	        }
	        // Return the JSON response
	        return ResponseEntity.ok(reportJson);
	    } catch (JsonProcessingException e) {
	        e.printStackTrace();
	        return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("Error processing JSON");
	    } catch (Exception e) {
	        e.printStackTrace();
	        return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("An unexpected error occurred");
	    }
	}
	
	}
