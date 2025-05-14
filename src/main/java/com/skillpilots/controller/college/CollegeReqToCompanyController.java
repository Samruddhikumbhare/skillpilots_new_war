package com.skillpilots.controller.college;


import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.skillpilots.model.CollDeptLink;
import com.skillpilots.model.College;
import com.skillpilots.model.CollegeInternalRequest;
import com.skillpilots.model.Company;
import com.skillpilots.model.ExternalRequest;
import com.skillpilots.model.Student;
import com.skillpilots.model.Technologies;
import com.skillpilots.model.User;
import com.skillpilots.service.CollDeptService;
import com.skillpilots.service.CollegeInternalRequestService;
import com.skillpilots.service.CollegeService;
import com.skillpilots.service.ComponyService;
import com.skillpilots.service.ExternalRequestService;
import com.skillpilots.service.StudentService;
import com.skillpilots.service.TechnologyService;
import com.skillpilots.service.UserService;
import com.skillpilots.utility.CommonUtil;
import com.skillpilots.utility.MessageConstants;
import com.skillpilots.utility.ProjectConstants;

import jakarta.servlet.http.HttpSession;
import org.apache.commons.lang3.StringUtils;


@Controller
public class CollegeReqToCompanyController {

	
	@Autowired
	private CollegeService collegeService;

	@Autowired
	private HttpSession session;
	@Autowired
	private ComponyService componyService;
	@Autowired
	private CollDeptService collDeptService;
	@Autowired
	private TechnologyService technologyService;
	@Autowired
	private StudentService studentService;
	@Autowired
	private UserService userService;
	@Autowired
	private CollegeInternalRequestService collegeInternalRequestService;
	@Autowired
	private ExternalRequestService externalRequestService;

	@RequestMapping(value = "/college_internal_req", method = RequestMethod.GET)
	public String requestForInternship(Model model) {
		College college = null;
		User user = (User) session.getAttribute("user");
		List<Object[]> internal_reqsList = null;

		System.out.println("role is "+ user.getRole());
		
		List<Company> samecityList = new ArrayList<>();
		List<Company> clist = componyService.findAll();
		List<Technologies> tech_List = technologyService.getAllTechnology();
		//samecityList = new CommonUtil().getCityWiseCompany(college, clist);
		model.addAttribute("com_list", clist);
        if(user.getRole().equals(ProjectConstants.hod)|| user.getRole().equals(ProjectConstants.iii_role3deptIn)) {
		User u = userService.findByEmailAndRoleAndDepartment(user.getRole(), user.getEmailIdCommon(), user.getDepartment());
		 college = collegeService.getCollegeByEmail(u.getEmailIdCommon());
			
				List<Student> studentList=studentService.getStudentsByDept(user.getDepartment(), college.getCollege_id());
				System.out.println("no.of approved students:"+studentList.size());
				model.addAttribute("approve_students", studentList);

				internal_reqsList = collegeInternalRequestService.getAllInternalReqByCollge(college.getCollege_id(),user.getDepartment());
				
				 for (Object[] internalReq : internal_reqsList) {
					    for (Object obj : internalReq) {
					        System.out.print(obj + " ");
					    }
					    System.out.println(); // Print a new line after each object array
					}

      }
     else {
	
	  if (user.getRole().equals(ProjectConstants.tpheadiiicell)) {
	   User u = userService.findByEmailAndRole(user.getRole(), user.getEmailIdCommon());
	    college = collegeService.getCollegeByEmail(u.getEmailIdCommon());
	     }
	  else if(user.getRole().equals(ProjectConstants.college)) {
		System.out.println("rolleee"+user.getRole());
		User u = userService.getUserByemail(user.getEmail());
		college=collegeService.getCollegeByEmail(u.getEmail());
	}
	 internal_reqsList=	collegeInternalRequestService.getAllInternalRequestsbyCollege(college.getCollege_id());
	 System.out.println("internal request"+internal_reqsList);
	 for (Object[] internalReq : internal_reqsList) {
		    for (Object obj : internalReq) {
		        System.out.print(obj + " ");
		    }
		    System.out.println(); // Print a new line after each object array
		}
	
}
		model.addAttribute("technologies", tech_List);
	model.addAttribute("internal_req_Role3", internal_reqsList);
	
		model.addAttribute("coordinator", MessageConstants.request_by_co_ordinator);
		model.addAttribute("self", MessageConstants.request_by_self);
			return "college_internal_req";
		
	}

	
	
