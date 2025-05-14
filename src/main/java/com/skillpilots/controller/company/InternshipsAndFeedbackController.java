package com.skillpilots.controller.company;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.concurrent.TimeUnit;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.skillpilots.model.Company;
import com.skillpilots.model.CompanyAssignment;
import com.skillpilots.model.Internships;
import com.skillpilots.model.NotificationRequest;
import com.skillpilots.model.ProgressData;
import com.skillpilots.model.User;
import com.skillpilots.repository.CompanyAssignmentRepo;
import com.skillpilots.service.ComponyService;
import com.skillpilots.service.InternshipFeedbackService;
import com.skillpilots.service.InternshipService;
import com.skillpilots.service.NotificationService;
import com.skillpilots.service.UserService;
import com.skillpilots.utility.FirebaseService;
import com.skillpilots.utility.ProjectConstants;

import jakarta.servlet.http.HttpSession;

@Controller
public class InternshipsAndFeedbackController {

	@Autowired
	private InternshipService internshipService;

	@Autowired
	private HttpSession session;

	@Autowired
	private InternshipFeedbackService internshipFeedbackService;

	@Autowired
	private ComponyService componyService;
	@Autowired
	private UserService userService;
	@Autowired
	private FirebaseService firebaseService;
	@Autowired
	private NotificationService notificationService;
	@Autowired
	private CompanyAssignmentRepo assignmentRepo;

