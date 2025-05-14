package com.skillpilots.controller.intern;

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.MalformedURLException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.Arrays;
import java.util.Collections;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;
import java.util.Random;

import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.core.io.Resource;
import org.springframework.core.io.UrlResource;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.skillpilots.model.College;
import com.skillpilots.model.Company;
import com.skillpilots.model.Department;
import com.skillpilots.model.Internships;
import com.skillpilots.model.PaymentStatus;
import com.skillpilots.model.Student;
import com.skillpilots.model.StudentPast;
import com.skillpilots.model.Technologies;
import com.skillpilots.model.User;
import com.skillpilots.repository.PaymentStatusRepository;
import com.skillpilots.repository.StudentRepository;
import com.skillpilots.repository.UserRepository;
import com.skillpilots.service.CollegeService;
import com.skillpilots.service.ComponyService;
import com.skillpilots.service.DepartmentService;
import com.skillpilots.service.InternshipService;
import com.skillpilots.service.StudentService;
import com.skillpilots.service.TechnologyService;
import com.skillpilots.service.UserService;
import com.skillpilots.utility.MessageConstants;
import com.skillpilots.utility.ProjectConstants;

import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@Controller
//public class StudentRegistrationController extends BeanCopyUtil {
public class StudentRegistrationController {
	@Autowired
	private UserRepository userRepository;
	@Autowired
	private JavaMailSender javaMailSender;
	@Autowired
	private StudentService studentService;
	@Autowired
	private HttpSession session;
	@Autowired
	private UserService userService;
	@Autowired
	private DepartmentService departmentService;
	@Autowired
	private CollegeService collegeService;
	@Autowired
	ServletContext context;
	@Autowired
	private PaymentStatusRepository paymentStatusRepository;
	@Autowired
	private TechnologyService technologyService;
	@Autowired
	private StudentRepository studentRepository;
	
	@Autowired
	private InternshipService internshipService;
	@Autowired
	private ComponyService componyService;
	
	@GetMapping("/student_reg_step1")
	public String regStep1(Model model) {

		model.addAttribute("user", new User());
		return "student_reg_email";
	}

	@RequestMapping(value = "/student_reg_step1", method = RequestMethod.POST)
	public String regStep_one(@ModelAttribute("user") User user, Model model) {

		Random random = new Random();

		user.setRole(ProjectConstants.default_student);
		;
		int otpValue = random.nextInt(1000000);
		String otp = String.format("%06d", otpValue);
		user.setOtp(otp.substring(0, 4));
		user.setType((short) 1);
		userRepository.save(user);
		Student student = new Student();
		student.setEmail_id(user.getEmail());
		student.setStudent_id(user.getId());
		studentService.saveStudent(student);
		String body = "<div style=\"font-family:Arial, sans-serif; line-height:1.6; padding:20px;\">"
				+ "<h1 style=\"font-size:55px; margin:20px auto; text-align:center;\">"
				+ "Welcome to <span style=\"color:#1974c3;\">Skill<span style=\"color:#01af36;\">Pilots</span></span>"
				+ "</h1>" + "<p style=\"text-align:center; font-size:18px; color:#333;\">"
				+ "Thank you for registering! Here is your registration code: <strong>" + otp.substring(0, 4)
				+ "</strong>" + "</p>" + "<p style=\"text-align:center; font-size:16px; color:#333;\">"
				+ "Please follow the link below to complete your registration:" + "</p>"
				+ "<p style=\"text-align:center;\">" + "<a href=\"http://www.skillpilots.com\" "
				+ "style=\"display:inline-block; padding:10px 20px; font-size:16px; color:#fff; background-color:#1974c3; text-decoration:none; border-radius:5px;\">"
				+ "Complete Registration" + "</a>" + "</p>"
				+ "<p style=\"text-align:center; font-size:14px; color:#555;\">"
				+ "You'll be asked to change your password for security reasons." + "</p>"
				+ "<div style=\"margin-top:20px; text-align:center; font-size:12px; color:#999;\">"
				+ ProjectConstants.mail_footer + "</div>" + "</div>";

		userService.sendVerificationEmail(user.getEmail(), "Registration Code & Link for SkillPilots", body);

		model.addAttribute("success", MessageConstants.student_reg_success);
		return "redirect:/student_reg_step2";

	}

	// getmaping
	@RequestMapping("/student_reg_step2")
	public String regStep_two() {

		return "stud_reg_step_two";

	}

