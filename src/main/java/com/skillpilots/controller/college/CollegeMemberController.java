package com.skillpilots.controller.college;





import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.skillpilots.Dto.CollDeptLinkDto;
import com.skillpilots.model.BalanceData;
import com.skillpilots.model.CollDeptLink;
import com.skillpilots.model.College;
import com.skillpilots.model.Company;
import com.skillpilots.model.Department;
import com.skillpilots.model.User;
import com.skillpilots.service.BalanceDataService;
import com.skillpilots.service.CollDeptService;
import com.skillpilots.service.CollegeService;
import com.skillpilots.service.ComponyService;
import com.skillpilots.service.DepartmentService;
import com.skillpilots.service.UserService;
import com.skillpilots.utility.ProjectConstants;

import jakarta.servlet.http.HttpSession;


@Controller
public class CollegeMemberController {

@Autowired
private UserService userService;
@Autowired
private CollDeptService collDeptService;

@Autowired
private DepartmentService departmentService;
@Autowired
private ComponyService componyService;
@Autowired
private CollegeService collegeService;
@Autowired
private BalanceDataService balanceDataService;

@Autowired
private HttpSession session;
	@RequestMapping(value = "/college_dept", method = RequestMethod.GET)
	public String addCollegeMember(Model model) {
		User user2 = (User) session.getAttribute("user");
		
		College college=null;
		Long commaonId = (user2 != null && user2.getCommonId() != null) ? user2.getCommonId() : user2.getInstituteId();
		List<User> data = userService.findAllByCommanId(commaonId);
		
		List<User> deptLead = userService.findAllByCommanIddeptLead(commaonId);
		
		List<Department> department = departmentService.getAllDepartment();
		List<CollDeptLinkDto> collDeptlist=null;
		if(user2.getRole().equals("5")) {
			college=	collegeService.getCollegeByEmail(user2.getEmail());
		 collDeptlist = collDeptService.getAllColl_Dept_Link(college.getCollege_id(), ProjectConstants.coll_dept_link_status_active);
		 System.out.println("department List 1  "+collDeptlist);
		 model.addAttribute("collegeId", college.getCollege_id());
		 model.addAttribute("collDeptLinkList", collDeptlist);
		 model.addAttribute("moduleHeading", "Departmental HOD");
		}else if(user2.getRole().equals("6")) {
			User colleges = userService.findByEmailAndRole(user2.getRole(), user2.getEmailIdCommon());
			college=	collegeService.getCollegeByEmail(colleges.getEmailIdCommon());
			
			System.out.println("college   shshsh "+college);
			 collDeptlist = collDeptService.getAllColl_Dept_Link(college.getCollege_id(), ProjectConstants.coll_dept_link_status_active);
			 model.addAttribute("moduleHeading", "Departmental Hod");
			 model.addAttribute("collDeptLinkList", collDeptlist);
			 System.out.println("department List 2  "+collDeptlist);
			 model.addAttribute("collegeId", college.getCollege_id());

			 for (CollDeptLinkDto collDeptLink : collDeptlist) {
				    System.out.println(collDeptLink); // Assuming you have overridden toString() method in CollDeptLink class
				}
		}
		else {
		collDeptlist = collDeptService.getDeptLink(user2.getId(), ProjectConstants.coll_dept_link_status_active);
		System.out.println("djhdjhdhdhdhd"+collDeptlist);
		 model.addAttribute("collDeptLinkList", collDeptlist);
		model.addAttribute("moduleHeading", "Departmental Co-ordinator");
		model.addAttribute("collDeptLinkList", collDeptlist);
		
		}
	
		model.addAttribute("departments", department);
		

        model.addAttribute("dataList", data);
        model.addAttribute("deptLeads", deptLead);
			return "college_member";
		 
	}