	@RequestMapping("/company_internships")
	public String viewInternships(Model model) {
		User user = (User) session.getAttribute("user");
		if(user!=null) {
		List<Object[]> completedInternships = null;
		List<Object[]> companyinternships2 = null;
		List<Object[]> companyinternships3 = null;
		List<Object[]> companyinternships4 = null;
		Company company = null;
		Long companyId = (user != null) ? user.getId() : null;
		if (user.getRole().equals("1")) {
			company = componyService.getCompanyById(user.getEmail());
			completedInternships = internshipService.getInternshipsOfCompanies(company.getCompany_id(), "Completed");
			companyinternships2 = internshipService.getInternshipsOfCompanies(company.getCompany_id(), "P");
			companyinternships3 = internshipService.getInternshipsOfCompanies(company.getCompany_id(), "ongoing");
			companyinternships4 = internshipService.getInternshipsOfCompanies(company.getCompany_id(), "cancelled");

		} else if (user.getRole().equals(ProjectConstants.hr)) {
			company = componyService.getCompanyById(user.getEmailIdCommon());
			completedInternships = internshipService.getInternshipsOfCompanies(company.getCompany_id(), "Completed");
			companyinternships2 = internshipService.getInternshipsOfCompanies(company.getCompany_id(), "P");
			companyinternships3 = internshipService.getInternshipsOfCompanies(company.getCompany_id(), "ongoing");
			companyinternships4 = internshipService.getInternshipsOfCompanies(company.getCompany_id(), "cancelled");

		} else {
			User u = userService.findByEmailAndRoleAndTeamName(user.getEmail(), user.getRole(), user.getEmailIdCommon(),
					user.getTeam_name());

			company = componyService.getCompanyById(u.getEmailIdCommon());
			completedInternships = internshipService.getInternshipsOfCompany(company.getCompany_id(), "Completed",
					user.getId());

			companyinternships2 = internshipService.getInternshipsOfCompany(company.getCompany_id(), "P", user.getId());
			companyinternships3 = internshipService.getInternshipsOfCompany(company.getCompany_id(), "ongoing",
					user.getId());
			companyinternships4 = internshipService.getInternshipsOfCompany(company.getCompany_id(), "cancelled",
					user.getId());
		}

		System.out.print("Internships are ");
		for (Object[] row : companyinternships2) {
			System.out.print("[");
			for (Object column : row) {
				System.out.print(column + ", ");
			}
			System.out.print("], ");
		}
		model.addAttribute("companyId", company.getCompany_id());
		model.addAttribute("completedInternships", completedInternships);
		model.addAttribute("pendingInternships", companyinternships2);
		model.addAttribute("ongoingInternships", companyinternships3);
		model.addAttribute("canceledInternships", companyinternships4);
		if (null != session.getAttribute("currentActiveClass")) {
			String cl = session.getAttribute("currentActiveClass").toString();
			if (cl.equalsIgnoreCase("pending")) {
				model.addAttribute("pendingclass", "active");
			} else if (cl.equalsIgnoreCase("ongoing")) {
				model.addAttribute("ongoingclass", "active");
			} else {
				model.addAttribute("completedclass", "active");
			}
		} else {
			model.addAttribute("pendingclass", "active");
		}
		session.removeAttribute("currentActiveClass");
		return "company_viewInternships";
	}else {
		return "redirect:login_check";
	}
	}
	@GetMapping("/feedbackFromCompany")
	@ResponseBody
	HashMap<String, Object> getfeed(@RequestParam("internship_id") Long internship_id) {
		Internships internship = internshipService.getInternship(internship_id);
		ProgressData progressData = internshipFeedbackService.getProgressData(internship_id);
		System.out.println("Progress Data " + progressData + "kkk" + internship_id);
		long noOfDaysBetween = getDifferenceDays(internship.getDate_started(), new Date());
		HashMap<String, Object> response = new HashMap<>();
		long feedWeek = noOfDaysBetween / 7;
		ArrayList<String> feedlist = new ArrayList<>();
		if (null == progressData) {
			System.out.println("no feedback for this internship");
			System.out.println("difference between " + new Date() + "  and  " + internship.getDate_started() + "  is  "
					+ noOfDaysBetween);
		} else {
			String p1 = progressData.getParameter_1();
			String para1[] = p1.split(",");
			String p2 = progressData.getParameter_2();
			String para2[] = p2.split(",");
			String p3 = progressData.getParameter_3();
			String para3[] = p3.split(",");
			String p4 = progressData.getParameter_4();
			String para4[] = p4.split(",");
			String p5 = progressData.getParameter_5();
			String para5[] = p5.split(",");
			String p6 = progressData.getParameter_6();
			String para6[] = p6.split(",");
			String p7 = progressData.getParameter_7();
			String para7[] = p7.split(",");
			String p8 = progressData.getParameter_8();
			String para8[] = p8.split(",");
			String avg = progressData.getOverall();
			String overall[] = avg.split(",");

			for (int i = 0; i < para1.length; i++) {
				String feed = para1[i].split("-")[1] + "-" + para2[i].split("-")[1] + "-" + para3[i].split("-")[1] + "-"
						+ para4[i].split("-")[1] + "-" + para5[i].split("-")[1] + "-" + para6[i].split("-")[1] + "-"
						+ para7[i].split("-")[1] + "-" + para8[i].split("-")[1] + "-" + overall[i].split("-")[1];
				feedlist.add(feed);
			}
			System.out.println(noOfDaysBetween + "   " + feedWeek);

			System.out.println("Feedback Selected.  " + feedlist);
		}
		response.put("feedback", feedlist);
		response.put("feedWeed", feedWeek);
		if (null != progressData) {
			response.put("comment", progressData.getComments());
		}
		return response;
	}