	@GetMapping("/email_exists")
	public ResponseEntity<Boolean> emailExists(@RequestParam("email_id") String email) {
		boolean exists = userRepository.existsByEmail(email);
		return ResponseEntity.ok(exists);
	}

	@PostMapping("/verify")
	public String processVerification(@ModelAttribute("user") User user, RedirectAttributes redirectAttributes) {
		
		User storedUser = userRepository.findByEmail(user.getEmail()).orElse(null);
		if (storedUser != null && storedUser.getOtp().equals(user.getOtp())) {
		
			storedUser.setVerified(1);
			userRepository.save(storedUser);
			
			redirectAttributes.addAttribute("email", user.getEmail());
			redirectAttributes.addAttribute("success", MessageConstants.student_reg_success);
			return "redirect:/stud_reg_step_two2";
		} else {
		
			redirectAttributes.addFlashAttribute("error", "Invalid OTP. Please try again.");
		
			return "redirect:/student_reg_step2";
		}
	}

	@RequestMapping("/stud_reg_step_two2")
	public String regStep_two2(@RequestParam("email") String email, Model model) {
		// Use the email parameter as needed
		model.addAttribute("email", email);
		return "stud_reg_step_two2";
	}

	@PostMapping("/changePassword")
	public String changePassword(@RequestParam("old_pass") String oldPassword, @RequestParam("pass") String newPassword,
			Model model, RedirectAttributes redirectAttributes) {

		User user = (User) session.getAttribute("user");
		if (user == null) {
			return "change_password";
		}
		// Check if the provided old password matches the one stored in the session
		if (!oldPassword.equals(user.getPassword())) {

			return "change_password";
		}

		System.out.println("Old Password" + oldPassword);
		System.out.println("Old Password" + newPassword);

		User user1 = userRepository.getUserEmail(user.getEmail());
		// Update the user's password
		user1.setPassword(newPassword);
		// Save the updated user object back to the database
		user1.setTemp_pass(ProjectConstants.reg_user_temp_pass_no);
		userRepository.save(user1);

		// Update the old password in the session with the new password
		session.setAttribute("oldPassword", newPassword);
		redirectAttributes.addFlashAttribute("message", MessageConstants.password_changed);
		return "redirect:logout";
	}

	
	
	@PostMapping("/updateStudentProfile")
    public String updateStudentProfile(
                                       @RequestParam("email_id") String email,
                                       @RequestParam("contact") Long contact,
                                       @RequestParam("curr_city") String currCity,
                                       @RequestParam("linkedIn") String linkedIn,
                                       @RequestParam("curr_year") String curr_year,
                                       @RequestParam("d_o_b") @DateTimeFormat(iso = DateTimeFormat.ISO.DATE) LocalDate d_o_b,	
                                       Model model) {
		
		User user = (User) session.getAttribute("user");

        Student student = studentService.getStudentById(user.getId());
        user.setEmail(email);
        userService.saveUser(user);
        student.setEmail_id(email);
        student.setContact(contact);
        student.setCurr_city(currCity);
        student.setLinkedIn(linkedIn);
        student.setD_o_b(d_o_b); 
        student.setCurr_year(curr_year);
        studentService.saveStudent(student);

        model.addAttribute("successMessage", "Profile updated successfully!");

        return "redirect:/editStudentProfile"; 
    }
	 @PostMapping("/update-photo")
	    public String updateProfilePhoto(@RequestParam("newPhoto") MultipartFile file) {
	        try {
	    		User user = (User) session.getAttribute("user");

	        	 Student profile = studentService.getStudentById(user.getId())
	                    ;

	             byte[] photoBytes = file.getBytes();

	             profile.setPhoto(photoBytes);

	             studentService.saveStudent(profile);
	            return "redirect:/editStudentProfile";
	        } catch (Exception e) {
	            return "redirect:/editStudentProfile";
	        }
	 }
	 
	 @PostMapping("/remove-photo")
	    public ResponseEntity<String> removeProfilePhoto(@RequestParam("studentId") Long studentId) {
	        try {
	        	 Student profile = studentService.getStudentById(studentId);
	        	  profile.setPhoto(null);
		             studentService.saveStudent(profile);

	            return ResponseEntity.ok("Profile photo removed successfully.");
	        } catch (Exception e) {
	            return ResponseEntity.status(500).body("Error removing profile photo: " + e.getMessage());
	        }
	    }
	
