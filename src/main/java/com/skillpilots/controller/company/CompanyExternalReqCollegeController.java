package com.skillpilots.controller.company;

import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.skillpilots.Dto.TeamDto;
import com.skillpilots.model.BalanceData;
import com.skillpilots.model.CollDeptLink;
import com.skillpilots.model.CompDeptLink;
import com.skillpilots.model.Company;
import com.skillpilots.model.CompanyInternalRequest;
import com.skillpilots.model.CompanyTest;
import com.skillpilots.model.ExternalRequest;
import com.skillpilots.model.NotificationRequest;
import com.skillpilots.model.Student;
import com.skillpilots.model.StudentRequest;
import com.skillpilots.model.StudentTestData;
import com.skillpilots.model.User;
import com.skillpilots.repository.NotificationRepository;
import com.skillpilots.service.BalanceDataService;
import com.skillpilots.service.CollegeService;
import com.skillpilots.service.CompDeptService;
import com.skillpilots.service.CompTestService;
import com.skillpilots.service.CompanyInternalRequestService;
import com.skillpilots.service.ComponyService;
import com.skillpilots.service.ExternalRequestService;
import com.skillpilots.service.StudentRequestService;
import com.skillpilots.service.StudentService;
import com.skillpilots.service.StudentTestDataService;
import com.skillpilots.service.UserService;
import com.skillpilots.utility.FirebaseService;
import com.skillpilots.utility.MessageConstants;
import com.skillpilots.utility.ProjectConstants;

import jakarta.servlet.http.HttpSession;

@Controller
public class CompanyExternalReqCollegeController {
	
	@Autowired
	private HttpSession session;
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private StudentRequestService studentRequestService;
	
	@Autowired
	private CompDeptService compDeptService;
	@Autowired
	private CollegeService collegeService;
	@Autowired
	private CompanyInternalRequestService companyInternalRequestService;
	@Autowired
	private CompTestService compTestService;
	@Autowired
	private StudentService studentService;
	@Autowired
	private StudentTestDataService studentTestDataService;
	@Autowired
	private ExternalRequestService externalRequestService;
	@Autowired
	private ComponyService componyService;
	@Autowired
	private BalanceDataService balanceDataService;
	@Autowired
	private FirebaseService firebaseService;
	@Autowired
	private NotificationRepository notificationRepository;
	
