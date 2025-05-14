package com.skillpilots.controller.company;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.client.RestTemplate;

import com.skillpilots.Dto.ApiResponse;
import com.skillpilots.model.College;
import com.skillpilots.model.Company;
import com.skillpilots.model.CompanyDrive;
import com.skillpilots.model.User;
import com.skillpilots.repository.CollegeRepository;
import com.skillpilots.repository.CompanyDriveRepository;
import com.skillpilots.repository.ComponyRepository;
import com.skillpilots.repository.UserRepository;
import com.skillpilots.service.DepartmentService;
import com.skillpilots.service.EmailService;
import com.skillpilots.service.TechnologyService;
import com.skillpilots.utility.FirebaseService;
import com.skillpilots.utility.ProjectConstants;

import jakarta.servlet.http.HttpSession;

@Controller
public class CompanyDriveController {

	@Autowired
	private CompanyDriveRepository companyDriveRepository;
	@Autowired
	private HttpSession session;
	@Autowired
	private UserRepository userRepository;
	@Autowired
	private ComponyRepository componyRepository;
	@Autowired
	private EmailService emailService;
	@Autowired
	private FirebaseService firebaseService;
	@Autowired
	private TechnologyService technologyService;
	@Autowired
	private DepartmentService departmentService;
//	@GetMapping("/recruitment_campus")
//	private String getDadhboard() {
//		return "recruitment_campus";
//	}

	@PostMapping("/addRecruitment")
	public String addCampusRecruitment(@ModelAttribute CompanyDrive companyDrive) {
		User user = (User) session.getAttribute("user");
		Company company = null;

		if (user.getRole().equals(ProjectConstants.company)) {
			company = componyRepository.getCompanyDetailsById(user.getEmail());

		} else {
			company = componyRepository.getCompanyDetailsById(user.getEmailIdCommon());
		}

		companyDrive.setCompanyId(company.getCompany_id());

		if (companyDrive.getDriveId() != null) {
			// Update existing drive
			CompanyDrive existingDrive = companyDriveRepository.findById(companyDrive.getDriveId())
					.orElseThrow(() -> new RuntimeException("Drive not found"));

			// Update the drive details
			existingDrive.setCompanyName(companyDrive.getCompanyName());
			existingDrive.setSkill(companyDrive.getSkill());
			existingDrive.setJobRole(companyDrive.getJobRole());
			existingDrive.setCtc(companyDrive.getCtc());
			existingDrive.setInterviewDate(companyDrive.getInterviewDate());
			existingDrive.setJobDescription(companyDrive.getJobDescription());
			existingDrive.setLocation(companyDrive.getLocation());
			existingDrive.setSsc(companyDrive.getSsc());
			existingDrive.setHsc(companyDrive.getHsc());
			existingDrive.setUg(companyDrive.getUg());
			existingDrive.setExperience(companyDrive.getExperience());
			existingDrive.setJobType(companyDrive.getJobType());
			existingDrive.setWorkingType(companyDrive.getWorkingType());
			existingDrive.setQuestion1(companyDrive.getQuestion1());
			existingDrive.setQuestion1(companyDrive.getQuestion2());
			existingDrive.setQuestion1(companyDrive.getQuestion3());
			// Save the updated drive
			companyDriveRepository.save(existingDrive);

		} else {
			companyDriveRepository.save(companyDrive);
			List<Map<String, Object>> students = userRepository.findAllByRole6();
			int batchSize = 50; 
			int counter = 0;

			for (Map<String, Object> student : students) {
				String username = student.get("username") != null ? student.get("username").toString() : "User";
				String email = student.get("email") != null ? student.get("email").toString() : null;
				String notificationToken = student.get("notificationToken") != null
						? student.get("notificationToken").toString()
						: "";

				if (email == null) {
					continue;
				}

				String mailBody = "<h1 style=\"font-size:55px;margin:20px;text-align:center\">"
						+ "<span style=\"color:#1974c3;\">Skill<span style=\"color:#01af36;\">Pilots</span></h1>"
						+ "<p style=\"text-align:center\">Dear <strong style=\"color:#414ea4\">" + username
						+ "</strong>,<br>"
						+ "We are pleased to inform you that a new Recruitment is going on! Log in and apply at <strong style=\"color:#414ea4\"><a href=\"http://www.skillpilots.com\" style=\"color:#414ea4; text-decoration:none;\">SkillPilots</a></strong>.<br>"
						+ "Here are the details regarding your placement opportunities:</p>"
						+ "<ul style=\"text-align:center; list-style-type:none; padding:0;\">"
						+ "<li><strong>Company:</strong> " + company.getCompany_name() + "</li>" + "</ul>"
						+ "<p style=\"text-align:center\">We encourage you to prepare well for your interview.<br>"
						+ "If you have any questions, feel free to reach out to us at <strong style=\"color:#414ea4\"><a href=\"http://www.skillpilots.com\" style=\"color:#414ea4; text-decoration:none;\">SkillPilots</a></strong>.<br>"
						+ "Best of luck with your placement!</p>" + ProjectConstants.mail_footer;

				emailService.sendVerificationEmail(email, "Recruitment Update", mailBody);

				if (!notificationToken.isEmpty()) {
					firebaseService.sendNotification(notificationToken, "Internship Update",
							company.getCompany_name() + " is hiring. Go and apply!");
				}

				counter++;

				if (counter % batchSize == 0) {
					try {
						Thread.sleep(2000); 
					} catch (InterruptedException e) {
						Thread.currentThread().interrupt();
					}
				}
			}

		}

		return "redirect:/recruitment_campus";
	}