	@GetMapping("/stud_profile1")
	public String getStudProfile(Model model) {
		List<College> colleges = collegeService.getAllColleges();

		List<Department> allDepartment = departmentService.getAllDepartment();
		List<Technologies> allTechnology = technologyService.getAllTechnology();
		model.addAttribute("colleges", colleges);
		model.addAttribute("defaultDepartments", allDepartment);
		model.addAttribute("technology", allTechnology);
		return "stud_profile1";

	}
	
	@PostMapping("/setExternalOrInternal")
	public String handleLogin(@ModelAttribute("users") User users, Model model, 
	        @RequestParam("role") String role,
	        @RequestParam(value = "college_id", required = false) Integer college_id,
	        @RequestParam(value = "dept", required = false) String dept, 
	        HttpSession session,
	        @RequestParam(value = "skills", required = false) String skills,
	        @RequestParam(value = "dob", required = false) LocalDate dob,
	        @RequestParam(value = "curr_city", required = false) String curr_city,
	        @RequestParam(value = "home_city", required = false) String home_city,
	        @RequestParam(value = "curr_enroll_no", required = false) String curr_enroll_no,
	        @RequestParam(value = "category", required = false) String category,
	        @RequestParam(value = "description", required = false) String description,
	        @RequestParam(value = "curr_year", required = false) String curr_year,
	        @RequestParam(value = "board", required = false) String board) {

	    User user = (User) session.getAttribute("user");

	    if (user == null) {
	        return "redirect:/login";
	    }

	    Long userId = user.getId();
	    user.setRole(role);
	    user.setUsername(users.getUsername());
	    user.setContact_no(users.getContact_no());
	    user.setGender(users.getGender());

	    userService.saveUser(user);

	    Student student = studentService.getStudentByUserId(userId);
	    if (student != null) {
	        student.setContact(users.getContact_no());
	        student.setStudent_name(users.getUsername());
	        student.setSkills(skills);
	        student.setD_o_b(dob);
	        student.setHome_city(home_city);
	        student.setCurr_city(curr_city);
	        student.setCreation_date(new Date());

	        studentService.saveStudent(student);

	        if ("0".equals(role)) { // **Check only if the user is a student**
	            StudentPast studentPast = new StudentPast();
	            studentPast.setStudent_id(userId);
	            studentPast.setCategory(category);
	            studentPast.setBoard(board);
	            student.setCurr_enroll_no(curr_enroll_no);
	            student.setCollege_id((long) college_id);
	            student.setDept(dept);
	            student.setCurr_year(curr_year);
	            user.setCollege_id(college_id);
	            user.setDepartment(Long.parseLong(dept));

	            College college = collegeService.getCollegeById((long) college_id);
	            Long depId = user.getDepartment();

	            List<User> collegeRelatedUser = userService.findByEmailAndRoleForNotification(college.getEmail_id(), depId);

	            studentPast.setOrganization(college.getCollege_name());
	            studentPast.setDescription(description);
	            studentPast.setDepartment(Long.parseLong(dept));
	            studentService.saveStudent(studentPast);

	            String body = "<h1 style=\"font-size:55px;margin:20px;text-align:center\">Welcome to <span style=\"color:#1974c3;\">Skill<span style=\"color:#01af36;\">Pilots</span></h1>"
	                    + "<p style=\"text-align:center\">New Student Registered.!! Please check In Skillpilot - <strong>"
	                    + "<p style=\"text-align:center\">Please Follow the link<br>"
	                    + "Click <a href=\"https://www.skillpilots.com\"><strong>here</strong></a>"
	                    + ProjectConstants.mail_footer;

	            userService.sendVerificationEmail(college.getEmail_id(), "New Notification From Skillpilot", body);

	            for (User relatedUser : collegeRelatedUser) {
	                userService.sendVerificationEmail(relatedUser.getEmail(), "New Notification From Skillpilot", body);
	            }

	            // **Payment Status Check for Students Only**
	            PaymentStatus paymentStatus = paymentStatusRepository.findByCollegeId((long) college_id);

	            if (paymentStatus != null) {
	                if ("college".equals(paymentStatus.getStatus())) {
	                    return "redirect:/confirm_current_edu"; // If college has paid, move to verification
	                } else if ("student".equals(paymentStatus.getStatus()) || paymentStatus.getStatus() == null) {
	                    return "redirect:/paymentpage"; // If student needs to pay or no status found
	                }
	            } else {
	                return "redirect:/paymentpage"; // Default to payment page if no payment status
	            }
	        }

	        studentService.saveStudent(student);
	        userService.saveUser(user);
	    } else {
	        System.out.println("No student found for User ID: " + userId);
	    }

	    if ("10".equals(role)) {
	        return "redirect:/dash";
	    }

	    return "redirect:/confirm_current_edu";
	}

	

