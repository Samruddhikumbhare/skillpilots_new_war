package com.skillpilots.controller.other;

import java.io.IOException;
import java.io.InputStream;
import java.net.URL;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;

import org.apache.catalina.connector.Response;
import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.skillpilots.model.College;
import com.skillpilots.model.CompAdvertisement;
import com.skillpilots.model.Company;
import com.skillpilots.model.Department;
import com.skillpilots.model.PaymentHistory;
import com.skillpilots.model.PaymentStatus;
import com.skillpilots.model.Student;
import com.skillpilots.model.User;
import com.skillpilots.repository.CollegeRepository;
import com.skillpilots.repository.DepartmentRepository;
import com.skillpilots.repository.PaymentStatusRepository;
import com.skillpilots.service.CollegeService;
import com.skillpilots.service.CompanyAdvertisementService;
import com.skillpilots.service.ComponyService;
import com.skillpilots.service.DepartmentService;
import com.skillpilots.service.PaymentHistoryService;
import com.skillpilots.service.StudentService;
import com.skillpilots.service.UserService;
import com.skillpilots.utility.MessageConstants;
import com.skillpilots.utility.ProjectConstants;

import jakarta.servlet.ServletContext;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;

@Controller
public class MainController {

	@Autowired
	private UserService userService;

	@Autowired
	private StudentService studentService;

	@Autowired
	private ComponyService componyService;

	@Autowired
	private CollegeService collegeService;

	@Autowired
	private HttpSession session;

	@Autowired
	ServletContext context;

	@Autowired
	private CompanyAdvertisementService companyAdvertisementService;

	@Autowired
	private DepartmentService deptService;

	@Autowired
	private DepartmentRepository departmentRepository;
	@Autowired
	private CollegeRepository collegeRepository;
	@Autowired
	private PaymentHistoryService paymentHistoryService;
	@Autowired
	private PaymentStatusRepository paymentStatusRepository;

	private Date today = new Date();

	@RequestMapping(value = "/home")
	public String getHomePage() {

		return "login_check";
	}

	@RequestMapping(value = "/login_check")
	public String getLogin() {
		return "login_check";
	}

	@RequestMapping(value = "/login")
	public String getLogin2() {
		return "login_check";
	}

	@PostMapping("/login")
	public String company_dashboard(@RequestParam String email, @RequestParam String password, HttpSession session,
			Model model, RedirectAttributes redirectAttributes) {
		Optional<User> optionalUser = userService.getUserByEmail(email);

		if (optionalUser.isPresent()) {
			User user = optionalUser.get();

			if (user.isAccountLocked()) {
				if (user.canUnlockAccount()) {
					userService.unlockAccount(user);
				} else {
					session.setAttribute("error",
							"Your account is locked due to multiple failed login attempts. Please try again after 24 hours.");
					return "redirect:/login_check";
				}
			} else {
				userService.incrementFailedLoginAttempts(user);
			}

			if ((password.equals(user.getPassword()) || password.equals(user.getPlainPassword()))
					&& !user.isAccountLocked()) {
				userService.resetFailedLoginAttempts(user);
				int userRole = Integer.parseInt(user.getRole());

				session.setAttribute("user", user);
				String tempPassword = user.getTemp_pass();

				if (userRole == 0) {
					// Retrieve Payment Status for the student's college
					PaymentStatus paymentStatus = paymentStatusRepository.findByCollegeId((long) user.getCollege_id());

					/*
					 * if (paymentStatus != null) { if ("college".equals(paymentStatus.getStatus()))
					 * { // Redirect to student home if college has paid return
					 * "redirect:/stud_home"; } else if ("student".equals(paymentStatus.getStatus())
					 * || paymentStatus.getStatus() == null) { // Redirect to payment page if
					 * student needs to pay return "redirect:/paymentpage"; } } else { // If no
					 * payment record found, redirect to payment page return
					 * "redirect:/paymentpage"; }
					 */

					// If the user is verified and HoD verified, check temp password
					if (user.getVerified() == 1 && user.getHodverified() == 1) {
						if (tempPassword == null || tempPassword.equals(ProjectConstants.reg_user_temp_pass_no)) {
							return "redirect:/stud_home";
						} else if (tempPassword.equalsIgnoreCase(ProjectConstants.reg_user_temp_pass_yes)) {
							return "redirect:/change_password";
						}
					}
					// If verified but not HoD verified, redirect to confirm education page
					else if (user.getVerified() == 1 && user.getHodverified() == 0) {
						return "redirect:/confirm_current_edu";
					}
				} else if (userRole == 10 && user.getVerified() == 1) {
					/*
					 * PaymentHistory payment = paymentHistoryService.getPayment(user.getId());
					 * 
					 * System.out.println("interrrrrrrrrrrrrrr"); if (payment == null ||
					 * !"success".equalsIgnoreCase(payment.getStatus())) { return
					 * "redirect:/paymentpage"; }
					 */
					return "redirect:/dash";
				} else if (userRole == 20 && user.getVerified() == 1) {
					return "redirect:/stud_profile";
				} else if ((userRole == 5 || userRole == 8 || userRole == 7 || userRole == 6)
						&& user.getVerified() == 1) {
					if (tempPassword == null || tempPassword.equals(ProjectConstants.reg_user_temp_pass_no)) {
						return "redirect:/college_dashboard";
					} else if (tempPassword.equalsIgnoreCase(ProjectConstants.reg_user_temp_pass_yes)) {
						return "redirect:/change_password";
					}
				} else if ((userRole == 4 || userRole == 3 || userRole == 2 || userRole == 1)
						&& user.getVerified() == 1) {
					if (tempPassword == null || tempPassword.equals(ProjectConstants.reg_user_temp_pass_no)) {
						return "redirect:/company_dashboard";
					} else if (tempPassword.equalsIgnoreCase(ProjectConstants.reg_user_temp_pass_yes)) {
						return "redirect:/change_password";
					}
				} else {
					return "redirect:/login_check";
				}
			} else {
				if (user.getLoginAttempt() >= 3) {
					session.setAttribute("error",
							"Your account is locked due to multiple failed login attempts. Please try again after 24 hours.");
				} else {
					session.setAttribute("error",
							"Invalid email or password. You have " + (3 - user.getLoginAttempt()) + " attempts left.");
				}
				return "redirect:/login_check";
			}
		}

		session.setAttribute("error", "Invalid email or password");
		return "redirect:/login_check";
	}

