package com.skillpilots.controller.other;

import java.io.IOException;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.Random;
//
//import javax.mail.BodyPart;
//import javax.mail.MessagingException;
//import javax.mail.internet.MimeBodyPart;
//import javax.servlet.http.HttpServletResponse;
//import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.skillpilots.model.Company;
import com.skillpilots.model.User;
import com.skillpilots.service.ComponyService;
import com.skillpilots.service.UserBeanService;
import com.skillpilots.service.UserService;
import com.skillpilots.utility.MessageConstants;
import com.skillpilots.utility.ProjectConstants;

import jakarta.mail.BodyPart;
import jakarta.mail.MessagingException;
import jakarta.mail.internet.MimeBodyPart;
import jakarta.servlet.http.HttpSession;

@Controller
public class UserController {
	@Autowired
	private HttpSession session;
	@Autowired
	private UserService userService;
	@Autowired
	private ComponyService componyService;

	@Autowired
	private UserBeanService userBeanService;

	@GetMapping("/ass")
	public String assesement() {
		return "assessment_test";

	}

	@RequestMapping(value = "/change_password", method = RequestMethod.GET)
	public String changepass(Model model) {

		return "change_password";

	}

	@RequestMapping("/editUserProfile")
	public String updateuser(Model model) {
		User user1 = (User) session.getAttribute("user");

		if (user1 == null) {
			return "redirect:/editUserProfile";
		}
		if (user1.getRole().equals("1")) {
			User user2 = userService.findByEmailAndRole("2", user1.getEmail());
			model.addAttribute("user2", user2);
			User user = userService.getUserById(user1.getId());

			model.addAttribute("user", user);

		} else if (user1.getRole().equals("5")) {
			User user2 = userService.findByEmailAndRole("6", user1.getEmail());
			model.addAttribute("user2", user2);
			User user = userService.getUserById(user1.getId());

			model.addAttribute("user", user);
		} else {
			User user = userService.getUserById(user1.getId());

			model.addAttribute("user2", user);

		}

		return "editUserProfile";
	}

	@PostMapping("/editUserProfile")
	public String editUser(@ModelAttribute User user, String username, Long contact_no,
			@RequestParam(value = "email_id", required = false) String email_id,
			@RequestParam(value = "gender", required = false) String gender,
			@RequestParam(value = "hrSign", required = false) MultipartFile hrSign) throws IOException {

		// Get the current user from session
		User user1 = (User) session.getAttribute("user");
		if (user1 == null) {
			return "redirect:/logout";
		}

		User user2;

		// Check if role is "1" (Admin)
		if (user1.getRole().equals("1")) {
			user2 = userService.findByEmailAndRole("2", user1.getEmail());

			// Set the email if provided (ensure it's valid)
			if (email_id != null && !email_id.isEmpty()) {
				user2.setEmail(email_id);
			}

			// Generate the email body for HR assignment
			String candidateMailBody = "<h1 style=\"font-size:55px;margin:20px;text-align:center\">"
					+ "<span style=\"color:#1974c3;\">Skill<span style=\"color:#01af36;\">Pilots</span></h1>"
					+ "<p style=\"text-align:center\"><strong style=\"color:#414ea4\"> Dear " + user.getName()
					+ ",</strong></p>"
					+ "<p style=\"text-align:center\">Congratulations! You have been assigned as the HR representative for the company <strong>"
					+ user1.getUsername() + "</strong>.</p>"
					+ "<p style=\"text-align:center\">Your temporary password has been generated for accessing the Portal. Here are the details:</p>"
					+ "<p style=\"text-align:center\"><strong>Temporary Password:</strong> <span style=\"font-size:20px;color:#e84c3d;\">"
					+ generateTempPassword(user.getName()) + "</span></p>"
					+ "<p style=\"text-align:center\">Please log in using this temporary password and change it to a secure one at your earliest convenience.</p>"
					+ "<p style=\"text-align:center\">If you have any questions or need assistance, feel free to reach out to us.</p>"
					+ "<p style=\"text-align:center\">Best regards,<br>The SkillPilots Team</p>"
					+ ProjectConstants.mail_footer;

			// Generate temporary password
			user2.setPassword(generateTempPassword(user.getName()));
			user2.setGender(gender);
			// Send verification email with new password
			userService.sendVerificationEmail(email_id, "HR Login !", candidateMailBody);
		}

		// Check if role is "5" (T&P Representative)
		else if (user1.getRole().equals("5")) {
			user2 = userService.findByEmailAndRole("6", user1.getEmail());
			if (email_id != null && !email_id.isEmpty()) {
				user2.setEmail(email_id);
			}

			// Generate the email body for T&P assignment
			String candidateMailBody = "<h1 style=\"font-size:55px;margin:20px;text-align:center\">"
					+ "<span style=\"color:#1974c3;\">Skill<span style=\"color:#01af36;\">Pilots</span></h1>"
					+ "<p style=\"text-align:center\"><strong style=\"color:#414ea4\"> Dear " + user.getName()
					+ ",</strong></p>"
					+ "<p style=\"text-align:center\">Congratulations! You have been assigned as the T&P representative for the College <strong>"
					+ user2.getUsername() + "</strong>.</p>"
					+ "<p style=\"text-align:center\">Your temporary password has been generated for accessing the Portal. Here are the details:</p>"
					+ "<p style=\"text-align:center\"><strong>Temporary Password:</strong> <span style=\"font-size:20px;color:#e84c3d;\">"
					+ generateTempPassword(user.getName()) + "</span></p>"
					+ "<p style=\"text-align:center\">Please log in using this temporary password and change it to a secure one at your earliest convenience.</p>"
					+ "<p style=\"text-align:center\">If you have any questions or need assistance, feel free to reach out to us.</p>"
					+ "<p style=\"text-align:center\">Best regards,<br>The SkillPilots Team</p>"
					+ ProjectConstants.mail_footer;

			// Send verification email to user2 (T&P Rep)
			userService.sendVerificationEmail(email_id, "T&P Login !", candidateMailBody);
			user2.setGender(gender);

			// Generate temporary password for user2
			user2.setPassword(generateTempPassword(user.getName()));
		} else {
			// For other roles, fetch the user by ID
			user2 = userService.getUserById(user1.getId());
		}

		// Update username and contact number
		user2.setUsername(username);
		user2.setContact_no(contact_no);

		// Check if hrSign is not null and not empty, then update the signature
		if (hrSign != null && !hrSign.isEmpty()) {
			System.out.println("Uploading Signature");
			byte[] bytes = hrSign.getBytes();
			user2.setSignature(bytes);
		}

		// Save the updated user
		userService.saveUser(user2);

		// Redirect to the edit user profile page
		return "redirect:/editUserProfile";
	}