	@GetMapping("/external_internship_request_company")
	public String comp_internal_req(Model model) {
	    User user = (User) session.getAttribute("user");

	    if (user != null) {
	    	  Company company =null;
	            if (user.getRole().equals(ProjectConstants.company)) {
	            	company	= componyService.getCompanyById(user.getEmail());
	            	System.out.println("Companyksssssssssssssssss"+company);
	            }
	            else if (user.getRole().equals(ProjectConstants.hr)) {
	            	User u = userService.findByEmailAndRole(user.getRole(), user.getEmailIdCommon());
	            	company	= componyService.getCompanyById(u.getEmailIdCommon());
	            }
	            List<Object[]> external_req = externalRequestService.getExternal_req(company.getCompany_id(), new Date());

	            HashMap<Long, String> externalInstitutePendigMap = new HashMap<>();

	            System.out.println("external request are" + external_req);
	            for (Object[] objects : external_req) {
	                // Parse the request ID to Long
	                Long requestId = Long.parseLong(objects[0].toString());

	                // Check if the approval status at index 5 equals 'test_assigned'
	                if (objects[5].toString().equals(ProjectConstants.external_req_approval_status_test_assigned)) {
	                    // Retrieve student test data with pending status based on the request ID
	                    List<StudentTestData> studTestDataByReqId = studentTestDataService
	                            .getStudPenStatusTestDataByReqId(requestId);

	                    System.out.println(studTestDataByReqId.size());

	                    System.out.println(objects[4].toString().split(",").length);
	                    // Compare the length of the split array with the size of retrieved student test data
	                    if (objects[4].toString().split(",").length == studTestDataByReqId.size()) {
	                        // If lengths are equal, put 'pending' status in the map
	                        externalInstitutePendigMap.put(requestId, ProjectConstants.student_test_data_status_pending);
	                    } else {
	                        // If lengths are not equal, put 'AP' (assuming it represents a different status) in the map
	                        externalInstitutePendigMap.put(requestId, "AP");
	                    }
	                }
	            }

	            if (external_req.isEmpty()) {
	                model.addAttribute("empty_external_req", MessageConstants.empty_external_internship_request);
	            }

	            System.out.println("mappp" + externalInstitutePendigMap);
	            model.addAttribute("assigned_status", externalInstitutePendigMap);
	            List<TeamDto> compDeptLink = compDeptService.getTeams(user.getId());
				model.addAttribute("compDeptLink", compDeptLink);
				System.out.println("CompDept"+compDeptLink);
	            model.addAttribute("external_requests", external_req);
	            List<Map<String, Object>> allStudentRequest = studentRequestService.getStudentRequests(company.getCompany_id(),
						new Date());
//		            for(Object[] obj:allStudentRequest ) {
//		            	for(Object o: obj) {
//		            		System.out.println(o);
//		            		
//		            	}
//		            	
//		            }
	      
	         //   Collections.reverse(allStudentRequest);

	            model.addAttribute("studentRequestList", allStudentRequest);
	          System.out.println("studentRequestList"+ allStudentRequest);
	            
	            List<TeamDto> listDept_name = compDeptService.getAllDept(company.getCompany_id(), ProjectConstants.coll_dept_link_status_active);
	            model.addAttribute("listDept_name", listDept_name);
	            System.out.println("listDept_name"+listDept_name);
	            System.out.println("Companyt Id "+ company.getCompany_id());
	            List<CompanyTest> compTestList = compTestService.getCompanyTestData_by_status1(company.getCompany_id(),ProjectConstants.company_test_status_active);
	            model.addAttribute("compTestList", compTestList);
	            System.out.println("company Test"+compTestList);
	            return "external_internship_request_company";
	        } 
	        
	   
	        else {
	        	return "redirect:logout";
	        }
	
	} 
	    
	

	@RequestMapping(value = "/ext_req_status_change")
	public String companyReq(@RequestParam String status, @RequestParam Long req_id,
			@RequestParam(required = false) String reject_msg,
			@RequestParam(value = "stud_list", required = false) String stud_list,String stIdPending) {
		ExternalRequest request = new ExternalRequest();
		
		request = externalRequestService.getExternalRequestByERid(req_id);

		request.setApproval_status(status);
		request.setUpdation_date(new Date());
		externalRequestService.saveExternalRequest(request);

		StudentTestData studTestDataAgainstReq;
		

		if (null != stud_list && !stud_list.isEmpty()) {
		    String[] split = stud_list.split(",");
		    for (int i = 0; i < split.length; i++) {
		        long studentId = Long.parseLong(split[i]);
		        studTestDataAgainstReq = studentTestDataService.getStudTestDataAgainstReq(req_id, studentId);
		        if (studTestDataAgainstReq.getStatus().equals(ProjectConstants.student_test_data_status_pending)) {
		            studTestDataAgainstReq.setExpiration_date(userService.yesterday());
		            studTestDataAgainstReq.setUpdation_date(new Date());
		            studentTestDataService.saveStudTestData(studTestDataAgainstReq);
		        }
		    }
		}


		//this code set Expiration date in student test data 
		if (null != stIdPending && !stIdPending.isEmpty()) {
		    if (stIdPending.contains(",")) {
		        String[] stIdsPending = stIdPending.split(",");
		        for (int i = 0; i < stIdsPending.length; i++) {
		            long studentId = Long.parseLong(stIdsPending[i]);
		            studTestDataAgainstReq = studentTestDataService.getStudTestDataAgainstReq(req_id, studentId);
		            studTestDataAgainstReq.setExpiration_date(userService.yesterday());
		            studTestDataAgainstReq.setUpdation_date(new Date());
		            studentTestDataService.saveStudTestData(studTestDataAgainstReq);
		        }
		    } else {
		        long studentId = Long.parseLong(stIdPending);
		        studTestDataAgainstReq = studentTestDataService.getStudTestDataAgainstReq(req_id, studentId);
		        studTestDataAgainstReq.setExpiration_date(userService.yesterday());
		        studTestDataAgainstReq.setUpdation_date(new Date());
		        studentTestDataService.saveStudTestData(studTestDataAgainstReq);
		    }
		}
				return "redirect:external_internship_request_company";
	}