	// Send All Interns Group from Role 3
		@RequestMapping(value = "/sendInternsReqFromRole", method = RequestMethod.GET)
		public @ResponseBody String cr_coll_internal_req(@RequestParam List<Long> student_id,
				@RequestParam String company_id, @RequestParam String technology_name, @RequestParam int duration_week,
				@RequestParam String req_msg, @RequestParam(value = "adv_id", required = false) Long adv_id) {
			System.out.println("Advertisement Id:-" + adv_id);
			
			System.out.println(student_id);
			// Convert List<Long> to String
			StringBuilder studentIdsStringBuilder = new StringBuilder();

			for (int i = 0; i < student_id.size(); i++) {
			    studentIdsStringBuilder.append(student_id.get(i));
			    
			    // Add a comma if it's not the last ID
			    if (i < student_id.size() - 1) {
			        studentIdsStringBuilder.append(",");
			    }
			}

			// Set the concatenated string of student IDs to the CollegeInternalRequest
System.out.println(studentIdsStringBuilder.toString());
			// System.out.println("Student list:-"+student_id);
			User user = (User) session.getAttribute("user");
			
			User u = userService.findByEmailAndRoleAndDepartment(user.getRole(), user.getEmailIdCommon(), user.getDepartment());
		College	 college = collegeService.getCollegeByEmail(u.getEmailIdCommon());
			CollDeptLink collDept=collDeptService.getDepartmentLink(user.getId());
			if (company_id != null && student_id != null) {
						
				CollegeInternalRequest collegeInternalRequest = new CollegeInternalRequest();
			
				
				collegeInternalRequest.setUser_id(college.getCollege_id());
				collegeInternalRequest.setCreation_date(new Date());
				collegeInternalRequest.setUpdation_date(new Date());
				collegeInternalRequest.setFor_users(StringUtils.join(student_id, ","));
				collegeInternalRequest.setRequest_msg(req_msg);
				collegeInternalRequest.setTechnology(technology_name);
				collegeInternalRequest.setDuration(duration_week);
				collegeInternalRequest.setFor_company(company_id);
				collegeInternalRequest.setFor_dept(user.getDepartment());

				
				
					collegeInternalRequest.setAdvertisement_id(adv_id);
				
				//Notification
//				Notifications notif2=new Notifications();
//				notif2.setFrom_user(user.getId());
//				notif2.setNotif_code(NotificationConstants.notif_code_new_internship_req_received);
//				notif2.setCategory(NotificationConstants.notif_category_stud_req);
//				String param2[]=new String[3];
//				String param[]=new String[3];
//				param[0]=request_id;
//				param[1]=user.getUsername();
//				param[2]=companyService.getCompanyName(company_id);
//				param2[1]=param[2];
//				Notifications notif=new Notifications();
//				notif.setFrom_user(user.getId());
				if (user.getRole().equals(ProjectConstants.iii_role3deptIn) ) {
					collegeInternalRequest.setExpiration_date(userService.getDateAfterDays(new Date(), ProjectConstants.req_expiration_after_days));
					collegeInternalRequest.setApproval_status(ProjectConstants.coll_internal_req_approval_status_HOD);
//					notif.setUser_id(collDept.getHead_id());
//					
//					param2[0]="Dept Coordinator.";
				}
				if (user.getRole().equals(ProjectConstants.hod) ) {
					collegeInternalRequest.setExpiration_date(userService.getDateAfterDays(new Date(), ProjectConstants.req_expiration_after_five_days));
					collegeInternalRequest.setApproval_status(ProjectConstants.coll_internal_req_approval_status_III);
//					notif.setUser_id(userService.getHRorIIIHead(user.getInstitute_id()).getUser_id());
//					param2[0]="HOD";
				}
				collegeInternalRequestService.saveInternalReq(collegeInternalRequest);
				
//				notif.setNotif_code(NotificationConstants.notif_code_new_intership_req_made);
//				notif.setCategory(NotificationConstants.notif_category_clg_comp_internal_req);
//				notificationsService.crNotifForUser(notif, param);
//				
//				if(student_id.contains(",")){
//					String sid[]=student_id.split(",");
//					for(int i=0;i<sid.length;i++){
//						notif2.setUser_id(sid[i]);
//						notificationsService.crNotifForUser(notif2, param2);
//					}
//				}else{
//					notif2.setUser_id(student_id);
//					notificationsService.crNotifForUser(notif2, param2);
//				}
				return "sucess";
			} else {
				return "error";
			}

		}