	public String generateTempPassword(String userName) {
		// Generate a simple temporary password based on the user's name (you can modify
		// this as needed)
		return userName.substring(0, 3).toUpperCase() + "123!"; // Example: "Joh123!"
	}

	@RequestMapping("/forgot_password")
	public String forgetPassword(@RequestParam(value = "error", required = false) String error, Model model) {
		model.addAttribute("error", error);
		return "forgotPassword";
	}

	@RequestMapping(value = "/forgot_password", method = RequestMethod.POST)
	public String forgetUserPassword(@RequestParam("email_id") String email_id, Model model,
			RedirectAttributes redirectAttributes) {
		User user = userService.getUserByemail(email_id);

		if (null != user) {

//			if (!user.isAcc_verified()) {
//				model.addAttribute("error", MessageConstants.acc_not_verified);
//				return "redirect:forgot_password";
//			}
			// set new password
			Random random = new Random();
			String password = user.getUsername().substring(0, 2) + "" + random.nextInt(100000);
			password = password.replaceAll("\\s", "");
			// user.setPsswrd_data(userBeanService.encryptWithMD5(password));
			user.setPassword(password);
			user.setTemp_pass(ProjectConstants.reg_user_temp_pass_yes);

			// send new password on email-id
			BodyPart txt = new MimeBodyPart(), img = new MimeBodyPart();
			String body = "<h1 style=\"font-size:55px;margin:20px;text-align:center\">Welcome to <span style=\"color:#1974c3;\">Skill<span style=\"color:#01af36;\">Pilot</span> </h1>"
					+ "<p style=\"text-align:center\">The login password for your Skillpilots account has been reset to - <strong>"
					+ password + "</strong><br>"
					+ "You'll be asked to change the temporary password on your login for security reasons.<br></p>"
					+ ProjectConstants.mail_footer;
			// CommonUtil.SendSms("Hello "+user.getUsername()+" Your New Password Is
			// "+password+"", user.getContact_no());
			// CommonUtil.SendSms("Your Forget Password for Otp is :"+password+" Thank You",
			// user.getContact_no());
			// DataSource fds = new
			// FileDataSource(ProjectConstants.server_img_internsorbit_png);
			int status = 0;
			try {
				txt.setContent(body, "text/html");
				// img.setDataHandler(new DataHandler(fds));
				// img.setHeader("Content-ID", "<image>");
				userBeanService.sendMimeMail(ProjectConstants.mail_from, user.getEmail(),
						ProjectConstants.mail_subject_forgot_pass, body);

//				userService.sendVerificationEmail(user.getEmail(), ProjectConstants.mail_from,body);

				userService.save(user);
				model.addAttribute("message", MessageConstants.new_pass_sent);
				model.addAttribute("user", new User());
				redirectAttributes.addFlashAttribute("forPass", MessageConstants.new_pass_sent);

				return "redirect:login_check";
			} catch (MessagingException e) {
				e.printStackTrace();
				model.addAttribute("erorr", "Server Error! Please try after sometime.");
				return "redirect:login";
			}

		} else {
			model.addAttribute("error", MessageConstants.user_not_found_with_email);
			return "redirect:login_check";
		}
	}

	@GetMapping("/changeTempPass")
	public String changePass() {
		return "changePass";

	}

	@GetMapping("/getUser")
	public @ResponseBody User getuser(@RequestParam("id") Long id) {
		User user = userService.getUserById(id);
		return user;
	}

	@GetMapping("/getSignature")
	@ResponseBody
	public ResponseEntity<Map<String, byte[]>> getSignatureDate(@RequestParam("id") Long id) {
		// User user = (User) session.getAttribute("user");
		byte[] signature = null;
		Company company = componyService.getCompany(id);
		User user = userService.findByEmailAndRole("2", company.getEmail_id());
		if (user != null) {
			signature = user.getSignature(); // Assuming getSignatureDate() returns a date
		}
		Map<String, byte[]> response = new HashMap<>();
		response.put("signature", signature);
		return ResponseEntity.ok(response);
	}
}
