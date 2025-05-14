package com.skillpilots.controller.other;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.skillpilots.model.NotificationRequest;
import com.skillpilots.model.StudentRequest;
import com.skillpilots.model.User;
import com.skillpilots.service.NotificationService;
import com.skillpilots.service.StudentRequestService;
import com.skillpilots.service.StudentService;
import com.skillpilots.service.UserService;
import com.skillpilots.utility.FirebaseService;
import com.skillpilots.utility.ProjectConstants;

@Controller
public class NotificationsController {


	@Autowired
	private NotificationService notificationService;
	
	@Autowired
	private StudentRequestService studentRequestService;
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private StudentService studentService;
	@Autowired
	private FirebaseService firebaseService;

	@GetMapping("/getNotif")
	@ResponseBody
	public List<NotificationRequest> getNotifications(@RequestParam Long id,Model model) {
		List<NotificationRequest> notifications = notificationService.getNotifications(id);
	
		
		return notifications;
	}


	// get notifications by shrunkhal 17/01/25
		@GetMapping("/notifications")
		@ResponseBody
		public List<NotificationRequest> getNotifications(@RequestParam Long id) {
			return notificationService.getNotifications(id);
		}

		
		// read notifications by shrunkhal 17/01/25  

		@PostMapping("/notifications/read/{id}")
		@ResponseBody
		public ResponseEntity<?> markAsRead(@PathVariable Long id) {
			return notificationService.markAsRead(id)
					.map(notification -> ResponseEntity.ok().body("Notification marked as read"))

					.orElse(ResponseEntity.status(404).body("Notification not found"));
		}

		@PostMapping("/api/approve-student")
		@ResponseBody
		public ResponseEntity<String> approveStudent(
		    @RequestParam(value = "pdfFile", required = false) MultipartFile pdfFile,
		    @RequestParam("request_id") Long requestId
		) {
		    try {
		        String filePath = null;

		        if (pdfFile != null && !pdfFile.isEmpty()) {
		            filePath = saveOfferLetterToDatabase(pdfFile, requestId);
		        }

		        // Send the offer letter email if a file was uploaded
		        if (filePath != null) {
		            sendOfferLetterEmail(requestId, filePath);
		        }else {
		            sendOfferLetterEmail(requestId, filePath);

		        }

		       

		        return ResponseEntity.ok("Student approved successfully.");
		    } catch (Exception e) {
		        return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("Error: " + e.getMessage());
		    }
		}

		private String saveOfferLetterToDatabase(MultipartFile pdfFile, Long requestId) throws IOException {	
		    String uploadDirectory;
		    if (System.getenv("ENV") != null && System.getenv("ENV").equalsIgnoreCase("LIVE")) {
		        // Use live directory path for production
		        uploadDirectory = "/var/www/html/study-material";
		    } else {
		        // Use local directory for development/testing
		        uploadDirectory = "uploads";
		    }

		    Path uploadPath = Paths.get(uploadDirectory).toAbsolutePath().normalize();
		    Files.createDirectories(uploadPath);

		    // Sanitize the original file name
		    String originalFileName = pdfFile.getOriginalFilename();
		    if (originalFileName == null || originalFileName.isEmpty()) {
		        throw new IOException("File name is invalid.");
		    }
		    String sanitizedFileName = originalFileName.replaceAll("\\s+", "_");

		    // Define the file path
		    Path filePath = uploadPath.resolve(sanitizedFileName);

		    // Save the file to the path
		    Files.copy(pdfFile.getInputStream(), filePath, StandardCopyOption.REPLACE_EXISTING);

		   
		    return filePath.toString();
		}


		private void sendOfferLetterEmail(Long requestId, String filePath) {
		    StudentRequest approveStudentRequest = studentRequestService.approveStudentRequest(requestId);
		    approveStudentRequest.setApproval_status("A");
		    approveStudentRequest.setUpdation_date(new Date());

		    // Get the user's information
		    User user = userService.getUserById(approveStudentRequest.getStudent_id());

		    String offerLetterMessage = (filePath != null && !filePath.isEmpty())
		            ? "Here is your offer letter attached for your reference."
		            : "You can log in to your account to view further details of your internship opportunity.";

		    String subject = (filePath != null && !filePath.isEmpty())
		            ? "Internship Approved: Offer Letter Attached"
		            : "Internship Approved: Check Your Details";		 
		    String mailBody = "<h1 style=\"font-size:55px;margin:20px;text-align:center\">"
		            + "<span style=\"color:#1974c3;\">Skill<span style=\"color:#01af36;\">Pilots</span></h1>"
		            + "<p style=\"text-align:center\">Dear <strong style=\"color:#414ea4\">" + user.getUsername() + "</strong>,<br>"
		            + "We are pleased to inform you that your internship request has been <strong style=\"color:#01af36;\">Approved</strong> with <strong style=\"color:#414ea4\"><a href=\"http://www.skillpilots.com\" style=\"color:#414ea4; text-decoration:none;\">SkillPilots</a></strong>!<br>"
		            + offerLetterMessage + "</p>"
		            + "<p style=\"text-align:center\">If you have any questions, feel free to reach out to us at <strong style=\"color:#414ea4\"><a href=\"http://www.skillpilots.com\" style=\"color:#414ea4; text-decoration:none;\">SkillPilots</a></strong>.<br>"
		            + "Best of luck with your internship!</p>"
		            + ProjectConstants.mail_footer;

		    // Send email with or without attachment
		    if (filePath != null && !filePath.isEmpty()) {
		        userService.sendEmailWithAttachment(user.getEmail(), subject, mailBody, filePath);
		    } else {
		        userService.sendVerificationEmail(user.getEmail(), subject, mailBody);
		    }

		    // Send notification if applicable
		    if (user.getNotificationToken() != null && !user.getNotificationToken().isEmpty()) {
		        firebaseService.sendNotification(user.getNotificationToken(), "Request Approved", "Your internship request has been approved by the company.");
		    }

		    // Save the updated request
		    studentRequestService.saveRequest(approveStudentRequest);
		}


		
		@PostMapping("/send-support-notification")
		@ResponseBody
		public String sendSupportNotification(@RequestParam String phone) {
		    try {
		        String toEmail = "shrunkhal4@gmail.com";
		        String subject = "User Request ";

		        String htmlBody = "<html><body>" +
		                "<h3>User Notification</h3>" +
		                "<p><strong>Phone Number:</strong> " + phone + "</p>" +
		                "<p>Please reach out to the user as soon as possible.</p>" +
		                "<hr><small>SkillPilots Support Bot</small>" +
		                "</body></html>";

		        userService.sendVerificationEmail(toEmail, subject, htmlBody);
		        return "Email sent successfully";
		    } catch (Exception e) {
		        e.printStackTrace();
		        return "Failed to send email";
		    }
		}


}