package com.skillpilots.controller.company;





import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;


@Controller
public class CompanyCollegeController {
	

	
	@RequestMapping(value="/collegeRequest")
	public String collegeRequest(@RequestParam String college_id,@RequestParam String status){
		//User user=(User)session.getAttribute("user_data");
		//external_reqService.updateStatus(college_id, status,user.getUser_id());
		return "redirect:college_internship_request";
	}
	@RequestMapping(value="/college_internship_request",method=RequestMethod.GET)
	public String collegeInternshipRequest(Model model){
		
		return "college_internship_request";
	}

}