	@PostMapping("/saveFeedback")
	public @ResponseBody String savefeed(@RequestParam("feedbakData") String fd,
			@RequestParam("internship_id") Long internship_id, @RequestParam("comment") String comment, Model model) {
		System.out.println(fd + " " + internship_id + " " + comment);
		ObjectMapper mapper = new ObjectMapper();
		NotificationRequest notif = new NotificationRequest();
		ProgressData progressData = new ProgressData();
		Internships internship = internshipService.getInternship(internship_id);
		try {
			progressData = mapper.readValue(fd, ProgressData.class);
		} catch (Exception e) {
			e.printStackTrace();
		}
		User user = (User) session.getAttribute("user");

		ProgressData progData = internshipFeedbackService.getProgressData(internship_id);
		if (null == progData) {

			progressData.setInternship_id(internship_id);
			progressData.setCreation_date(new java.sql.Date(new Date().getTime()));
			progressData.setStatus(ProjectConstants.progress_status_ongoing);
			if (comment.equals("internsorbit")) {
				internshipFeedbackService.saveProgressData(progressData);
			} else {
				progressData.setComments(comment);
				progressData.setStatus(ProjectConstants.progress_status_completed);
				internshipFeedbackService.saveProgressData(progressData);
				internship.setDate_completed(new Date());
				internship.setUpdation_date(LocalDate.now());
				internship.setStatus(ProjectConstants.internships_status_completed);

				internshipService.saveInternship(internship);

			}
		} else {
			progData.setParameter_1(progData.getParameter_1() + "," + progressData.getParameter_1());
			progData.setParameter_2(progData.getParameter_2() + "," + progressData.getParameter_2());
			progData.setParameter_3(progData.getParameter_3() + "," + progressData.getParameter_3());
			progData.setParameter_4(progData.getParameter_4() + "," + progressData.getParameter_4());
			progData.setParameter_5(progData.getParameter_5() + "," + progressData.getParameter_5());
			progData.setParameter_6(progData.getParameter_6() + "," + progressData.getParameter_6());
			progData.setParameter_7(progData.getParameter_7() + "," + progressData.getParameter_7());
			progData.setParameter_8(progData.getParameter_8() + "," + progressData.getParameter_8());
			progData.setOverall(progData.getOverall() + "," + progressData.getOverall());
			progData.setUpdation_date(new java.sql.Date(new Date().getTime()));

			if (comment.equals("internsorbit"))
				internshipFeedbackService.saveProgressData(progData);

			progData.setComments(comment);
			progData.setStatus(ProjectConstants.progress_status_completed);
			internshipFeedbackService.saveProgressData(progData);
			internship.setDate_completed(new Date());
			internship.setUpdation_date(LocalDate.now());
			internship.setStatus(ProjectConstants.internships_status_completed);
			User u = userService.getUserById(internship.getStudent_id());
			internshipService.saveInternship(internship);

			// notificatin sent

			notif.setMsgBody("Congratulations......🎉🎉! Internship has been Completed at "
					+ internship.getCompanyName() + " Please Log in and Download Your Certificate!");
			notif.setReceiverId(internship.getStudent_id());
			notif.setSenderId(user.getId());
			notif.setTitle("Greetings From SkillPilots !!!!");
			notif.setDateTime(LocalDateTime.now());
			notif.setDeptId(internship.getColl_dept());
			notificationService.addNotification(notif);

			if (u.getNotificationToken() != null && !u.getNotificationToken().isEmpty()) {
				firebaseService.sendNotification(u.getNotificationToken(), "Greetings From SkillPilots !!!!",
						"Congratualtions......🎉🎉! Internship has been Completed at " + internship.getCompanyName()
								+ " Please Log in and Download Your Certificate! ");
			}

		}

		return "success";
	}

	@RequestMapping("/editInternship")
	public @ResponseBody String editInternship(@RequestParam("internship_id") Long internship_id,
			@RequestParam("action") String status, @RequestParam("activeclass") String activeclass,
			@RequestParam(value = "cancellationReason", required = false) String cancellationReason) {

		NotificationRequest notif = new NotificationRequest();

		System.out.println("statyssusysysy  " + status);
		Internships internship = internshipService.getInternship(internship_id);
		internship.setUpdation_date(LocalDate.now());
		internship.setStatus(status);
		Long student_id = internship.getStudent_id();
		if (internship.getDate_started() != null) {
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			String internshipStartDate = sdf.format(internship.getDate_started());
			System.out.println("Internship Start Date = " + internshipStartDate);
		} else {
			System.out.println("Internship Start Date is null");
		}
		User user = (User) session.getAttribute("user");

		String com_name = internship.getCompanyName();
		System.out.println("Company Name = " + com_name);

		User student = userService.getUserById(student_id);

		if (status.equalsIgnoreCase("ongoing")) {

			notif.setMsgBody("Congratulations......! Internship has been started at " + com_name + " ");
			notif.setTitle("Internship");
			notif.setReceiverId(student_id);
			notif.setSenderId(user.getId());
			notificationService.addNotification(notif);
			if (student.getNotificationToken() != null && !student.getNotificationToken().isEmpty()) {
				firebaseService.sendNotification(student.getNotificationToken(), "Internship",
						"Congratulations......! Internship has been started at " + com_name + " ");
			}
		} else if (status.equalsIgnoreCase(ProjectConstants.internships_status_cancelled)) {

			notif.setMsgBody("Sorry..! Internship has been cancelled at " + com_name + " ");
			notif.setTitle("Internship");
			notif.setReceiverId(student_id);
			notif.setSenderId(user.getId());
			notificationService.addNotification(notif);
			if (student.getNotificationToken() != null && !student.getNotificationToken().isEmpty()) {
				firebaseService.sendNotification(student.getNotificationToken(), "Internship",
						"Sorry..! Internship has been cancelled at " + com_name + " ");
			}
		} else if (status.equalsIgnoreCase(ProjectConstants.internships_status_completed)) {

			if (student.getNotificationToken() != null && !student.getNotificationToken().isEmpty()) {
				firebaseService.sendNotification(student.getNotificationToken(), "Internship",
						"Congratulations......🎉🎉! Internship has been Completed at " + com_name
								+ " Please Log in and Download Your Certificate! ");
			}

		}
		internshipService.saveInternship(internship);
		session.setAttribute("currentActiveClass", activeclass);
		return "success";
	}