	@RequestMapping("/undoExtReqRejection")
	public @ResponseBody String undoExtReqRejection(@RequestParam("request_id") String request_id) {
		
		return "success";
	}

	@GetMapping("/checkAvailabiltyOfInterns")
	public @ResponseBody Map<String, String> checkAvailabiltyOfInterns(@RequestParam Long request_id) {
	    User user = (User) session.getAttribute("user");
	    Map<String, String> response = new HashMap<>();
	    Company company=null;
	    if (user != null) {
	    	System.out.println("user"+user);
	        String status = null;
	        if (user.getRole().equals(ProjectConstants.company)) {
	            company = componyService.getCompanyById(user.getEmail());
	        } else if (user.getRole().equals(ProjectConstants.hr)) {
	            User hrUser = userService.findByEmailAndRole(user.getRole(), user.getEmailIdCommon());
	            
	                company = componyService.getCompanyById(hrUser.getEmailIdCommon());
	            
	        }	        BalanceData balanceDataCompany = balanceDataService.getBalanceDataByCompany(company.getCompany_id(),"Compony");

	        if (balanceDataCompany != null) {
	            ExternalRequest extReq = externalRequestService.getExternalRequestByERid(request_id);
	            String count_of_group[] = extReq.getStudent_ids().split(",");

	            for (String id : count_of_group) {
	                System.out.println(id);
	            }

	            Long studentId = Long.parseLong(count_of_group[0]);
	            System.out.println("Student id"+studentId);

	            if (balanceDataCompany.getNo_of_internships() >= count_of_group.length) {
	                User student = userService.getUserById(studentId);
	                Student studentdata = studentService.getSpecificStudent(student.getId());

	                CollDeptLink balance_data_id_for_clg = collegeService.getBalanceDataId((long) student.getCollege_id(),
	                        Long.parseLong(studentdata.getDept()),new Date());
	                	System.out.println("id balance data"+balance_data_id_for_clg);
	                if (balance_data_id_for_clg != null) {
	                    BalanceData balanceDataCollege = balanceDataService.getBalanceData(balance_data_id_for_clg.getBalance_data_id());
	                    
	                    if (balanceDataCollege.getNo_of_internships() >= count_of_group.length) {
	                        balanceDataCollege.setNo_of_internships(balanceDataCollege.getNo_of_internships() - count_of_group.length);
	                        balanceDataCollege.setUpdation_date(new Date());
	                        response.put("collegeBalanceId", String.valueOf(balanceDataCollege.getBalance_data_id()));
	                        balanceDataService.saveBalance(balanceDataCollege);
	                        
	                        balanceDataCompany.setNo_of_internships(balanceDataCompany.getNo_of_internships() - count_of_group.length);
	                        balanceDataCompany.setUpdation_date(new Date());
	                        response.put("companyBalanceId", String.valueOf(balanceDataCompany.getBalance_data_id()));
	                        balanceDataService.saveBalance(balanceDataCompany);
	                        
	                        status = "success";
	                    } else {
	                        status = "recharge_col";
	                    }
	                } else {
	                    status = "recharge_col";
	                }
	            } else {
	                status = "Insufficient Balance";
	            }
	        }
	        response.put("status", status);
	        return response;
	    } else {
	        return null;
	    }
	}


	

