package com.skillpilots.controller.company;





import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.skillpilots.Dto.InternshipDto;
import com.skillpilots.model.Certificates;
import com.skillpilots.model.CollDeptLink;
import com.skillpilots.model.College;
import com.skillpilots.model.Company;
import com.skillpilots.model.Internships;
import com.skillpilots.model.User;
import com.skillpilots.service.CertificateService;
import com.skillpilots.service.CollDeptService;
import com.skillpilots.service.CollegeService;
import com.skillpilots.service.ComponyService;
import com.skillpilots.service.InternshipService;
import com.skillpilots.service.UserService;
import com.skillpilots.utility.ProjectConstants;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class CertificateController {
	@Autowired
	private HttpSession session;
	@Autowired
	private UserService userService;
	@Autowired
	private InternshipService internshipService;
	@Autowired
	private ComponyService componyService;
	@Autowired
	private CollegeService collegeService;
	@Autowired
	private CollDeptService collDeptService;
	@Autowired
	private CertificateService certificateService;
	
	
	
	@RequestMapping("/certificate")
	public String ShowCertificate(Model model) {
		User user = (User) session.getAttribute("user");
		
	
	
		System.out.println("Inside Certificate....");

		// For Student Login
		if (user.getRole().equals("0")||user.getRole().equals("10")) {
			//model.addAttribute("Internships", new Internships());
			System.out.println(user.getId());
			List<InternshipDto> stulist = internshipService.getCertificate(user.getId());
			//model.addAttribute("sidebar", navBarUtil.getStudNavBar(ProjectConstants.sidebar_map_key_certificate));
			model.addAttribute("studentss", stulist);
			System.out.println("student list"+stulist);
		}
		// For Company Login
		if (user.getRole().equals(ProjectConstants.company)) {
			Company company = componyService.getCompanyById(user.getEmail());
			model.addAttribute("Internships", new Internships());
			List<InternshipDto> stulist = internshipService.getAllStudent(company.getCompany_id());
		//	model.addAttribute("sidebar", navBarUtil.getCompanyNavBar(ProjectConstants.sidebar_map_key_certificate));
			model.addAttribute("studentss", stulist);
			
			// For Company HR Login
		} 
			else if (user.getRole().equals(ProjectConstants.hr)) { 
			
			User u = userService.findByEmailAndRole(user.getRole(), user.getEmailIdCommon());
			Company company = componyService.getCompanyById(u.getEmailIdCommon());
				
				model.addAttribute("Internships", new Internships());
				List<InternshipDto> stulist = internshipService.getAllStudent(company.getCompany_id());
//				model.addAttribute("sidebar", navBarUtil.getCompanyNavBar(ProjectConstants.sidebar_map_key_certificate));
				model.addAttribute("studentss", stulist);
				return "certificate";
			
		}
		
		// For College Login
		if (user.getRole().equals(ProjectConstants.college)) {
			System.out.println("Inside college =" + user.getId());
			  model.addAttribute("Internships", new Internships()); 
			  College college = collegeService.getCollegeByEmail(user.getEmail());
			  List<InternshipDto>
			  stulist = internshipService.getStudCertificate(college.getCollege_id());
			//  model.addAttribute("sidebar",
		//	  navBarUtil.getCollegeNavBar(ProjectConstants.sidebar_map_key_certificate));
			  model.addAttribute("studentss", stulist);
			 
			
			// Either College HOD / T & P Department
		} 
		else if (user.getRole().equals(ProjectConstants.tpheadiiicell)) {
			User u = userService.findByEmailAndRole(user.getRole(), user.getEmailIdCommon());
			College college = collegeService.getCollegeByEmail(u.getEmailIdCommon());
			List<InternshipDto> internlist = internshipService.getCollStudentCertificate(college.getCollege_id());
				internshipService.getCollStudentCertificate(college.getCollege_id());
				model.addAttribute("studentss", internlist);
				
	
				System.out.println("Inside College 1 t & p " + user.getId());
				model.addAttribute("Internships", new Internships());
			//	model.addAttribute("sidebar", navBarUtil.getCollegeNavBar(ProjectConstants.sidebar_map_key_certificate));
						//	 for perticular hod_department 
		}	
		else if (user.getRole().equals(ProjectConstants.hod)) {
			User u = userService.findByEmailAndRoleAndDepartment(user.getRole(), user.getEmailIdCommon(), user.getDepartment());
			College college = collegeService.getCollegeByEmail(u.getEmailIdCommon());
			List<CollDeptLink> departments = collDeptService.getAllDept(college.getCollege_id(),user.getId());

				for(CollDeptLink cdl : departments) {
					String dept_id = String.valueOf(cdl.getDeptId());
				
					System.out.println("Department = "+cdl.getDeptId());
					List<InternshipDto> stulist = internshipService.getStudentCertificate(college.getCollege_id(),cdl.getDeptId());
					model.addAttribute("studentss", stulist);
				
			}
		
	  }
		return "certificate";

	}
	@RequestMapping("/certificate2")
	public String certificateNew() {
		
		return "certificate2";
	}
	
	
	
	

    

	  @PostMapping("/saveCertificate")
	    public ResponseEntity<String> saveCertificate(@RequestBody Map<String, String> data) {
	        // Extract URL and studentId from the request body
	        String fullUrl = data.get("url");
	        Long studentId = Long.parseLong(data.get("studentId")); // Ensure studentId is passed as a String and convert to Long

	        // Create a new Certificates object
	        Certificates certificate = new Certificates(studentId, fullUrl);

	        // Save the object to the database
	        certificateService.save(certificate);

	        return ResponseEntity.ok("Certificate data saved successfully!");
	    }
	
	
	
	
}