package com.skillpilots.controller.company;





import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.skillpilots.Dto.InternshipDto;
import com.skillpilots.Dto.TeamDto;
import com.skillpilots.model.Company;
import com.skillpilots.model.Internships;
import com.skillpilots.model.User;
import com.skillpilots.service.CompDeptService;
import com.skillpilots.service.CompanyInternalRequestService;
import com.skillpilots.service.ComponyService;
import com.skillpilots.service.InternshipService;
import com.skillpilots.service.UserService;
import com.skillpilots.utility.ProjectConstants;

import jakarta.servlet.http.HttpSession;



@Controller
public class CompanyDashboardController {
	@Autowired
	private HttpSession session;
	@Autowired
	private InternshipService internshipService;
	@Autowired
	private ComponyService componyService;
	@Autowired
	private UserService userService;
	@Autowired
	private CompDeptService compDeptService;
	@Autowired
	private CompanyInternalRequestService companyInternalRequestService;
	@RequestMapping("/company_dashboard")
	public String getDashboerdCompany(Model model){
		User user = (User) session.getAttribute("user");
		if(user!=null) {

		Long userId = (user != null && user.getCommonId() != null) ? user.getCommonId() : user.getInstituteId();
		Company company=null;
		  List<Object[]> internships1 =null;
		  List<Object[]> internships2 = null ;
		  List<Object[]> internships3=null;
		  List<Object[]> internships4=null;
		if(user.getRole().equals("1")) {
			   company = componyService.getCompanyById(user.getEmail());
			  }
		else if(user.getRole().equals(ProjectConstants.iii_role4manager) || user.getRole().equals(ProjectConstants.internshipLead)) {
			User u = userService.findByEmailAndRoleAndTeamName(user.getEmail(),user.getRole(), user.getEmailIdCommon(), user.getTeam_name());
			company = componyService.getCompanyById(u.getEmailIdCommon());
			
			internships1 = internshipService.getInternshipsOfCompany(company.getCompany_id(), "Completed",user.getId());
			internships2 = internshipService.getInternshipsOfCompany(company.getCompany_id(), "P",user.getId());
			internships3 = internshipService.getInternshipsOfCompany(company.getCompany_id(), "ongoing",user.getId());
			
			internships4 = companyInternalRequestService.getInternalReqByRole(company.getCompany_id(),new Date(),ProjectConstants.coll_dept_link_status_active);	  
		    List<Object[]> internalLastThreeReqByRole = companyInternalRequestService.getInternalLastThreeReqByRole(company.getCompany_id(), ProjectConstants.coll_dept_link_status_active);
		    System.out.println("company id is: " + company.getCompany_id());
		    List<TeamDto> compDeptLink = compDeptService.getTeams(user.getId());
			model.addAttribute("compDeptLink", compDeptLink);
			
		    model.addAttribute("com_three_internal_req", internalLastThreeReqByRole);
		}
		else if(user.getRole().equals(ProjectConstants.hr)) {
			User u = userService.findByEmailAndRole(user.getRole(), user.getEmailIdCommon());
			company = componyService.getCompanyById(u.getEmailIdCommon());

		}
		   if(user.getRole().equals(ProjectConstants.company)|| user.getRole().equals(ProjectConstants.hr)) {
		internships1= internshipService.getInternshipsOfCompanies(company.getCompany_id(), "Completed");
		internships2=  internshipService.getInternshipsOfCompanies(company.getCompany_id(), "P");
		internships3 = internshipService.getInternshipsOfCompanies(company.getCompany_id(), "ongoing");
		internships4 = companyInternalRequestService.getInternalReqByRole(company.getCompany_id(),new Date(),ProjectConstants.coll_dept_link_status_active);	  
		   }
		    long pendingCount = internships2.stream().count();
		    model.addAttribute("pendingCount", pendingCount);
		   
		    System.out.println("pending count is "+pendingCount);
		    long ongoingCount = internships3.stream().count();
		    model.addAttribute("ongoingCount", ongoingCount);
		   
		    long completedCount = internships1.stream().count();
		    model.addAttribute("completedCount", completedCount);
		   
		    long company_internal_request_count = internships4.stream().count();
		    model.addAttribute("company_internal_request_count", company_internal_request_count);
		   
		 
		   
	
				
			return "company_dashboard";
		
		
	}
	
	else {
		return "redirect:logout";
	}

}}