	// Approve/Reject Request By Role1 and role2
		@RequestMapping(value = "/approveInternsRequestByRole")
		public @ResponseBody String ApprByRole(@RequestParam Long req_id) {
			User user = (User) session.getAttribute("user");
			CollegeInternalRequest collegeInternalRequest = collegeInternalRequestService.getInternalRequest(req_id);
			if (user != null) {
			
				String status = null;
				System.out.println("dihdihih"+req_id);
				
				
				System.out.println(collegeInternalRequest);
				collegeInternalRequest.setUpdation_date(new Date());
				
				if (user.getRole().equals(ProjectConstants.hod)) {
					System.out.println(collegeInternalRequest.getRequest_id()+"    "+req_id);
					collegeInternalRequest.setExpiration_date(userService.getDateAfterDays(new Date(), ProjectConstants.req_expiration_after_five_days));
					collegeInternalRequest.setApproval_status(ProjectConstants.coll_internal_req_approval_status_III);
					collegeInternalRequestService.saveInternalReq(collegeInternalRequest);
					status = "success";
					
					//Notification
//					Notifications notif=new Notifications();
//					notif.setFrom_user(user.getUser_id());
//					notif.setCategory(NotificationConstants.notif_category_clg_comp_internal_req);
//					//collDept will not be null since HOD was able to login hence not expired
//					CollDeptLink collDept=collegeService.getDepartmentByDept_id(collegeInternalRequest.getFor_dept(),
//							collegeInternalRequest.getUser_id());
//					if(null!=collDept.getIii_dept_co_id()){
//						String param[]=new String[2];
//						param[0]=req_id;
//						param[1]=companyService.getCompanyName(collegeInternalRequest.getFor_company());
//						notif.setUser_id(collDept.getIii_dept_co_id());
//						notif.setNotif_code(NotificationConstants.notif_code_req_approved_by_hod);
//						System.out.println(notif.getUser_id()+"  "+notif.getNotif_code()+"   "+notif.getCategory());
//						notificationsService.crNotifForUser(notif, param);
//					}
				}
				
				else {
					College college=null;
					if(user.getRole().equals(ProjectConstants.tpheadiiicell)) {
						User u = userService.findByEmailAndRole(user.getRole(), user.getEmailIdCommon());
							 college = collegeService.getCollegeByEmail(u.getEmailIdCommon());
					}
					else {
						User u = userService.getUserByemail(user.getEmail());
						college=collegeService.getCollegeByEmail(u.getEmail());
					}
				
				System.out.println("college is "+college);
					int no_of_ext_req_stud_pending = 0,current_stud_count = collegeInternalRequest.getFor_users().split(",").length;
					
					//List<String> pending_student_req = external_reqService.getAppliedStudentCountByCollege(institute_id,collegeInternalRequest.getFor_dept());
					//no_of_ext_req_stud_pending += pending_student_req.size();
					
//					CollDeptLink collDept=collDeptService.getDepartmentByDept_id(collegeInternalRequest.getUser_id(),collegeInternalRequest.getFor_dept(),
//						ProjectConstants.coll_dept_link_status_active, new Date());
//					System.out.println("hdhdhdhdh"+collDept);
					
//					if (((no_of_ext_req_stud_pending + current_stud_count) - balanceDataCollege.getNo_of_internships())
//							<= ProjectConstants.internship_request_limit)  check after package done
					
					ExternalRequest externalRequest= new ExternalRequest();
				
					
					externalRequest.setFrom_user_id(college.getCollege_id());
		    		externalRequest.setFor_user_id(collegeInternalRequest.getFor_company());
		    		externalRequest.setCreation_date(new Date());
		    		externalRequest.setExpiration_date(userService.getDateAfterDays(new Date(), ProjectConstants.req_expiration_after_days));
		    		externalRequest.setApproval_status(ProjectConstants.external_req_approval_status_pending);
		    		externalRequest.setStudent_ids(collegeInternalRequest.getFor_users());
		    		externalRequest.setDuration(collegeInternalRequest.getDuration());
		    		externalRequest.setTechnology(collegeInternalRequest.getTechnology());
		    		externalRequest.setRequest_msg(collegeInternalRequest.getRequest_msg());
		    		externalRequest.setAdvertisement_id(collegeInternalRequest.getAdvertisement_id());
		    		externalRequest.setCompany_id(Long.parseLong(collegeInternalRequest.getFor_company()));
		    		ExternalRequest external_req=externalRequestService.saveExternalRequest(externalRequest);
					
		    		collegeInternalRequest.setApproval_status(ProjectConstants.coll_internal_req_approval_status_approved);
		    		collegeInternalRequest.setAgainst_ext_req(external_req.getRequest_id());
		    		collegeInternalRequestService.saveInternalReq(collegeInternalRequest);
					
					status = "success";
				}
		
			}
			return "success";}


