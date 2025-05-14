package com.skillpilots.controller.intern;


import java.time.LocalDate;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.skillpilots.Dto.InternshipDto;
import com.skillpilots.model.FeedbackData;
import com.skillpilots.model.Internships;
import com.skillpilots.model.StudentRequest;
import com.skillpilots.model.User;
import com.skillpilots.service.InternshipFeedbackService;
import com.skillpilots.service.InternshipService;
import com.skillpilots.utility.ProjectConstants;

import jakarta.servlet.http.HttpSession;


@Controller
public class StudentInternshipController {
	@Autowired
	private InternshipService internshipService;
	
	@Autowired
	private InternshipFeedbackService internshipFeedbackService;
	
	@Autowired
	private HttpSession session;
	
	
	@RequestMapping("/studentinternships")
	public String internships(Model model, HttpSession session){
		
		User user = (User) session.getAttribute("user");

	    // Extract only the id from the User object
	    Long userId = (user != null) ? user.getId() : null;
	    List<Internships> internships1 = internshipService.getPastOrPendingOrCancelledInternshipsOfStudent(userId, ProjectConstants.internships_status_pending);
	    List<Internships> internships2 = internshipService.getCurrentInternshipsOfStudent(userId);
	    List<Internships> internships3 = internshipService.getPastOrPendingOrCancelledInternshipsOfStudent(userId, ProjectConstants.internships_status_completed);
	    List<Internships> internships4 = internshipService.getPastOrPendingOrCancelledInternshipsOfStudent(userId, ProjectConstants.internships_status_cancelled);
	    
	    model.addAttribute("internship", internships1);
	    model.addAttribute("internship2", internships2);
	    model.addAttribute("internship3", internships3);
	    model.addAttribute("internship4", internships4);
			return "student_viewInternship";
		

	}
	@RequestMapping("/saveFeedbackAgainstCompany")
	public @ResponseBody String savefeed(@RequestParam("internship_id")Long internship_id,@RequestParam("feeds")String feeds){
		User user = (User) session.getAttribute("user");
		String feedbacks[]=feeds.split("-");
		Internships internship=internshipService.getInternship(internship_id);
		FeedbackData feedbackData=new FeedbackData();
		;
		feedbackData.setInternship_id(internship_id);
		feedbackData.setParameter_1(feedbacks[0]);
		feedbackData.setParameter_2(feedbacks[1]);
		feedbackData.setParameter_3(feedbacks[2]);
		feedbackData.setParameter_4(feedbacks[3]);
		feedbackData.setParameter_5(feedbacks[4]);
		feedbackData.setParameter_6(feedbacks[5]);
		feedbackData.setParameter_7(feedbacks[6]);
		feedbackData.setParameter_8(feedbacks[7]);

		//Notification
//		Notifications notif=new Notifications();
//		notif.setFrom_user(user.getUser_id());
//		notif.setCategory(NotificationConstants.notif_category_clg_comp_completed_internship);
//		Student stud = studentService.getStudent(internship.getStudent_id());
//		System.out.println("Contact Number = " +stud.getContact());
//		commonUtil.SendSms("Thank You!!!!! Your Internship Has Been Completed Succesfully.. login into your Account And Download Your Certificate from herer : https://www.skillpilots.com", stud.getContact());
//		if(session.getAttribute("log_type").toString().equalsIgnoreCase(ProjectConstants.user_initials_student)){
//			feedbackData.setFeedback_from(internship.getStudent_id());/*if logged in user is student then set feedback from student*/
//			//notif to company team
//			String param[]=new String[2];
//			param[0]=userService.getUserName(internship.getStudent_id());
//			param[1]=""+internship.getDate_completed();
//			notif.setUser_id(internship.getCompany_id());
//			notif.setDept_id(internship.getComp_dept_id());
//			notif.setNotif_code(NotificationConstants.notif_code_cmp_feedbk_rec_frm_std);
//			notificationsService.crNotifForDept(notif, param);
//		}else{
//			feedbackData.setFeedback_from(internship.getCollege_id());/*if logged in user is college then set feedback from college*/
//			//notif to company hr
//			String param[]=new String[2];
//			param[0]=userService.getUserName(internship.getCollege_id());
//			param[1]="Institute";
//			notif.setUser_id(userService.getHRorIIIHead(internship.getCompany_id()).getUser_id());
//			notif.setNotif_code(NotificationConstants.notif_code_feed_rec_cl_comp_vice_versa);
//			notificationsService.crNotifForUser(notif, param);
//		}

		feedbackData.setFeedback_for(internship.getCompany_id());
		feedbackData.setCreation_date(new Date());
		feedbackData.setFeedback_from(internship.getStudent_id());
		internshipFeedbackService.saveFeedback(feedbackData);
		return "success";
	}


	@RequestMapping("/getStudentsFeed")
	public @ResponseBody FeedbackData getfeed(@RequestParam("internship_id")Long internship_id,@RequestParam("student_id")Long student_id){
		
		System.out.println("internship=="+internship_id + "  student=="+student_id);
		FeedbackData feedbackData=internshipFeedbackService.getFeedbackData(internship_id, student_id);
		return feedbackData;
	}

	@RequestMapping("/cancel_my_internship")
	public @ResponseBody String cancelInternship(@RequestParam("internship_id")Long internship_id,
			@RequestParam("reason") String reason){
		User user = (User) session.getAttribute("user");
		Internships internship = internshipService.getInternship(internship_id);
		internship.setStatus(ProjectConstants.internships_status_cancelled);
		internship.setUpdation_date(LocalDate.now());
		internship.setReason(reason);
		internshipService.saveInternship(internship);
		return "success";
		
}
	@GetMapping("/fetchStatus")
	@ResponseBody
	public List<StudentRequest> fetchStatus() {
	    User user = (User) session.getAttribute("user");
	    if (user == null) {
	        throw new IllegalStateException("User not logged in");
	    }

	    List<StudentRequest> stdntReqData = internshipService.getRecordByid(user.getId());
	    System.out.println("Fetched Student Requests: " + stdntReqData); // Debugging line
	    return stdntReqData;
	}


}
