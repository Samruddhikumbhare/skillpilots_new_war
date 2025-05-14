package com.skillpilots.controller.college;


import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.skillpilots.model.CollDeptLink;
import com.skillpilots.model.College;
import com.skillpilots.model.Company;
import com.skillpilots.model.FeedbackData;
import com.skillpilots.model.User;
import com.skillpilots.service.CollDeptService;
import com.skillpilots.service.CollegeService;
import com.skillpilots.service.ComponyService;
import com.skillpilots.service.InternshipFeedbackService;
import com.skillpilots.service.InternshipService;
import com.skillpilots.service.StudentRequestService;
import com.skillpilots.service.UserService;
import com.skillpilots.utility.ProjectConstants;

import jakarta.servlet.http.HttpSession;


@Controller
public class InternshipController {
	
	@Autowired
	private HttpSession session;

	
	@Autowired
	private UserService userService;
	
	@Autowired
	private CollegeService collegeService;
	@Autowired
	private StudentRequestService studentRequestService;
	
	@Autowired
	private InternshipFeedbackService internshipFeedbackService;
	@Autowired
	private InternshipService internshipService;
	@Autowired
	private CollDeptService collDeptService;
	
	@RequestMapping("/collegeViewInternships")
	public String viewIntersnhips(Model model){
		User user = (User) session.getAttribute("user");
		College college=null;
		if(user.getRole().equals("5")) {
		 college = collegeService.getCollegeByEmail(user.getEmail());
		}
		else {
			 college = collegeService.getCollegeByEmail(user.getEmailIdCommon());
		}
		
		
		if(user!=null){
			List<Object[]> ongoingList = internshipService.getInternshipsOfCollege(college.getCollege_id(),  "ongoing"	);		
			
			List<Object[]> pendingList = internshipService.getInternshipsOfCollege(college.getCollege_id(),  "P"	);		
			List<Object[]> completedList = internshipService.getInternshipsOfCollege(college.getCollege_id(),  "Completed"	);		
			List<Object[]> canceledInternship = internshipService.getInternshipsOfCollege(college.getCollege_id(),  "cancelled"	);		

				  
			
			System.out.println("Onging Internships"+ ongoingList);
			
			model.addAttribute("pendingInternships", pendingList);
			model.addAttribute("ongoingInternships", ongoingList);
			model.addAttribute("completedInternships", completedList);
			model.addAttribute("canceledInternships", canceledInternship);			
			
			return "college_viewInternships";
		}else{
			return "redirect:logout";
		}
	}
	
	@GetMapping("/feedbackFromCollToComp")
	public @ResponseBody String saveCollfeed(@RequestParam("company_id")Long company_id,@RequestParam("feeds")String feeds){
	
		User user = (User) session.getAttribute("user");
		
		
		String feedbacks[]=feeds.split("-");
		FeedbackData feedbackData=new FeedbackData();
		

		feedbackData.setParameter_1(feedbacks[0]);
		feedbackData.setParameter_2(feedbacks[1]);
		feedbackData.setParameter_3(feedbacks[2]);
		feedbackData.setParameter_4(feedbacks[3]);
		feedbackData.setParameter_5(feedbacks[4]);
		feedbackData.setParameter_6(feedbacks[5]);
		feedbackData.setParameter_7(feedbacks[6]);
		feedbackData.setParameter_8(feedbacks[7]);
		
		feedbackData.setFeedback_from(user.getInstituteId());
		
		feedbackData.setFeedback_for(company_id);
		feedbackData.setCreation_date(new Date(new java.util.Date().getTime()));
		internshipFeedbackService.saveFeedback(feedbackData);
		return "success";
	}
	
	@GetMapping("/checkNoOfInternships")
	public @ResponseBody String checkInternships(@RequestParam("company_id")Long company_id){
		College college=null;
		User user = (User) session.getAttribute("user");
		if(user.getRole().equals("5")) {
		 college = collegeService.getCollegeByEmail(user.getEmail());
		}
		else {
			 college = collegeService.getCollegeByEmail(user.getEmailIdCommon());
		}
		System.out.println(college.getCollege_id()+">>>>>>>>>"+company_id);
		Long count=internshipFeedbackService.getNoOfCompletedInternships(college.getCollege_id(),company_id);
		System.out.println("Count hshshhs"+count);
		if(count>=2){
			System.out.println(college.getCollege_id()+">>>>>>>>>"+company_id);
			FeedbackData fd=internshipFeedbackService.getFeedbackOfCollege(college.getCollege_id(), company_id);
			if(fd!=null){
				JSONObject json = new JSONObject();
				json.put("param1", fd.getParameter_1());
				json.put("param2", fd.getParameter_2());
				json.put("param3", fd.getParameter_3());
				json.put("param4", fd.getParameter_4());
				json.put("param5", fd.getParameter_5());
				json.put("param6", fd.getParameter_6());
				json.put("param7", fd.getParameter_7());
				json.put("param8", fd.getParameter_8());
				
				return json.toString();
			}
			return "true";
		}else{
			return "false";
		}
	}
	
	@RequestMapping("/getAppliedStudentsOfCollege")
	public String getappliedstud(Model model) {
		User user = (User) session.getAttribute("user");
		Long dept_id=null;
		
		
		College college=null;
		if(user.getRole().equals("5")) {
		 college = collegeService.getCollegeByEmail(user.getEmail());
		}
		else {
			 college = collegeService.getCollegeByEmail(user.getEmailIdCommon());
		}
		
		if(user!=null){
			if(user.getRole().equals(ProjectConstants.hod) || user.getRole().equals(ProjectConstants.iii_role3deptIn)){
				CollDeptLink collDeptLink=collDeptService.getDepartmentLink(user.getId());
				dept_id=collDeptLink.getDeptId() ;
			}else{
				dept_id=null;
			}
			List<Object[]> list = studentRequestService.getAppliedStudentsFromCollege(college.getCollege_id(),dept_id);
			model.addAttribute("studentsAppliedToCompanies", list);
		
			return "appliedStudentsOfCollege";
		}else{
			return "redirect:logout";
		}
		
	}
	
	@RequestMapping("/getStudentInternshipData")
	public String getdetails(){
//		System.out.println("Student_Internship_id = " +student_id);
//		Internships stud_data=internshipsService.getStudentData(student_id);
		
		return "stud_data";
	}
}