	public static long getDifferenceDays(Date d1, Date d2) {
		long diff = d2.getTime() - d1.getTime();
		return TimeUnit.DAYS.convert(diff, TimeUnit.MILLISECONDS);
	}

	@PostMapping("/saveFeedbackData")
	public @ResponseBody String savefeedb(
	        @RequestParam(value = "feedbakData", required = false) String fd,
	        @RequestParam("internship_id") Long internship_id,
	        @RequestParam(value = "comments", required = false) String comment,
	        Model model) {
	    System.out.println("Feedback Data: " + fd);
	    System.out.println("Internship ID: " + internship_id);
	    System.out.println("Comments: " + comment);
	    Internships internship = internshipService.getInternship(internship_id);
	    
	    if (fd.equals("SKIP")) {
	    	
		    System.out.println("Skipp Btn");
		        // Directly mark internship as completed
		    ProgressData progressData = new ProgressData();
		        internship.setDate_completed(new Date());
		        internship.setUpdation_date(LocalDate.now());
		        internship.setStatus(ProjectConstants.internships_status_completed);
		        progressData.setComments(comment);
		        progressData.setStatus(ProjectConstants.progress_status_completed);
		        internshipService.saveInternship(internship);
		        internshipFeedbackService.saveProgressData(progressData);

		        // Send completion notification
		        sendCompletionNotification(internship);
		        return "C"; // Completion response
		    }
	   
	   
	    ObjectMapper objectMapper = new ObjectMapper();
	    try {
	        Map<String, String> feedbackMap = objectMapper.readValue(fd, Map.class);
	        System.out.println("Parsed Feedback Data: " + feedbackMap);
	    } catch (JsonProcessingException e) {
	        e.printStackTrace();
	        return "Error processing feedback data!";
	    }
	   
	    ObjectMapper mapper = new ObjectMapper();
	    ProgressData progressData = new ProgressData();
	   
	    // Check if the feedback is skipped
	  
	    try
	    {
	        progressData = mapper.readValue(fd, ProgressData.class);
	    } catch (Exception e) {
	        e.printStackTrace();
	        return "ERROR";
	    }
	    ProgressData progData = internshipFeedbackService.getProgressData(internship_id);

	    if (progData == null) {
	        progressData.setInternship_id(internship_id);
	        progressData.setCreation_date(new java.sql.Date(new Date().getTime()));
	        progressData.setStatus(ProjectConstants.progress_status_ongoing);
//	        if (comment.equals("internsorbit")) {
//	            internshipFeedbackService.saveProgressData(progressData);
//	        } else {
	            progressData.setComments(comment);
	            progressData.setStatus(ProjectConstants.progress_status_completed);
	            internshipFeedbackService.saveProgressData(progressData);
	            internship.setDate_completed(new Date());
	            internship.setUpdation_date(LocalDate.now());
	          //  internship.setStatus(ProjectConstants.internships_status_completed);
	            internshipService.saveInternship(internship);
	        }
	     else {
	        // Append feedback week-wise
	        progData.setParameter_1(progData.getParameter_1() + "," + progressData.getParameter_1());
	        progData.setParameter_2(progData.getParameter_2() + "," + progressData.getParameter_2());
	        progData.setParameter_3(progData.getParameter_3() + "," + progressData.getParameter_3());
	        progData.setParameter_4(progData.getParameter_4() + "," + progressData.getParameter_4());
	        progData.setParameter_5(progData.getParameter_5() + "," + progressData.getParameter_5());
	        progData.setParameter_6(progData.getParameter_6() + "," + progressData.getParameter_6());
	        progData.setParameter_7(progData.getParameter_7() + "," + progressData.getParameter_7());
	        progData.setParameter_8(progData.getParameter_8() + "," + progressData.getParameter_8());
	        progData.setOverall(progData.getOverall() + "," + progressData.getOverall());
	        progData.setUpdation_date(new java.sql.Date(new Date().getTime()));
	        internshipFeedbackService.saveProgressData(progData);
	       
	      
	            progData.setComments(comment);
	            progData.setStatus(ProjectConstants.progress_status_completed);
	            internship.setDate_completed(new Date());
	            internship.setUpdation_date(LocalDate.now());
	           // internship.setStatus(ProjectConstants.internships_status_completed);
	            internshipService.saveInternship(internship);
	            sendCompletionNotification(internship);
	            System.out.println("ttttttttttttttttt"+allWeeksFeedbackCompleted(internship_id));
	    	    // Call the function to check if all weeks' feedback is completed
	    	    if (allWeeksFeedbackCompleted(internship_id)) {
	    	        internship.setStatus(ProjectConstants.internships_status_completed);
	    	        internshipService.saveInternship(internship);
	    	    }
	            return "C"; // Completion response
	       
	    }
	    System.out.println("ttttttttttttttttt"+allWeeksFeedbackCompleted(internship_id));
	    // Call the function to check if all weeks' feedback is completed
	    if (allWeeksFeedbackCompleted(internship_id)) {
	        internship.setStatus(ProjectConstants.internships_status_completed);
	        internshipService.saveInternship(internship);
	    }
	    return "success";
	}

