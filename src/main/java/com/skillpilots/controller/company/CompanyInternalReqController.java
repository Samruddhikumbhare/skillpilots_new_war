package com.skillpilots.controller.company;

import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.protobuf.TextFormat.ParseException;
import com.skillpilots.Dto.TeamDto;
import com.skillpilots.model.CollegeInternalRequest;
import com.skillpilots.model.CompDeptLink;
import com.skillpilots.model.Company;
import com.skillpilots.model.CompanyInternalRequest;
import com.skillpilots.model.ExternalRequest;
import com.skillpilots.model.Internships;
import com.skillpilots.model.Student;
import com.skillpilots.model.StudentPast;
import com.skillpilots.model.StudentRequest;
import com.skillpilots.model.User;
import com.skillpilots.service.CompDeptService;
import com.skillpilots.service.CompanyInternalRequestService;
import com.skillpilots.service.ComponyService;
import com.skillpilots.service.ExternalRequestService;
import com.skillpilots.service.InternshipService;
import com.skillpilots.service.StudentRequestService;
import com.skillpilots.service.StudentService;
import com.skillpilots.service.UserService;
import com.skillpilots.utility.ProjectConstants;

import jakarta.servlet.http.HttpSession;

@Controller
public class CompanyInternalReqController {
	@Autowired
	private HttpSession session;
	@Autowired
	private InternshipService internshipService;
	@Autowired
	StudentRequestService studentRequestService;
	@Autowired
	private CompanyInternalRequestService companyInternalRequestService;
	@Autowired
	private ExternalRequestService externalRequestService;
	@Autowired
	private UserService userService;
	@Autowired
	private ComponyService componyService;
	@Autowired
	private CompDeptService compDeptService;
	@Autowired
	private StudentService studentService;

	@RequestMapping(value = "assignInternshipByCompany", method = RequestMethod.POST)
	public @ResponseBody String scheduleInternship(@RequestParam("technology_name") String technology_name,
			@RequestParam("team_name") String team_name, @RequestParam("duration") int duration,
			@RequestParam("request_id") Long request_id, @RequestParam("colBalId") String colBalId,
			@RequestParam("compBalId") Long compBalId) {

		User user = (User) session.getAttribute("user");
		Company company = null;
		if (user.getRole().equals(ProjectConstants.company)) {
			company = componyService.getCompanyById(user.getEmail());
		} else if (user.getRole().equals(ProjectConstants.hr)) {
			User hrUser = userService.findByEmailAndRole(user.getRole(), user.getEmailIdCommon());
			if (hrUser != null) {
				company = componyService.getCompanyById(hrUser.getEmailIdCommon());
			}
		}

		CompanyInternalRequest internalRequest = new CompanyInternalRequest();
		ExternalRequest ex_req = externalRequestService.getExternalRequestByERid(request_id);
		internalRequest.setUser_id(company.getCompany_id());
		internalRequest.setCreation_date(new Date());
		internalRequest.setRequest_msg(ex_req.getRequest_msg());
		internalRequest.setRejection_msg(ex_req.getRejection_msg());
		internalRequest.setFor_college(ex_req.getFrom_user_id());
		internalRequest.setTechnology(technology_name);
		internalRequest.setDuration(duration);
		internalRequest.setFor_team(team_name);
		internalRequest.setFor_users(ex_req.getStudent_ids());
		internalRequest.setApproval_status(ProjectConstants.comp_internal_req_approval_status_manager);
		internalRequest.setAgainst_ext_req(ex_req.getRequest_id());
		internalRequest.setAdvertisement_id(ex_req.getAdvertisement_id());
		internalRequest.setColl_balance_id(colBalId);
		internalRequest.setComp_balance_id(compBalId);

		String studentIds = String.valueOf(ex_req.getStudent_ids());

		// Check if there are multiple student IDs
		String[] studentIdArray = studentIds.split(",");
		if (studentIdArray.length > 1) {
			internalRequest.setUserType("col"); // Set user type to "col" if there are multiple student IDs
		}

		companyInternalRequestService.saveCompanyInternalRequest(internalRequest);
		// change status of external request -->'S' and update tech and duration if not
		// previously added
		ex_req.setTechnology(technology_name);
		ex_req.setDuration(duration);
		ex_req.setApproval_status(ProjectConstants.external_req_approval_status_assigned);
		ex_req.setUpdation_date(new Date());
		externalRequestService.saveExternalRequest(ex_req);
		return "sucess";

		// update coll internal req's tech and duration if not previously added
//		CollegeInternalRequest cir = internalRequestService.getInternalRequest(request_id);
//		cir.setTechnology(technology_name);
//		cir.setDuration(duration);
//		internalRequestService.update(cir);

	}