		@RequestMapping(value = "/internsgroupIds")
		public @ResponseBody List<Student> internsReqGroup(@RequestParam String studentids) {
		    List<Student> studentList = new ArrayList<>();

		    if (studentids != null && !studentids.isEmpty()) {
		        String[] ids = studentids.split(",");
		        for (String id : ids) {
		            long studentId;
		            try {
		                studentId = Long.parseLong(id.trim());
		            } catch (NumberFormatException e) {
		                // Handle invalid ID format
		                continue;
		            }
		            Student st = studentService.getSpecificStudent(studentId);
		            if (st != null) {
		                studentList.add(st);
		            }
		        }
		    }

		    return studentList;
		}

	
	// get Rejection Reason
	@RequestMapping(value = "/reject_clg_internal_req")
	public @ResponseBody String sendRequest(@RequestParam Long req_id, @RequestParam String rejection_msg) {
		User user = (User) session.getAttribute("user");
		if (user != null) {
			CollegeInternalRequest collegeInternalRequest = collegeInternalRequestService.getInternalRequest(req_id);
			collegeInternalRequest.setRejection_msg(rejection_msg);
			collegeInternalRequest.setUpdation_date(new Date());
			collegeInternalRequest.setLast_status(collegeInternalRequest.getApproval_status());
			collegeInternalRequest.setApproval_status(ProjectConstants.coll_internal_req_approval_status_rejected);
			collegeInternalRequestService.saveInternalReq(collegeInternalRequest);
//			CollDeptLink collDept=collegeService.getDepartmentByDept_id(collegeInternalRequest.getFor_dept(),
//					collegeInternalRequest.getUser_id());
//			
//			//Notification for HOD/coordinator
//			Notifications notif=new Notifications();
//			String param[]=new String[2];
//			param[0]=req_id;
//			if(role==1){
//				param[1]="T&P Officer";
//				notif.setUser_id(collDept.getHead_id());
//			}else if(role==2){
//				param[1]="HOD";
//				notif.setUser_id(collDept.getIii_dept_co_id());
//			}
//			notif.setFrom_user(user.getUser_id());
//			notif.setNotif_code(NotificationConstants.notif_code_internal_req_cancelled);
//			notif.setCategory(NotificationConstants.notif_category_clg_comp_internal_req);
//			notificationsService.crNotifForUser(notif, param);
			
			//notification for student
//			param[0]=companyService.getCompanyName(collegeInternalRequest.getFor_company());
//			notif.setFrom_user(user.getUser_id());
//			notif.setNotif_code(NotificationConstants.notif_code_internal_req_rejected);
//			notif.setCategory(NotificationConstants.notif_category_stud_req);
//			String[] sids=collegeInternalRequest.getFor_users().split(",");
//			for(int i=0;i<sids.length;i++){
//				notif.setUser_id(sids[i]);
//				notificationsService.crNotifForUser(notif, param);
//				}
			return "success";
		}else{
			return "redirect:logout";
		}
	}

	
	// get Rejection Reason
		@RequestMapping(value = "/rejectionReason", method = RequestMethod.GET)
		public @ResponseBody String getRejectionReason(@RequestParam Long request_id) {
			CollegeInternalRequest coll_i_req = collegeInternalRequestService.getInternalRequest(request_id);
			return coll_i_req.getRejection_msg();
		}
	// college sent intern grp to company :- status of grp
	@RequestMapping(value = "/external_internship_request_college", method = RequestMethod.GET)
	public String getExternalReq_college(Model model) {
		User user = (User) session.getAttribute("user");
College college=null;
		if (user != null) {

			if(user.getRole().equals(ProjectConstants.college)) {
				college=	collegeService.getCollegeByEmail(user.getEmail());
				
			}else if(user.getRole().equals(ProjectConstants.tpheadiiicell)) {
				User u = userService.findByEmailAndRole(user.getRole(), user.getEmailIdCommon());
				college=	collegeService.getCollegeByEmail(u.getEmailIdCommon());

					
				}
		    
			List<Object[]> list = externalRequestService.getExternal_reqs(college.getCollege_id(),new Date());
			model.addAttribute("external_request", list);
			return "external_internship_request_college";
		} else {
			return "redirect:logout";
		}
		
	}