	@RequestMapping(value = "/check_reg_code", method = RequestMethod.POST)
	public @ResponseBody String checregcode() {

		return "This Email-id is not registered!";
	}


	@RequestMapping("/confirm_current_edu")
	public String confirmCurrEd(Model model) {

		return "confirmStudCurrEdu";
	}

	@RequestMapping(value = "/confirm_current_edu", method = RequestMethod.POST)
	public String confirmurrEd(@RequestParam("confirm") String confirm, Model model) {
		if (confirm.equals("logout"))
			return "redirect:logout";
		model.addAttribute("confirm", confirm);
		return "redirect:stud_profile";
	}

	@RequestMapping("/stud_profile")
	public String studprofile() {

		return "stud_profile";

	}

	@GetMapping("/stud_profile2")
	public String stud_profile2(Model model) {
		List<Technologies> allTechnology = technologyService.getAllTechnology();
		model.addAttribute("technology", allTechnology);

		return "stud_profile2";

	}

	@PostMapping("/checkOldPassword")
	public ResponseEntity<Boolean> checkOldPassword(@RequestParam("oldPassword") String oldPassword) {
		User user = (User) session.getAttribute("user");
		System.out.println(user);
		if (user == null) {
			return ResponseEntity.status(HttpStatus.UNAUTHORIZED).body(false); // User not log
		}
		String password = user.getPassword();
 
		String storedPassword = user.getPassword();
		boolean oldPasswordCorrect = oldPassword.equals(storedPassword);
		return ResponseEntity.ok(oldPasswordCorrect);
	}

	@RequestMapping(value = "/add_stu", method = RequestMethod.POST)
	public String addStudent() {

		return "redirect:add_stu_past";
	}

	@RequestMapping("/add_stu_past")
	public String addpast() {

		return "student_past_education";
	}

	@PostMapping("/changepass")
	public String saveOrUpdateByEmail(@ModelAttribute("user") User user, Model model,
			RedirectAttributes redirectAttributes) {
		Optional<User> existingUserOptional = userRepository.findByEmail(user.getEmail());
		if (existingUserOptional.isPresent()) {
			User existingUser = existingUserOptional.get();
			existingUser.setPassword(user.getPassword()); 
			userRepository.save(existingUser);

		} 
		else 
		{
			userRepository.save(user);

		}
		model.addAttribute("success", MessageConstants.password_changed);
		return "redirect:/login_check";
	}


	
	
	
	@GetMapping("/cv1")
	public String showCVFirst(Model model, HttpSession session)
	{
	    User user = (User) session.getAttribute("user");
	    if (user == null)
	    {
	        return "redirect:/login";
	    }
	    Long userId = user.getId();
	    Student student = studentService.getStudentById(userId);
	    List<StudentPast> studentPastList = studentService.findAllByStudentIds(userId);
	    List<Internships> internshipList = internshipService.getPastOrPendingOrCancelledInternshipsOfStudent(userId, ProjectConstants.internships_status_completed);
	    model.addAttribute("student", student);
	    model.addAttribute("studentPast", studentPastList);
	    model.addAttribute("internship3", internshipList);
	    return "cv1";
	}
	
	
	@GetMapping("/cv2")
	public String showCVSecond(Model model, HttpSession session)
	{
	    User user = (User) session.getAttribute("user");
	    if (user == null)
	    {
	        return "redirect:/login";
	    }
	    Long userId = user.getId();
	    Student student = studentService.getStudentById(userId);
	    List<StudentPast> studentPastList = studentService.findAllByStudentIds(userId);
	    List<Internships> internshipList = internshipService.getPastOrPendingOrCancelledInternshipsOfStudent(userId, ProjectConstants.internships_status_completed);
	    model.addAttribute("student", student);
	    model.addAttribute("studentPast", studentPastList);
	    model.addAttribute("internship3", internshipList);
	    return "cv2";
	}
	
	
	@GetMapping("/cv3")
	public String showCVThird(Model model, HttpSession session)
	{
	    User user = (User) session.getAttribute("user");
	    if (user == null)
	    {
	        return "redirect:/login";
	    }
	    Long userId = user.getId();
	    Student student = studentService.getStudentById(userId);
	    List<StudentPast> studentPastList = studentService.findAllByStudentIds(userId);
	    List<Internships> internshipList = internshipService.getPastOrPendingOrCancelledInternshipsOfStudent(userId, ProjectConstants.internships_status_completed);
	    model.addAttribute("student", student);
	    model.addAttribute("studentPast", studentPastList);
	    model.addAttribute("internship3", internshipList);
	    return "cv3";
	}
	