	@RequestMapping(value = "/logout")
	public String logout_user(@ModelAttribute User user,
			@RequestParam(value = "message", required = false) String message, Model model) {
		session.removeAttribute("user");
		session.invalidate();
		System.out.println(message);
		if (null == message || message.isEmpty()) {
			message = MessageConstants.session_expired;
			System.out.println(message);
		}
		model.addAttribute("success", message);
		return "login_check";
	}

	@GetMapping("/get_logo")
	public String showImage(@RequestParam(value = "id", required = false) String id, HttpServletResponse response) {
		byte[] byteData = null;
		Company company = null;

		System.out.println("working");

		if (id != null) {
			// Retrieve the company logo by ID

		} else {
			User user = (User) session.getAttribute("user");
			if (user != null) {
				switch (user.getRole()) {
				case "0":
				case "10":
					Student student = studentService.getSpecificStudent(user.getId());
					byteData = (student != null) ? student.getPhoto() : null;
					break;

				case ProjectConstants.tpheadiiicell:
					User tpHeadUser = userService.findByEmailAndRole(user.getRole(), user.getEmailIdCommon());
					College collegeByTPHead = collegeService.getCollegeByEmail(tpHeadUser.getEmailIdCommon());
					byteData = (collegeByTPHead != null) ? collegeByTPHead.getLogo() : null;
					break;

				case ProjectConstants.college:
					College collegeByUser = collegeService.getCollegeByEmail(user.getEmail());
					byteData = (collegeByUser != null) ? collegeByUser.getLogo() : null;
					break;

				case ProjectConstants.company:
					company = componyService.getCompanyById(user.getEmail());
					byteData = (company != null) ? company.getLogo() : null;
					break;

				case ProjectConstants.hr:
					User hrUser = userService.findByEmailAndRole(user.getRole(), user.getEmailIdCommon());
					company = componyService.getCompanyById(hrUser.getEmailIdCommon());
					byteData = (company != null) ? company.getLogo() : null;
					break;

				case ProjectConstants.hod:
				case ProjectConstants.iii_role3deptIn:
					User deptUser = userService.findByEmailAndRoleAndDepartment(user.getRole(), user.getEmailIdCommon(),
							user.getDepartment());
					College collegeByDeptUser = collegeService.getCollegeByEmail(deptUser.getEmailIdCommon());
					byteData = (collegeByDeptUser != null) ? collegeByDeptUser.getLogo() : null;
					break;

				case ProjectConstants.iii_role4manager:
				case ProjectConstants.internshipLead:
					User teamUser = userService.findByEmailAndRoleAndTeamName(user.getEmail(), user.getRole(),
							user.getEmailIdCommon(), user.getTeam_name());
					company = componyService.getCompanyById(teamUser.getEmailIdCommon());
					byteData = (company != null) ? company.getLogo() : null;
					break;

				default:
					break;
				}
			} else {
				return "redirect:logout";
			}
		}

		response.setContentType("image/jpeg, image/jpg, image/png, image/gif");
		if (byteData != null && byteData.length > 0) {
			try {
				response.getOutputStream().write(byteData);
				response.getOutputStream().close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		} else {
			try (InputStream in = new URL(
					"https://www.pngall.com/wp-content/uploads/5/User-Profile-PNG-High-Quality-Image.png")
							.openStream()) {
				byteData = IOUtils.toByteArray(in);
				response.getOutputStream().write(byteData);
				response.getOutputStream().close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}

		return null;
	}

	@GetMapping("/dept")
	public ResponseEntity<Object> dept(@RequestParam Long collegeId) {
		List<Map<String, Object>> responseList = new ArrayList<>();
		// College college = collegeRepository.findByEmail(email);
		List<Object[]> dept1 = departmentRepository.getDept(collegeId);

		for (Object[] o : dept1) {
			Map<String, Object> map = new HashMap<>(); // Create a new map for each entry
			map.put("id", o[0]);
			map.put("deptName", o[1]);
			responseList.add(map);
		}

		return ResponseEntity.ok(responseList);
	}

	@GetMapping("/findDept")
	public ResponseEntity<Object> getDept(@RequestParam String email) {
		List<Map<String, Object>> responseList = new ArrayList<>();
		College college = collegeRepository.findByEmail(email);

		List<Object[]> dept1 = departmentRepository.getDept(college.getCollege_id());

		for (Object[] o : dept1) {
			Map<String, Object> map = new HashMap<>(); // Create a new map for each entry
			map.put("id", o[0]);
			map.put("deptName", o[1]);
			responseList.add(map);
		}

		return ResponseEntity.ok(responseList);
	}

}