	@RequestMapping(value = "/college_dept", method = RequestMethod.POST)
	public String save_Member(User user,@RequestParam(value = "dept_id", required = false) Long dept_id  ,@RequestParam(value = "collDeptLinkId", required = false) Long collDeptLinkId) {
		
		
		College college=null;
		User user1 = (User) session.getAttribute("user");
		String password = UUID.randomUUID().toString().substring(0, 5);
		password = password.replaceAll("\\s", "");
		String body =  "<h1 style=\"font-size:55px;margin:20px;text-align:center\">Welcome to <span style=\"color:#1974c3;\">Skill<span style=\"color:#01af36;\">Pilots</span> </h1>"
				+ "Your login has been created by your institute's III/T&P Head - " + user.getUsername() + "."
				+ "<p style=\"text-align:center\"> Here is your temporary password - <strong>" + password
				+ "</strong><br>" + "Click <a href='https://www.skillpilots.com/login_check'><strong>here</strong></a> to Login.<br>"

				+ "You'll be asked to change your password for security reasons.<br><br>"
				+ "Thanks & Regards,<br>SkillPIlots Team</p>"
				+ "<p style=\"text-align:justify;font-size:12px;\">Note:This is a system generated mail, please do not reply to it. This mailbox isn't being monitored.<br>"
				+ "The information contained in this e-mail and/or attachments to it contain confidential or privileged information."
				+ "If you are not the intended recipient, any dissemination, use, review, distribution, printing or copying of the"
				+ " information contained in this e-mail message and/or attachments to it are strictly prohibited."
				+ "If you have received this communication in error, please notify us at +91712-2241405.</p>";
		//User user2 = (User) session.getAttribute("user");
		Long commaonId = (user1 != null && user1.getCommonId() != null) ? user1.getCommonId() : user1.getInstituteId();
	BalanceData balanceData=null;
	CollDeptLink dept = new CollDeptLink();
		if(collDeptLinkId==null) {
		System.out.println("role is  "+ user1.getRole()+"emal is "+ user1.getEmailIdCommon());
		if(user1.getRole().equals("5")) {
			college=	collegeService.getCollegeByEmail(user1.getEmail());
	

			balanceData=	balanceDataService.getBalanceDataByCompany(college.getCollege_id(),"College");
			user.setEmailIdCommon(user1.getEmail());
			user.setVerified(1);
			dept.setBalance_data_id(balanceData.getBalance_data_id());
		}
		else {
			User colleges = userService.findByEmailAndRole(user1.getRole(), user1.getEmailIdCommon());
			college=	collegeService.getCollegeByEmail(colleges.getEmailIdCommon());
			user.setEmailIdCommon(user1.getEmailIdCommon());
			user.setVerified(1);

			balanceData=	balanceDataService.getBalanceDataByCompany(college.getCollege_id(),"College");
			dept.setBalance_data_id(balanceData.getBalance_data_id());
		}
		balanceData.setNo_of_dept(balanceData.getNo_of_dept() - 1);
		
		balanceData.setUpdation_date(new Date());
		balanceDataService.saveBalance(balanceData);
		
		dept.setDeptId(dept_id);
		dept.setCreation_date(LocalDate.now());
		dept.setCollege_id(college.getCollege_id());
		dept.setCommonId(commaonId);
		//user.setCommonId(commaonId);
		dept.setStatus(ProjectConstants.coll_dept_link_status_active);
		user.setRole(ProjectConstants.hod);
		user.setOtp("007");
		user.setPassword(password);
		user.setTemp_pass(ProjectConstants.reg_user_temp_pass_yes);
		user.setVerified(1);
		user.setCollege_id(Math.toIntExact(college.getCollege_id()));
		user.setDepartment(dept_id);
		userService.saveUser(user);
		dept.setHead_id(user.getId());
		collDeptService.save(dept);
		
		
		String a = user.getEmail();
		
		userService.sendVerificationEmail(a,ProjectConstants.mail_subject_first_login, body);

	}else {
		
		System.out.println("update hod");
		CollDeptLink collDeptLink = collDeptService.getDeptLinkBYID(collDeptLinkId);
		CollDeptLink collDeptLink2 = collDeptService.getDeptLinkBYID(collDeptLinkId);
	// 	collDeptLink.setStatus(ProjectConstants.coll_dept_link_status_deactivate);
		collDeptLink.setUpdation_date(new Date());
		collDeptLink.setExpiration_date(new Date());
		
		collDeptLink2.setCreation_date(LocalDate.now());
		collDeptLink2.setUpdation_date(null);
		user.setRole(ProjectConstants.hod);
		user.setOtp("007");
		user.setVerified(1);
		user.setPassword(password);
		user.setTemp_pass(ProjectConstants.reg_user_temp_pass_yes);
		user.setEmailIdCommon(user1.getEmailIdCommon());
		user.setDepartment(dept_id);
	//	user.setExpiration_date(collDeptLink2.getExpiration_date());
	//.setExpiration_rsn(ProjectConstants.reg_user_expiration_rsn_low_balance);
		userService.save(user);;
		collDeptLink2.setHead_id(user.getId());
		collDeptService.save(collDeptLink2);
		userService.sendVerificationEmail(user.getEmail(),ProjectConstants.mail_subject_first_login, body);
		
	}
		
		return "redirect:college_dept";
	}
	@RequestMapping(value = "/college_dept_inch", method = RequestMethod.POST)
	public String saveIncharge_Member(User user,@RequestParam(value = "dept_id", required = false) Long dept_id ) {
		User user2 = (User) session.getAttribute("user");
		Long department = user2.getDepartment();
		String emailIdCommon = user2.getEmailIdCommon();
		User colleges = userService.findByEmailAndRoleAndDepartment(user2.getRole(), user2.getEmailIdCommon(),user2.getDepartment());
		
		College college = collegeService.getCollegeByEmail(colleges.getEmailIdCommon());
		
		Long commaonId = (user2 != null && user2.getCommonId() != null) ? user2.getCommonId() : user2.getInstituteId();
		String password = UUID.randomUUID().toString().substring(0, 5);
		password = password.replaceAll("\\s", "");
		String body =  "<h1 style=\"font-size:55px;margin:20px;text-align:center\">Welcome to <span style=\"color:#1974c3;\">Skill<span style=\"color:#01af36;\">Pilots</span> </h1>"
				+ "Your login has been created by the Head of your Department - " + user.getUsername() + "."
				+ "<p style=\"text-align:center\"> Here is your temporary password - <strong>" + password
				+ "</strong><br>" + "Click <a href='https://www.skillpilots.com/login_check'><strong>here</strong></a> to Login.<br>"

				+ "You'll be asked to change your password for security reasons.<br><br>"
				+ "Thanks & Regards,<br>SkillPIlots Team</p>"
				+ "<p style=\"text-align:justify;font-size:12px;\">Note:This is a system generated mail, please do not reply to it. This mailbox isn't being monitored.<br>"
				+ "The information contained in this e-mail and/or attachments to it contain confidential or privileged information."
				+ "If you are not the intended recipient, any dissemination, use, review, distribution, printing or copying of the"
				+ " information contained in this e-mail message and/or attachments to it are strictly prohibited."
				+ "If you have received this communication in error, please notify us at +91712-2241405.</p>";
		//CollDeptLink dept = new CollDeptLink();
		CollDeptLink departmentLink = collDeptService.getDepartmentLink(user2.getId());
		
		System.out.println("departmentedddddd    "+departmentLink);
//		departmentLink.setDeptId(dept_id);
		departmentLink.setUpdation_date(new Date());
//		//departmentLink.setCommonId(commaonId);
//		departmentLink.setStatus(ProjectConstants.coll_dept_link_status_active);
		
		departmentLink.setCollege_id(college.getCollege_id());
		user.setCommonId(commaonId);
		user.setOtp("007");
		user.setVerified(1);
		user.setRole(ProjectConstants.iii_role3deptIn);
		user.setPassword(password);
		user.setTemp_pass(ProjectConstants.reg_user_temp_pass_yes);
		user.setEmailIdCommon(user2.getEmailIdCommon());
		user.setDepartment(department);
		user.setCollege_id(Math.toIntExact(college.getCollege_id()));

		userService.saveUser(user);
		departmentLink.setIii_dept_co_id(user.getId());
		collDeptService.save(departmentLink);
		userService.sendVerificationEmail(user.getEmail(),ProjectConstants.mail_subject_first_login, body);

		
		return "redirect:college_dept";
	}
	