	@RequestMapping(value = "/company_internal_request", method = RequestMethod.GET)
	public String comp_internal_req(Model model) {
		User user = (User) session.getAttribute("user");
		System.out.println("User " + user);

		if(user==null) {
			return "redirect:login_check";

		}
		
		
		Long companyId = (user != null && user.getCommonId() != null) ? user.getCommonId() : user.getInstituteId();
		Company company = null;

		List<Object[]> listofobject = null;
		if (user.getRole().equals(ProjectConstants.company)) {
			System.out.println("1st loop");
			company = componyService.getCompanyById(user.getEmail());
			listofobject = companyInternalRequestService.getInternalReqByRole(company.getCompany_id(), new Date(),
					ProjectConstants.coll_dept_link_status_active);

			for (Object[] obj : listofobject) {
				for (Object o : obj) {
					System.out.print(o + " ");
				}
				System.out.println();
			}

		} else if (user.getRole().equals(ProjectConstants.hr)) {
			User u = userService.findByEmailAndRole(user.getRole(), user.getEmailIdCommon());
			company = componyService.getCompanyById(u.getEmailIdCommon());
			listofobject = companyInternalRequestService.getInternalReqByRole(company.getCompany_id(), new Date(),
					ProjectConstants.coll_dept_link_status_active);

		}

		else if (user.getRole().equals(ProjectConstants.iii_role4manager)
				|| user.getRole().equals(ProjectConstants.internshipLead)) {

			User u = userService.findByEmailAndRoleAndTeamName(user.getEmail(), user.getRole(), user.getEmailIdCommon(),
					user.getTeam_name());

			company = componyService.getCompanyById(u.getEmailIdCommon());
			listofobject = companyInternalRequestService.getInternalReqByRoleManagerOrLead(company.getCompany_id(),
					ProjectConstants.coll_dept_link_status_active, user.getId());

			for (Object[] obj : listofobject) {
				for (Object o : obj) {
					System.out.print(o + " ");
				}
				System.out.println();
			}

			// to check for each request if lead exists then show assign button else
			// schedule
			List<TeamDto> compDeptLink = compDeptService.getTeams(user.getId());
			model.addAttribute("compDeptLink", compDeptLink);
			System.out.println("CompDept" + compDeptLink);
		}
		model.addAttribute("com_internal_req", listofobject);
		return "company_internal_request";

	}
//	}else {//condition when role is anthing other than 1/2/3//		}
//		

////		List<CompanyInternalRequest> Allrequests = companyInternalRequestService.findAll(user.getCommonId());
////	   
////	   List<StudentRequest> internalStudentReq = studentRequestService.findInternshipByConpanyId(companyId);
////		model.addAttribute("request", Allrequests);
////		model.addAttribute("internalrequest", internalStudentReq);
//		
//			
//		
//	}
	@RequestMapping(value = "com_internal_req_A_R", method = RequestMethod.GET)
	public @ResponseBody String approveOrRejectInternalReq(@RequestParam Long req_id, @RequestParam String reject_msg) {
		// int role = (int) session.getAttribute("role");
		User user = (User) session.getAttribute("user");

		CompanyInternalRequest companyInternalRequest = companyInternalRequestService.getCompInternal_Req(req_id);
		// if session in company user
		if (user.getRole().equals(ProjectConstants.iii_role4manager)) {
			User u = userService.findByEmailAndRoleAndTeamName(user.getEmail(), user.getRole(), user.getEmailIdCommon(),
					user.getTeam_name());
			Company compony = componyService.getCompanyById(u.getEmailIdCommon());
			CompDeptLink cdLink = compDeptService.getCompDeptLink(compony.getCompany_id(),
					companyInternalRequest.getFor_team());
			String param[] = new String[1];
			;

			if (reject_msg.equals("null")) {
				companyInternalRequest
						.setApproval_status(ProjectConstants.comp_internal_req_approval_status_internship_lead);
				companyInternalRequest.setExpiration_date(
						userService.getDateAfterDays(new Date(), ProjectConstants.req_expiration_after_days));
				/* internal req approve by role 2 */
				companyInternalRequest.setRequest_id(req_id);
				companyInternalRequestService.saveCompanyInternalRequest(companyInternalRequest);
				// notif for lead

			}

		}
		return "success";
	}

