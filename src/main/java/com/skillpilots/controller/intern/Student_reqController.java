package com.skillpilots.controller.intern;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.skillpilots.model.College;
import com.skillpilots.model.CollegeInternalRequest;
import com.skillpilots.model.CompAdvertisement;
import com.skillpilots.model.Company;
import com.skillpilots.model.CompanyInternalRequest;
import com.skillpilots.model.Internships;
import com.skillpilots.model.NotificationRequest;
import com.skillpilots.model.Student;
import com.skillpilots.model.StudentRequest;
import com.skillpilots.model.Technologies;
import com.skillpilots.model.User;
import com.skillpilots.service.CollegeService;
import com.skillpilots.service.CompanyAdvertisementService;
import com.skillpilots.service.CompanyInternalRequestService;
import com.skillpilots.service.ComponyService;
import com.skillpilots.service.InternshipService;
import com.skillpilots.service.StudentRequestService;
import com.skillpilots.service.StudentService;
import com.skillpilots.service.TechnologyService;
import com.skillpilots.service.UserService;
import com.skillpilots.utility.ProjectConstants;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class Student_reqController {

	@Autowired
	private ComponyService componyService;
	@Autowired
	private StudentService studentService;
	@Autowired
	private UserService userService;
	@Autowired
	private InternshipService internshipService;
	@Autowired
	private HttpSession session;
	@Autowired
	private StudentRequestService studentRequestService;
	@Autowired
	private TechnologyService technologyService;
	@Autowired
	private CompanyInternalRequestService companyInternalRequestService;

	@Autowired
	private CompanyAdvertisementService companyAdvertisementService;

	@Autowired
	private JavaMailSender javaMailSender;

	@Autowired
	private CollegeService collegeService;

	/* Internship Status for student login hence input advertisement id */
	@GetMapping("/getInternshipStatus")
	public @ResponseBody String getInternshipStatus(@RequestParam Long avdId) {

		String response = null;
		User user = (User) session.getAttribute("user");

		boolean internshipStatusOfStudent = internshipService.getInternshipStatusOfStudent(user.getId());
		if (internshipStatusOfStudent) {

			return response = "ongoing";
		}
		StudentRequest studentRequest = null;
		studentRequest = studentRequestService.getStudentReqAgainstAdv(user.getId(), avdId);
		if (studentRequest != null) {
			return response = studentRequest.getApproval_status();
		}
		// Check if already applied to same company
		HashMap<String, String> compMap = (HashMap<String, String>) session.getAttribute("appliedCompanies");
		// compMap.forEach((k,v)->System.out.println(k+" - "+v));
		CompAdvertisement compAdvt = companyAdvertisementService.getCompAdv(avdId);

		if (compMap.size() > 0 && compMap.containsKey(compAdvt.getCompanyId())) {
			return compMap.get(compAdvt.getCompanyId());
		}
		return response;
	}

	// Internship Status for college login hence input student_id and
	@RequestMapping("/checkEligibleToApply")
	public @ResponseBody HashMap<String, Object> eligibleToApply(@RequestParam("company_id") Long companyId,
			@RequestParam("student_id") Long studentId) {
		HashMap<String, Object> response = new HashMap<>();

		if (internshipService.getInternshipStatusOfStudent(studentId)) {
			response.put("result", true);
			response.put("reason", "ongoing");
			return response;
		}

		if (internshipService.isStudentAlreadyApplied(studentId, companyId)) {
			response.put("result", true);
			response.put("reason", "applied");
			return response;
		}

		// If neither condition is met, the student is eligible to apply
		response.put("result", false);
		response.put("reason", "not applied");
		return response;
	}

	

	@RequestMapping("/viewCompAndApply")
	public String viewandapply(Model model) {
		User user = (User) session.getAttribute("user");

		if (user != null) {
			// Handle null compMap
			HashMap<String, String> compMap = (HashMap<String, String>) session.getAttribute("appliedCompanies");
			if (compMap == null) {
				compMap = new HashMap<>();
			}

			// Prepare companies map
			HashMap<Company, String> companies = new HashMap<>();
			List<Company> compList = componyService.findAll();
			for (Company comp : compList) {
				if (compMap.containsKey(comp.getCompany_id())) {
					companies.put(comp, compMap.get(comp.getCompany_id()));
				} else {
					companies.put(comp, "not_applied");
				}
			}

			// Add companies and technologies to the model
			model.addAttribute("companies", companies);
			List<Technologies> techList = technologyService.getAllTechnology();
			model.addAttribute("techList", techList);
		}

		return "viewCompanyAndApply";
	}

	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/viewCompAndApply", method = RequestMethod.POST)
	public String applyInterns(HttpServletRequest request, @RequestParam("hid") String hid) {

		String body =null;

		try {
			// Retrieve the logged-in user from the session
			User user = (User) session.getAttribute("user");

			 body = "<h1 style=\"font-size:55px;margin:20px;text-align:center\">Welcome to "
			        + "<span style=\"color:#1974c3;\">Skill</span>"
			        + "<span style=\"color:#01af36;\">Pilots</span></h1>"
			        + "<p style=\"text-align:center; font-size:20px; color:#333;\"><strong>Student Name: " + user.getUsername() + "</strong></p>"
			        + "<p style=\"text-align:center; font-size:18px; color:#555;\">has applied for an <strong>internship</strong> in SkillPilots.</p>"
			        + "<p style=\"text-align:center; font-size:16px;\">Please review the application in SkillPilots.</p>"
			        + "<p style=\"text-align:center; font-size:16px;\">Follow the link below to check the details:<br>"
			        + "Click <a href=\"https://www.skillpilots.com\" style=\"color:#1974c3;\"><strong>here</strong></a> to visit SkillPilots.</p>"
			        + ProjectConstants.mail_footer;
			
			// Fetch the user's college ID
			Long singleClg = (long) user.getCollege_id();
			Long depart = user.getDepartment();
			College clg = collegeService.getCollegeById(singleClg);

			if (clg != null) {
				// Extract the college email
				String clgEmail = clg.getEmail_id();
				// Find the HOD user by email and role
				User userData = userService.findByEmailAndRoleAndDeprt(clgEmail, depart);
				if (userData != null) {
					// Get the HOD's email
					String Hodemail = userData.getEmail();

					userService.sendVerificationEmail(Hodemail, "Notification From Skillpilot", body);
				} else {
					System.out.println("HOD user not found");
				}
			} else {
				System.out.println("College not found");
			}

		} catch (Exception e) {
			// Handle exceptions and print the error message
			System.out.println("Error: " + e.getMessage());
		}

		// Check if hid is empty
		if (hid.isEmpty()) {
			return "redirect:/stud_home";
		}

		try {
			Long avdId = Long.parseLong(hid);

			CompAdvertisement comp_advertisements = companyAdvertisementService.getCompAdv(avdId);

			StudentRequest request_id = studentRequestService.saveStudentRequest(comp_advertisements);

			String companyIdString = String.valueOf(comp_advertisements.getCompanyId());

			Optional<Company> com = componyService.findById(comp_advertisements.getCompanyId());

			if (com.isPresent()) {
				Company company = com.get(); // Get the actual Company object
				String email = company.getEmail_id(); // Assuming getEmailId() retrieves the company's email
				// Assuming you want to find a user (HR) based on the company email
				Optional<User> compForhr = userService.findByEmail(email);
				if (compForhr.isPresent()) {
					User hrUser = compForhr.get(); 
					String hrEmail = hrUser.getEmail();
					userService.sendVerificationEmail(hrEmail, "Notification From Skillpilot", body);
					userService.sendVerificationEmail(email, "Notification From Skillpilot", body);

					System.out.println("Email sent to: " + hrEmail);
				} else {
					System.out.println("HR user not found");
				}

			}

			HashMap<String, String> compMap = (HashMap<String, String>) session.getAttribute("companies");

			if (compMap == null) {
				compMap = new HashMap<>();
			}

			// Add an entry to the compMap
			compMap.put(companyIdString, "s");

			session.setAttribute("yourAttributeName", compMap);

			return "redirect:/stud_home";
		} catch (NumberFormatException e) {
			e.printStackTrace(); 
			return "redirect:/stud_home";
		}
	}

	@PostMapping("/viewCompAndApply1")
	public String viewAndApp(@ModelAttribute StudentRequest studentRequest, RedirectAttributes redirectAttributes,
			@RequestParam(value = "company_id", required = false) Long company_id) {

	
		User user = (User) session.getAttribute("user");


		studentRequest.setCreation_date(new Date()); // Assum ing you have setter methods following Java naming
														// conventions.
		studentRequest.setStudent_id(user.getId());
		studentRequest.setExpiration_date(
				userService.getDateAfterDays(new Date(), ProjectConstants.req_expiration_after_days));

		studentRequest.setApproval_status("pending");

		studentRequestService.saveRequest(studentRequest);

		User user1 = userService.getUserById(user.getId());
		user1.setCommonId(studentRequest.getStudent_id());
		userService.saveUser(user1);
		HashMap<String, String> compMap = (HashMap<String, String>) session.getAttribute("appliedCompanies");

		compMap.put(String.valueOf(company_id), "s");
		session.setAttribute("appliedCompanies", compMap);

		System.out.println("cicicicicici" + compMap);

		// Optionally, add flash attributes or any other model attributes if needed
		redirectAttributes.addFlashAttribute("message", "Application submitted successfully!");
		return "redirect:/viewCompAndApply";
	}

	// student approve
	@RequestMapping(value = "studentRequestApprove", method = RequestMethod.GET)
	public @ResponseBody String studentapproval(@RequestParam("request_id") Long request_id) {
		StudentRequest studentRequest = studentRequestService.getStudentRequest(request_id);
		studentRequest.setExpiration_date(
				userService.getDateAfterDays(new Date(), ProjectConstants.req_expiration_after_five_days));
		studentRequest.setApproval_status("A");

		studentRequestService.saveRequest(studentRequest);
		return "success";
	}

	// student request Rejection
	@RequestMapping(value = "/student_req_reject", method = RequestMethod.POST)
	public @ResponseBody String studentRequestReject(@RequestBody StudentRequest studentRequest) {

		System.out.println(studentRequest.getRejection_msg() + "  " + studentRequest.getRequest_id());
		StudentRequest studentRequestdata = studentRequestService.getStudentRequest(studentRequest.getRequest_id());

		User user = (User) session.getAttribute("user");

		if (user.getRole().equals("1") || user.getRole().equals("2")) {
			studentRequestdata.setRejection_msg("HR:" + studentRequest.getRejection_msg());
		} else if (user.getRole().equals("5") || user.getRole().equals("7")) {

			studentRequestdata.setRejection_msg("T&P:" + studentRequest.getRejection_msg());
		} else if (user.getRole().equals("7")) {
			studentRequestdata.setRejection_msg("HOD:" + studentRequest.getRejection_msg());
		}

		studentRequestdata.setUpdation_date(new Date());
		studentRequestdata.setExpiration_date(
				userService.getDateAfterDays(new Date(), ProjectConstants.req_expiration_after_five_days));
		studentRequestdata.setLast_status(studentRequestdata.getApproval_status());
		studentRequestdata.setApproval_status(ProjectConstants.student_req_approval_status_rejected);
		studentRequestService.saveRequest(studentRequestdata);

		return "Student Rejected";

	}

	// student iundo rejection
	@RequestMapping("/undo_rejection")
	public @ResponseBody String undorejection(@RequestParam("request_id") Long request_id) {
		StudentRequest studentRequest = studentRequestService.getStudentRequest(request_id);
		User user = (User) session.getAttribute("user");

		if (user.getRole().equals("1") || user.getRole().equals("2")) {
			studentRequest.setApproval_status(studentRequest.getLast_status());
			studentRequest.setRejection_msg(null);
			studentRequest.setUpdation_date(new Date());
			studentRequest.setExpiration_date(
					userService.getDateAfterDays(new Date(), ProjectConstants.req_expiration_after_five_days));
			studentRequestService.saveRequest(studentRequest);
		}
		return "success";
	}

	@RequestMapping("/is_any_ongoing_internship")
	public @ResponseBody boolean isAnyOngoingInternship(@RequestParam("studentId") Long studentId) {
		StudentRequest status = studentRequestService.findApprovalStatusById(studentId);

		if (status != null && status.getApproval_status().equals("pending")
				|| status.getApproval_status().equals("approved")) {

			return true;
		} else {
			return false;
		}
	}

	@RequestMapping("/addNoteForHR")
	public @ResponseBody String addNote() {

		return "Note Successfully added.";
	}

	@GetMapping("/getStudents")
	public Student getStudentDetails(@RequestParam("student_id") Long student_id) throws Exception {
		return studentService.getStudentById(student_id);

	}
}