	private boolean allWeeksFeedbackCompleted(Long internship_id) {
	    ProgressData progData = internshipFeedbackService.getProgressData(internship_id);
	   
	    Internships internship = internshipService.getInternship(internship_id);
	   
	    System.out.println("interndndjddddddd"+internship);
	    int internshipDurationInMonths = internship.getDuration(); // Assuming this is part of the internship data
	   
	    long noOfWeeks = internshipDurationInMonths * 4;
	   
	    String[] parameters = {
	        progData.getParameter_1(),
	        progData.getParameter_2(),
	        progData.getParameter_3(),
	        progData.getParameter_4(),
	        progData.getParameter_5(),
	        progData.getParameter_6(),
	        progData.getParameter_7(),
	        progData.getParameter_8(),
	        progData.getOverall()
	    };
	   
	    for (String param : parameters) {
	        String[] weeks = param.split(",");
	        if (weeks.length < noOfWeeks) {
	            return false; // If feedback is missing for any week
	        }
	    }
	    return true; 
	}
	// Helper function to send completion notifications
	private void sendCompletionNotification(Internships internship) {
	    User user = userService.getUserById(internship.getStudent_id());
	    NotificationRequest notif = new NotificationRequest();
	    notif.setMsgBody("Congratulations! You have Completed Internship at " + internship.getCompanyName() + " is completed. Download your certificate now!");
	    notif.setReceiverId(internship.getStudent_id());
	    notif.setSenderId(user.getId());
	    notif.setTitle("Internship Completion Notification");
	    notif.setDateTime(LocalDateTime.now());
	    notif.setDeptId(internship.getColl_dept());
	    notificationService.addNotification(notif);
	    if (user.getNotificationToken() != null && !user.getNotificationToken().isEmpty()) {
	        firebaseService.sendNotification(user.getNotificationToken(), "Internship Completed!", "Download your certificate now.");
	    }
	}
	
	
	@InitBinder
	protected void initBinder(WebDataBinder binder) {
//		SimpleDateFormat dateFormat = new SimpleDateFormat(ProjectConstants.date_format);
//		binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, false));
	}

}
