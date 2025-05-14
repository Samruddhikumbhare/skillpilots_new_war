package com.skillpilots.controller.company;

import java.time.LocalDate;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.skillpilots.model.CollCompTieup;
import com.skillpilots.model.College;
import com.skillpilots.model.Company;
import com.skillpilots.model.User;
import com.skillpilots.service.CollegeService;
import com.skillpilots.service.ComponyService;
import com.skillpilots.service.TieUpService;
import com.skillpilots.service.UserService;
import com.skillpilots.utility.ProjectConstants;

import jakarta.servlet.http.HttpSession;

@Controller
public class CollegeTieUpController {

	@Autowired
	private CollegeService collegeService;
	@Autowired
	private HttpSession session;
	@Autowired
	private TieUpService tieupService;
	@Autowired
	private ComponyService componyService;
	@Autowired
	private UserService userService;
	
	@RequestMapping("/college_tie_up")
	public String viewCollegeList(Model model) {
		
		User user = (User) session.getAttribute("user");
		if(user!=null) {
		Company company = null;
		
		
		if(user.getRole().equals("1")) {
		
			company=	componyService.getCompanyById(user.getEmail());
		}
		else if(user.getRole().equals(ProjectConstants.iii_role4manager)) {
			User u = userService.findByEmailAndRoleAndTeamName(user.getEmail(),user.getRole(), user.getEmailIdCommon(), user.getTeam_name());
			company=	componyService.getCompanyById(u.getEmailIdCommon());
		}
		else {
			company=	componyService.getCompanyById(user.getEmailIdCommon());
		}
		System.out.println(user.getInstituteId()+"company "+company.getCompany_id());
		List<College> college = collegeService.getAllTieColleges();
		List<CollCompTieup> sentRequests = tieupService.getCompanyTieUpList(user.getInstituteId(),"CP");
		
		List<CollCompTieup> receivedRequest = tieupService.getCollegeReceivedReq(company.getCompany_id(),"CL");
		
		List<CollCompTieup> tiedupcolleges = tieupService.getCollegeTie(company.getCompany_id(),"CL");
		
		 model.addAttribute("colleges", college);
		 model.addAttribute("sentRequest", sentRequests);
		 model.addAttribute("receivedRequest", receivedRequest);
		 model.addAttribute("tiedupcolleges", tiedupcolleges);
		
			return "comp_coll_tie_up";
		
	}else {
		return "redirect:logout";
	}
	}
	
	@RequestMapping(value = "/college_tieup_req", method = RequestMethod.POST)
	public String tieUpRequest(@RequestParam(name = "company_id") Long companyId,
            @RequestParam(name = "college_id") Long collegeId, @RequestParam(name="college_name")String collegeName) {
		User user = (User) session.getAttribute("user");
	
		tieupService.saveTieUpReqCompany(companyId, collegeId, collegeName);
		return "redirect:college_tie_up";
	}
	
	 
	@PostMapping("/acceptRequest")
	public ResponseEntity<?> acceptRequest(@RequestParam Long tieupId) {
		 try {
		        LocalDate currentDate = LocalDate.now(); // Get the current date
		       
		       
		        tieupService.updateStatus(tieupId, "Accepted", currentDate);
		       
		        return new ResponseEntity<>(HttpStatus.OK);
		    } catch (Exception e) {
		        // Log the exception for debugging
		        e.printStackTrace();
		        return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
		    }

	}

	
}