	@GetMapping("/editCV1")
	public String editCVFirst(Model model, HttpSession session)
	{
	    User user = (User) session.getAttribute("user");
	    if (user == null)
	    {
	        return "redirect:/login";
	    }
	    Long userId = user.getId();
	    Student student = studentService.getStudentById(userId);
	    List<StudentPast> studentPastList = studentService.findAllByStudentIds(userId);
	    List<Internships> internshipList = internshipService.getPastOrPendingOrCancelledInternshipsOfStudent(userId, ProjectConstants.internships_status_completed);
	    model.addAttribute("student", student);
	    model.addAttribute("studentPast", studentPastList);
	    model.addAttribute("internship3", internshipList);
	    return "editCV1";
	}
	
	@GetMapping("/student/photo/{id}")
	public ResponseEntity<byte[]> getStudentPhoto(@PathVariable("id") Long studentId) {
	    Student student = studentService.getStudentById(studentId); // Replace with your method
	    if (student != null && student.getPhoto() != null) {
	        return ResponseEntity
	                .ok()
	                .header("Content-Type", "image/jpeg") // or "image/png" based on your upload type
	                .body(student.getPhoto());
	    } else {
	        return ResponseEntity.notFound().build();
	    }
	}
	
	
	@PostMapping("/updateResume")
	public String updateCV(@ModelAttribute Student student,
			 @RequestParam(value="internship_id", required=false) List<Long> internshipIds,
             @RequestParam(value="companyName", required=false) List<String> companyNames,
             @RequestParam(value= "technology",required=false) List<String> technologies,
             @RequestParam(value="duration", required=false) List<Integer> durations,
			               HttpSession session)
	{
	    User user = (User) session.getAttribute("user");
	    if (user == null)
	    	return "redirect:/login";
	    Student existingStudent = studentService.getStudentByUserId(user.getId());
	   
	    if (existingStudent != null)
	    {
	    	if (internshipIds != null && !internshipIds.isEmpty())
	       {
	        // Update internships
	        for (int i = 0; i < internshipIds.size(); i++)
	        {
	            Internships internship = internshipService.getInternship(internshipIds.get(i));
	            if (internship != null)
	            {
	                internship.setCompanyName(companyNames.get(i));
	                internship.setTechnology(technologies.get(i));
	                internship.setDuration(durations.get(i));
	                internship.setDate_started(new Date());
	                internship.setDate_completed(new Date());
	                internship.setUpdation_date(LocalDate.now());
	                System.out.println("Internship data:"+internship);
	                internshipService.saveInternship(internship);
	            }
	        }
	       }
	        studentService.saveStudent(existingStudent);
	    }
  
	    if (existingStudent == null)
	    {
	        student.setCreation_date(new Date());
	        for (StudentPast past : student.getStudentPast())
	        {
	            past.setStudent(student);
	            past.setCreation_date(new Date());
	            past.setStudent_id(student.getStudent_id());
	        }
	        studentService.saveStudent(student);
	    } 
	    if (existingStudent != null)
	    {
	    	existingStudent.setPhoto(student.getPhoto());
	        existingStudent.setStudent_name(student.getStudent_name());
	        existingStudent.setEmail_id(student.getEmail_id());
	        existingStudent.setContact(student.getContact());
	        existingStudent.setCurr_city(student.getCurr_city());
	        existingStudent.setD_o_b(student.getD_o_b());
	        existingStudent.setSkills(student.getSkills());
	        existingStudent.setUpdation_date(new Date());
	        
	        
	        
	        existingStudent.getStudentPast().clear();

	        for (StudentPast past : student.getStudentPast())
	        {
	            past.setStudent(existingStudent);
	            past.setStudent_id(existingStudent.getStudent_id());
	            past.setUpdation_date(new Date());
	            existingStudent.getStudentPast().add(past);
	        }
	      
	        studentService.saveStudent(existingStudent);
	    }
	    return "redirect:/cv1";
	}
	 @PostMapping("/update-college-photo")
	 public String updateCollegeProfilePhoto(@RequestParam("newPhoto") MultipartFile file, HttpSession session) {
	     try {
	    	
	
	    	
	         User college = (User) session.getAttribute("user");
	         College college1 = collegeService.getCollegeByEmail(college.getEmail());
	         College profile = collegeService.getCollegeById(college1.getCollege_id());
	         profile.setLogo(file.getBytes());
	         System.out.println("Photo:"+profile);
	         collegeService.saveCollege(profile);
	         return "redirect:/editCollegeProfile";
	     } catch (Exception e) {
	         return "redirect:/editCollegeProfile";
	     }
	 }
	