	// Cancled Request by College (Role-1)
	@RequestMapping(value = "/cancledInternsRequest", method = RequestMethod.GET)
	public @ResponseBody String cancledReq(@RequestParam Long request_id) {
		User user = (User) session.getAttribute("user");
		College college=null;
		if(user.getRole().equals(ProjectConstants.college)) {
			college=	collegeService.getCollegeByEmail(user.getEmail());
			
		}else if(user.getRole().equals(ProjectConstants.tpheadiiicell)) {
			User u = userService.findByEmailAndRole(user.getRole(), user.getEmailIdCommon());
			college=	collegeService.getCollegeByEmail(u.getEmailIdCommon());

				
			}
		
		//String inst_id = session.getAttribute("institute_id").toString();
		ExternalRequest external_req = externalRequestService.getExternalRequest(college.getCollege_id(), request_id);
		external_req.setApproval_status(ProjectConstants.external_req_approval_status_cancelled);
		external_req.setUpdation_date(new Date());
		externalRequestService.saveExternalRequest(external_req);
//		String param[] = new String[2];
//		if(external_req.getFor_user_id().startsWith(ProjectConstants.user_initials_company))
//			param[0] = companyService.getCompanyName(external_req.getFor_user_id());
//		else
//			param[0] = companyService.getCompanyName(external_req.getFrom_user_id());
//		param[1] = "T&P";
//		
//		Notifications studNotif = new Notifications();
//		studNotif.setFrom_user(user.getUser_id());
//		studNotif.setNotif_code(NotificationConstants.notif_code_external_req_cancelled);
//		studNotif.setCategory(NotificationConstants.notif_category_stud_req);
//		String stud_grp[] = external_req.getStudent_ids().split(",");
//		for(String student_id:stud_grp) {
//			studNotif.setUser_id(student_id);
//			notificationsService.crNotifForUser(studNotif, param);
//		}
		return "Sucess";

		
		//return "Sucess";
	}
	
	
	@PostMapping("/editInternalRequestMessage")
	public String editMessage(@RequestParam("internalReqId")Long internalReqId,@RequestParam("requestMessage")String requestMessage){
		System.out.println(internalReqId+"  "+requestMessage);
		collegeInternalRequestService.updateRequestMessage(requestMessage, internalReqId);
		return "redirect:college_internal_req";
		
	}
	@RequestMapping(value="/editExtRequestMessage",method=RequestMethod.POST)
	public String editExternalReqMessage(){
	
		return "redirect:external_internship_request_college";
	}
}