	@RequestMapping("/assignCompTeamToStudent")
	public @ResponseBody String assignTeamToStudent(@RequestParam("request_id") Long requestId,
	        @RequestParam("team_name") String teamName, @RequestParam("duration") int duration,
	        @RequestParam("technology") String technology) {
	    User user = (User) session.getAttribute("user");

	    // Null checks for input parameters
	    if (teamName == null || teamName.trim().isEmpty()) {
	        return "err_team";
	    } else if (duration < 1) {
	        return "err_duration";
	    } else if (technology == null || technology.trim().isEmpty()) {
	        return "err_tech";
	    }

	    // Retrieving company based on user role
	    Company company = null;
	    if (user != null) {
	        if (user.getRole().equals(ProjectConstants.company)) {
	            company = componyService.getCompanyById(user.getEmail());
	        } else if (user.getRole().equals(ProjectConstants.hr)) {
	            User hrUser = userService.findByEmailAndRole(user.getRole(), user.getEmailIdCommon());
	            if (hrUser != null) {
	                company = componyService.getCompanyById(hrUser.getEmailIdCommon());
	            }
	        }
	    }

	    if (company == null) {
	        // Handle case where company is not found
	        return "err_company";
	    }

	    // Retrieving student request and balance data for the company
	    StudentRequest studentRequest = studentRequestService.getStudentRequest(requestId);
	    BalanceData balanceDataCompany = balanceDataService.getBalanceDataByCompany(company.getCompany_id(),"Compony");
	    System.out.println("company id "+ company.getCompany_id() +" "+balanceDataCompany );
	    if (balanceDataCompany == null || balanceDataCompany.getNo_of_internships() < 1) {
	        // Handle insufficient balance for company
			return MessageConstants.interncoins_exhausted_temp;
	    }
        Student studentdata = studentService.getSpecificStudent(studentRequest.getStudent_id());
       System.out.println("Student data "+studentdata);
 	    // Retrieving college and balance data for the college
       User user_student = userService.getUserById(studentRequest.getStudent_id());

       
       long collegeId = (long) user_student.getCollege_id();
       System.out.println("College id + "+ collegeId);
       if ( collegeId != 0) {
         CollDeptLink balanceDataIdForCollege = collegeService.getBalanceDataId((long)user_student.getCollege_id(),
         Long.parseLong(studentdata.getDept()), new Date());

	    System.out.println("College dept"+balanceDataIdForCollege);
	    
	    
	    if (balanceDataIdForCollege != null) {
	        BalanceData balanceDataCollege = balanceDataService
	                .getBalanceData(balanceDataIdForCollege.getBalance_data_id());
	        System.out.println("shsysnshsy"+balanceDataCollege);
	        balanceDataCollege.setNo_of_internships(balanceDataCollege.getNo_of_internships() - 1);
		    balanceDataCollege.setUpdation_date(new Date());
		    balanceDataService.saveBalance(balanceDataCollege);
	        if ( balanceDataCollege.getNo_of_internships() < 1) {
	            // Handle insufficient balance for college
				return MessageConstants.interncoins_exhausted_college;
	        }
	    } else {
	        // Handle case where balance data for college is not found
			return MessageConstants.interncoins_exhausted_college;
	    }

	   

	    BalanceData balanceDataCollege = balanceDataService
	            .getBalanceData(balanceDataIdForCollege.getBalance_data_id());
	   
}


// Updating balances
	balanceDataCompany.setNo_of_internships(balanceDataCompany.getNo_of_internships() - 1);
	balanceDataCompany.setUpdation_date(new Date());
	balanceDataService.saveBalance(balanceDataCompany);

	    // Creating company internal request
	    CompanyInternalRequest compInternalRequest = new CompanyInternalRequest();
	    compInternalRequest.setAgainst_ext_req(requestId);
	    compInternalRequest.setApproval_status(ProjectConstants.comp_internal_req_approval_status_manager);
	    compInternalRequest.setCreation_date(new Date());
	    compInternalRequest.setDuration(duration);
	    compInternalRequest.setFor_college(collegeId);
	    compInternalRequest.setFor_team(teamName);
	    compInternalRequest.setRequest_msg(studentRequest.getRequest_msg());
	    compInternalRequest.setTechnology(technology);
	    compInternalRequest.setAdvertisement_id(studentRequest.getAdvertisement_id());
	    compInternalRequest.setFor_users(String.valueOf(studentRequest.getStudent_id()));
	    compInternalRequest.setUser_id(studentRequest.getCompany_id());
	    compInternalRequest.setExpiration_date(
	            userService.getDateAfterDays(new Date(), ProjectConstants.req_expiration_after_days));
	   // compInternalRequest.setComp_balance_id(balanceDataCollege.getBalance_data_id());
	    compInternalRequest.setCompany_id(company.getCompany_id());
	    companyInternalRequestService.saveCompanyInternalRequest(compInternalRequest);

	    // Updating student request
	    studentRequest.setTechnology_name(technology);
	    studentRequest.setApproval_status(ProjectConstants.student_req_approval_status_team_assigned);
	    studentRequest.setUpdation_date(new Date());
	    studentRequestService.saveRequest(studentRequest);
	    
	    NotificationRequest notificationRequest = new NotificationRequest();
	    
	    notificationRequest.setMsgBody("Congratualations..Team assigned successfully.");
	    notificationRequest.setReceiverId(studentRequest.getStudent_id());
	    notificationRequest.setTitle("Team Assigned");
	    notificationRequest.setDateTime(LocalDateTime.now());
	    notificationRepository.save(notificationRequest);
	    if(user_student.getNotificationToken()!=null && !user_student.getNotificationToken().isEmpty()) {
	        firebaseService.sendNotification(user_student.getNotificationToken(), "Congratualations..!", "Team assigned successfully.");

	    }

	    return MessageConstants.team_assigned_to_student;
	}