	 @PostMapping("/remove-college-photo")
	 public ResponseEntity<Map<String, Object>> removeCollegeProfilePhoto(HttpSession session) {
	     Map<String, Object> response = new HashMap<>();
	     try {
	         User collegeUser = (User) session.getAttribute("user");
	         College profile = collegeService.getCollegeByEmail(collegeUser.getEmail());
	         profile.setLogo(null);
	         collegeService.saveCollege(profile);
	         response.put("success", true);
	         return ResponseEntity.ok(response);
	     } catch (Exception e) {
	         response.put("success", false);
	         response.put("message", e.getMessage());
	         return ResponseEntity.status(500).body(response);
	     }
	 }
	 @GetMapping("/get_logo1")
	 public void getCollegeLogo(HttpSession session, HttpServletResponse response) throws IOException {
	     User collegeUser = (User) session.getAttribute("user");
	     College college = collegeService.getCollegeByEmail(collegeUser.getEmail());
	     byte[] logo = college.getLogo();
	     if (logo != null) {
	         response.setContentType("image/jpeg");
	         response.getOutputStream().write(logo);
	         response.getOutputStream().flush();
	     } else {
	         // Optional: return a default placeholder image
	         response.sendRedirect("/images/default.jpg"); // replace with your static fallback image path
	     }
	 }
	
	
	
	
	
	// company profile photo
	
	 @PostMapping("/update-company-photo")
	 public String updateCompanyProfilePhoto(@RequestParam("newPhoto") MultipartFile file, HttpSession session) {
	     try {
	         User company =  (User) session.getAttribute("user");
	         Company company2 = componyService.getCompanyById(company.getEmail());
	         Company profile = componyService.getCompany(company2.getCompany_id());
	         profile.setLogo(file.getBytes());
	         componyService.saveCompony(profile);
	         return "redirect:/editCompProfile";
	     } catch (Exception e) {
	         return "redirect:/editCompProfile";
	     }
	 }
	
	 @PostMapping("/remove-company-photo")
	 public ResponseEntity<Map<String, Object>> removeCompanyProfilePhoto(HttpSession session) {
	     Map<String, Object> response = new HashMap<>();
	     try {
	         User company =  (User) session.getAttribute("user");
	         Company companyData = componyService.getCompanyById(company.getEmail());
	         Company profile = componyService.getCompany(companyData.getCompany_id());
	         profile.setLogo(null);
	         componyService.saveCompony(profile);
	         response.put("success", true);
	         return ResponseEntity.ok(response);
	     } catch (Exception e) {
	         response.put("success", false);
	         response.put("message", e.getMessage());
	         return ResponseEntity.status(500).body(response);
	     }
	 }
	 @GetMapping("/get_logo2")
	 public void getCompanyLogo(HttpServletResponse response, HttpSession session) throws IOException {
	     User companyUser = (User) session.getAttribute("user");
	     if (companyUser != null) {
	         Company company = componyService.getCompanyById(companyUser.getEmail());
	         byte[] logo = company.getLogo();
	         if (logo != null) {
	             response.setContentType("image/jpeg"); // or "image/png" if it's PNG
	             response.getOutputStream().write(logo);
	             response.getOutputStream().flush();
	             return;
	         }
	     }
	     // fallback if logo is null
	     InputStream defaultImage = getClass().getResourceAsStream("/static/images/default-logo.png");
	     if (defaultImage != null) {
	         response.setContentType("image/png");
	         IOUtils.copy(defaultImage, response.getOutputStream());
	         response.getOutputStream().flush();
	     }
	 }

}
