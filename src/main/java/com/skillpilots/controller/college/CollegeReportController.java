package com.skillpilots.controller.college;







import java.sql.Date;
import java.sql.Timestamp;
import java.time.LocalDate;
import java.util.List;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.skillpilots.Dto.InternshipWithStudentDTO;
import com.skillpilots.model.College;
import com.skillpilots.model.User;
import com.skillpilots.service.CollegeReportService;
import com.skillpilots.service.CollegeService;
import com.skillpilots.service.InternshipService;
import com.skillpilots.service.UserService;
import com.skillpilots.utility.ProjectConstants;

import jakarta.servlet.http.HttpSession;




@Controller
public class CollegeReportController {

	
	@Autowired
	private HttpSession session;
	@Autowired
	private CollegeReportService collegeReportService;
	@Autowired
	private CollegeService collegeService;
	@Autowired
	private UserService userService;
	@Autowired
	private InternshipService internshipService;
	
	@GetMapping("/college_report")
	public String collegeReport(Model model){

		User user = (User) session.getAttribute("user");
		
		College college=null;
		List<Object[]> dept_list=null;
		List<String> technology_data=null;
		List<String[]> industry_data=null;

		int dept_id=0;
if(user.getRole().equals(ProjectConstants.college)) {
	college=	collegeService.getCollegeByEmail(user.getEmail());
	
}else if(user.getRole().equals(ProjectConstants.tpheadiiicell)) {
	User u = userService.findByEmailAndRole(user.getRole(), user.getEmailIdCommon());
	college=	collegeService.getCollegeByEmail(u.getEmailIdCommon());

		
	}else if(user.getRole().equals(ProjectConstants.hod) || user.getRole().equals(ProjectConstants.iii_role3deptIn)) {
		User u = userService.findByEmailAndRoleAndDepartment(user.getRole(), user.getEmailIdCommon(), user.getDepartment());
		college=	collegeService.getCollegeByEmail(u.getEmailIdCommon());

			
		}
			dept_list = collegeReportService.getDepartments(college.getCollege_id());
			technology_data = collegeReportService.getInternshipTech(college.getCollege_id(),0);
			industry_data = collegeReportService.getInternshipInd(college.getCollege_id(),0);
			model.addAttribute("dept_data",dept_list);


		model.addAttribute("technology_data",technology_data);
		model.addAttribute("industry_data",industry_data);
		return "college_report";
	}

	@GetMapping("/getreportAll")
	 public ResponseEntity<List<InternshipWithStudentDTO>> getAllInternships() {
		
		User user = (User) session.getAttribute("user");
	
		College college=null;
		if(user.getRole().equals("5")) {
		 college = collegeService.getCollegeByEmail(user.getEmail());
		}
		else if(user.getRole().equals(ProjectConstants.tpheadiiicell)){
		User exUser = userService.findByEmailAndRole(user.getRole(), user.getEmailIdCommon());
		 college = collegeService.getCollegeByEmail(exUser.getEmailIdCommon());

		}else {
			User u = userService.findByEmailAndRoleAndDepartment(user.getRole(), user.getEmailIdCommon(), user.getDepartment());
			 college = collegeService.getCollegeByEmail(u.getEmailIdCommon());
		}
		
				
		Long cid =  college.getCollege_id();
	
	        List<InternshipWithStudentDTO> internships = internshipService.findByCollegeId( cid);
	    
	      
	      
	        return ResponseEntity.ok(internships);
	    }
	

}