	@GetMapping("/recruitment_campus")
	public String getRecruitment(Model model) {
		User user = (User) session.getAttribute("user");

		Company company = null;
		if (user.getRole().equals(ProjectConstants.company)) {
			company = componyRepository.getCompanyDetailsById(user.getEmail());

		} else {
			company = componyRepository.getCompanyDetailsById(user.getEmailIdCommon());

		}
		List<CompanyDrive> drive = companyDriveRepository.findByStatusAndCompanyIdOrderByDriveIdDesc("A",
				company.getCompany_id());

		model.addAttribute("drive", drive);
		model.addAttribute("companyName", company.getCompany_name());
		List<String> allTechnology = technologyService.getTechnologyNameList();

		model.addAttribute("allTechnology", allTechnology);

		List<String> deptNameList = departmentService.getDeptNameList();
		model.addAttribute("deptName", deptNameList);
		return "campus_recruitment";

	}

	@GetMapping("/deleteRecruitment")
	public String deleteRecruitment(@RequestParam Long driveId) {
		CompanyDrive companyDrive = companyDriveRepository.findById(driveId)
				.orElseThrow(() -> new RuntimeException("Recruitmtnt not found"));
		companyDrive.setStatus("D");
		companyDriveRepository.save(companyDrive);
		return "redirect:/recruitment_campus";

	}

	@GetMapping("/comp_drive_app_list")
	private String getComp_drive_app_list(Model model) {

		User user = (User) session.getAttribute("user");
		Company company = null;
		if (user.getRole().equals(ProjectConstants.company)) {
			company = componyRepository.getCompanyDetailsById(user.getEmail());

		} else {
			company = componyRepository.getCompanyDetailsById(user.getEmailIdCommon());
		}
		RestTemplate restTemplate = new RestTemplate();
		String url = "http://43.204.35.211:8000/newskill/studentDriveRequest?companyId=" + company.getCompany_id();

		ApiResponse response = restTemplate.getForObject(url, ApiResponse.class);
		System.out.println("ApiResponse: " + response); 

		model.addAttribute("studentDrivePlacements", response.getData());
		return "company_drive_applied_list";
	}

}