	@PostMapping("/approve")
    public StudentRequest approveStudentRequest(@RequestParam Long request_id) {
      
        
        if (request_id == null) {
            throw new IllegalArgumentException("Request ID cannot be null");
        }
        
        
        StudentRequest approveStudentRequest = studentRequestService.approveStudentRequest(request_id);
        approveStudentRequest.setApproval_status("A");
        approveStudentRequest.setUpdation_date(new Date());
        User user = userService.getUserById(approveStudentRequest.getStudent_id());
        String mail_body = "<h1 style=\"font-size:55px;margin:20px;text-align:center\"> <span style=\"color:#1974c3;\">Skill<span style=\"color:#01af36;\">Pilots</span> </h1>"
                + "<p style=\"text-align:center\">Dear <strong style=\"color:#414ea4\">" + user.getUsername() + "</strong><br>"
                + "We are pleased to inform you that your internship request has been <strong style=\"color:#01af36;\">approved</strong> with <strong style=\"color:#414ea4\"><a href=\"http://www.skillpilots.com\" style=\"color:#414ea4; text-decoration:none;\">SkillPilots</a></strong>!<br>"
                + "Please log in to your account and check the details of your internship opportunity:</p>"
                + "<ul style=\"text-align:center; list-style-type:none; padding:0;\">"
                + "</ul>"
                + "<p style=\"text-align:center\">We encourage you to complete all necessary steps to ensure a smooth onboarding process.<br>"
                + "If you have any questions, feel free to reach out to us at <strong style=\"color:#414ea4\"><a href=\"http://www.skillpilots.com\" style=\"color:#414ea4; text-decoration:none;\">SkillPilots</a></strong>.<br>"
                + "Best of luck with your internship!</p>"
                + ProjectConstants.mail_footer;
        userService.sendVerificationEmail(user.getEmail(), "Internship Request Update", mail_body);
        if(user.getNotificationToken()!=null && !user.getNotificationToken().isEmpty()) {
	        firebaseService.sendNotification(user.getNotificationToken(), "Request Approved", "Your Internship request has been approved by Company.");

	    }
        
        
        return studentRequestService.saveRequest(approveStudentRequest);
    }
	
	@RequestMapping("/getAssignedTestName")
	public @ResponseBody ArrayList<Long> getAssignedTestName(@RequestParam("request_id") Long request_id) {
		
		List<StudentTestData> studTestDataByReqId = studentTestDataService.getStudPenStatusTestDataByReqId(request_id);
		StudentTestData studentTestData = studTestDataByReqId.get(0);
		ArrayList<Long> response = new ArrayList<>();
		response.add(studentTestData.getTest_id());
		return response;
	}
}
	