	@PostMapping("/scheduleInternshipByCompany_Team")
	@ResponseBody
	public String scheduleInternship(@RequestParam("request_id") Long requestId,
			@RequestParam("selected_date") Date selectedDate) {
		// Check if requestId exists in the database
		boolean exists = companyInternalRequestService.existsById(requestId);
		if (!exists) {
			return "Request ID  found in the database";
		}
		CompanyInternalRequest companyRequest = companyInternalRequestService.getCompanyRequestById(requestId);
		companyRequest.setApproval_status("Pending at Managaer");
		companyRequest.setCreation_date(selectedDate);
		companyInternalRequestService.save(companyRequest);
		return "Success";
	}

	@RequestMapping(value = "scheduleInternshipByCompany_Teams", method = RequestMethod.GET)
	public @ResponseBody Map<String, String> scheduleDate_for_internship(@RequestParam String sdate,
			@RequestParam Long request_id, @RequestParam String team_name)
			throws ParseException, java.text.ParseException {
		Date start_date = null;
		Student studentdata = null;
		StudentPast studentPast = null;
		Map<String, String> map = new HashMap<String, String>();
		System.out.println("Date Format previous :-" + sdate);
		User user = (User) session.getAttribute("user_data");
		// Use the correct date format
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		start_date = dateFormat.parse(sdate);

		// ... rest of your code ...
		CompanyInternalRequest companyInternalRequest = companyInternalRequestService.getCompanyRequestById(request_id);
		String[] arrOfStudent = companyInternalRequest.getFor_users().split(",");
		Long studentId = Long.parseUnsignedLong(arrOfStudent[0], 10);
		// Call the getSpecificStudent method of studentService and pass the studentId
		// as an argument
		studentdata = studentService.getSpecificStudent(studentId);

		String companyName = componyService.getCompanyName(companyInternalRequest.getCompany_id());
		for (int i = 0; i < arrOfStudent.length; i++) {
			Internships internships = new Internships();
			// Set various properties of the internships object
			internships.setTechnology(companyInternalRequest.getTechnology());
			internships.setCollege_id(companyInternalRequest.getFor_college());
			internships.setCompany_id(companyInternalRequest.getUser_id());
			internships.setDuration(companyInternalRequest.getDuration());
			internships.setDate_started(start_date);
			internships.setCompanyName(companyName);
			if (studentdata.getDept() != null) {
				internships.setColl_dept(Long.parseLong(studentdata.getDept()));
			}
			internships.setComp_dept_id(team_name);
			internships.setStudent_id(Long.parseLong(arrOfStudent[i])); // Convert the student ID to Long
			internships.setCreation_date(LocalDate.now());
			internships.setStatus(ProjectConstants.internships_status_pending);
			internships.setAgainst_int_req_id(companyInternalRequest.getRequest_id());
			// internships.setGroup_id(grp_id);
			internships.setAdvertisement_id(companyInternalRequest.getAdvertisement_id());
			internshipService.saveInternship(internships); // Save the internships object
			// Set student ID for notifications
			// studNotif.setUser_id(Long.parseLong(arrOfStudent[i])); // Convert the student
			// ID to Long
			// String[] paramList = studParam.toArray(new String[studParam.size()]);
			// notificationsService.crNotifForUser(studNotif, paramList);
		}
		// balanceDataService.updateBalanceData(balanceData);
		CompanyInternalRequest cir = new CompanyInternalRequest();
		companyInternalRequest.setRequest_id(request_id);
		companyInternalRequest.setApproval_status(ProjectConstants.comp_internal_req_approval_status_approved);
		CompanyInternalRequest internalRequest = companyInternalRequestService.save(companyInternalRequest);
		return map;
	}

	// get Rejection Reason
	@RequestMapping(value = "/intReqRejReason", method = RequestMethod.GET)
	public @ResponseBody String getRejectionReason(@RequestParam String request_id) {
//		CompanyInternalRequest comp_i_req = companyInternalRequestService.getCompInternal_Req(request_id);
		return "getRejection_msg";
	}

	@PostMapping("/assignteam")
	public ModelAndView saveOption(@RequestParam("internship_lead_id") Long leadId) {
		User user = (User) session.getAttribute("user");
		if (user == null) {
			return new ModelAndView("redirect:/company_internal_request");
		}
		Long CommonId = user.getCommonId();

		StudentRequest studReq = studentRequestService.findStudentReqByCommonId(CommonId);

		studReq.setApproval_status("ongoing");
		studReq.setInternship_lead_id(leadId);
		studReq.setUpdation_date(new Date());

		studentRequestService.saveRequest(studReq);

		// Redirect to a confirmation page or back to the form page
		return new ModelAndView("redirect:/company_internal_request");
	}

}