	@RequestMapping("/remove_member")
	public  String alterDept(@RequestParam Long id, @RequestParam short type) {

	    // Retrieve the existing user from the database
	    User existingUser = userService.getUserById(id);

	    if (existingUser != null) {
	        // Update only the 'type' field
	        existingUser.setType(type);

	        // Save the updated user
	        userService.saveUser(existingUser);
	    }

	    return "redirect:/add_company_member";
	}

	
	//hod 
	@RequestMapping(value="getApprovedStudentList",method=RequestMethod.GET)
	public String getApprovedStudentList(Model model){
		
		
		return "studentList_for_clg_mem";
	}
	
	@RequestMapping("/check_member_balance")
	public @ResponseBody String checkmemberbalance(@RequestParam(value="user_id",required=false) String user_id){
//		BalanceData balanceData=balanceDataService.getBalanceDept(session.getAttribute("institute_id").toString());
//		if(null!=balanceData && balanceData.getNo_of_dept()>0){  sk
//			return "success";
//		}else{
			return "failed";
//		}
	}
	
	@PostMapping("/cancel_dept/{id}")
	public String cancleMemReq(@PathVariable Long id, RedirectAttributes redirectAttributes) {
	   
		System.out.println("workinh" +id);
	 //   User userToDelete = userService.getUserById(id);
	//    System.out.println("User found: " + (userToDelete != null));
	    CollDeptLink collDeptLink = collDeptService.getDeptLinkBYID(id);
	    User head=userService.getUserById(collDeptLink.getHead_id());
		//head.setExpiration_date(new Date());
		head.setExpiration_rsn(ProjectConstants.reg_user_expiration_rsn_dept_del);
		head.setVerified(0);
		userService.save(head);
		
		if(null!=collDeptLink.getIii_dept_co_id()){
			User iii_co=userService.getUserById(collDeptLink.getIii_dept_co_id());
		//	iii_co.setExpiration_date(new Date());
			iii_co.setExpiration_rsn(ProjectConstants.reg_user_expiration_rsn_dept_del);
			iii_co.setVerified(0);
			userService.save(iii_co);
		}
		collDeptLink.setStatus(ProjectConstants.coll_dept_link_status_deleted);
		collDeptLink.setExpiration_date(new Date());
		collDeptService.save(collDeptLink);
		System.out.println("Head id of after update comp dept data"+collDeptLink.getHead_id());
		
		
//	    if (userToDelete != null) {
//	        userService.deleteUserById(id);
//	        redirectAttributes.addFlashAttribute("successMessage", "User removed successfully");
//	    } else {
//	        redirectAttributes.addFlashAttribute("errorMessage", "Failed to remove user");
//	    }

	    return "redirect:/college_dept";
	}

	@GetMapping("/get_coll_dept_link")
	public @ResponseBody CollDeptLink getCollDeptLink(@RequestParam("dept_link_id") Long dept_link_id) {
		
		return collDeptService.getDeptLinkBYID(dept_link_id);
		
	}
	
	@GetMapping("/existDept")
	public @ResponseBody Map<String, Object> getExistHod(
	        @RequestParam("college_id") Long college_id,
	        @RequestParam("deptId") Long dept_id) {
	    
	    int collegeIdAsInt = college_id.intValue(); 
	    
	    CollDeptLink hodDetails = collDeptService.getHeadId(collegeIdAsInt, dept_id);
	    
	    Map<String, Object> response = new HashMap<>();
	    if (hodDetails != null) {
	        response.put("status", "exists");
	        response.put("message", "Already HOD is created for this Department.");
	    } else {
	        response.put("status", "not_exists");
	    }
	    return response;
	}

	
	
	
	@InitBinder
	protected void initBinder(WebDataBinder binder) {
//		SimpleDateFormat dateFormat = new SimpleDateFormat(ProjectConstants.date_format);
//		binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, false));
	}
}
