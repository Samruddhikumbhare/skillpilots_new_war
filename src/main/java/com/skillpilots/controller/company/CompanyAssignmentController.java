package com.skillpilots.controller.company;

import java.io.IOException;
import java.net.MalformedURLException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.time.LocalDateTime;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.Resource;
import org.springframework.core.io.UrlResource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.server.ResponseStatusException;

import com.skillpilots.model.CompanyAssignment;
import com.skillpilots.model.NotificationRequest;
import com.skillpilots.model.SolvedAssignments;
import com.skillpilots.model.User;
import com.skillpilots.repository.CompanyAssignmentRepo;
import com.skillpilots.repository.SolvedAssignmentRepo;
import com.skillpilots.service.CompanyAssignmentService;
import com.skillpilots.service.NotificationService;
import com.skillpilots.service.UserService;
import com.skillpilots.utility.FirebaseService;
import com.skillpilots.utility.ProjectConstants;

import jakarta.servlet.http.HttpSession;

@Controller
public class CompanyAssignmentController {
	private UserService userService;
	@Autowired
	private FirebaseService firebaseService;
	@Autowired
	private NotificationService notificationService;
	@Autowired
	private CompanyAssignmentRepo assignmentRepo;
	@Autowired
	private CompanyAssignmentService assignmentService;
	@Autowired
	private HttpSession session;
	@Autowired
	private SolvedAssignmentRepo solvedAssignmentRepo;
	@GetMapping("/viewAssignments")
	public String assignments(Model model) {
		User user=(User) session.getAttribute("user");
		List<Map<String, Object>> assignmentDetailsByStudent = assignmentService.getAssignmentDetailsByStudent(user.getId());
		
		model.addAttribute("materials", assignmentDetailsByStudent);
		
		return "viewAssignments";
		
	}
	
	
	// upload assignments by manager 24/01/25
	@PostMapping("/uploadAssignment")
	public ResponseEntity<String> uploadAssignment(
	        @RequestParam("studentId") Long studentId,
	        @RequestParam("title") String title,
	        @RequestParam(value = "description", required = false) String description,
	        @RequestParam(value = "assignmentFile", required = false) MultipartFile file,
	        @RequestParam("companyId") Long companyId) {
	    try {
	        String uploadDirectory = System.getenv("ENV") != null && System.getenv("ENV").equalsIgnoreCase("LIVE")
	                ? "/var/www/html/study-material"
	                : "uploads";

	        Path uploadPath = Paths.get(uploadDirectory).toAbsolutePath().normalize();
	        Files.createDirectories(uploadPath);

	        // Handle file upload
	        if (file == null || file.isEmpty()) {
	            return ResponseEntity.badRequest().body("No file uploaded");
	        }

	        String originalFileName = file.getOriginalFilename();
	        if (originalFileName == null || originalFileName.isEmpty()) {
	            throw new IOException("Invalid file name");
	        }

	        String sanitizedFileName = originalFileName.replaceAll("\\s+", "_");
	        Path filePath = uploadPath.resolve(sanitizedFileName);
	        int counter = 1;
	        while (Files.exists(filePath)) {
	            String baseName = sanitizedFileName.contains(".")
	                    ? sanitizedFileName.substring(0, sanitizedFileName.lastIndexOf('.'))
	                    : sanitizedFileName;
	            String extension = sanitizedFileName.contains(".")
	                    ? sanitizedFileName.substring(sanitizedFileName.lastIndexOf('.'))
	                    : "";
	            sanitizedFileName = baseName + "_" + counter + extension;
	            filePath = uploadPath.resolve(sanitizedFileName);
	            counter++;
	        }

	        Files.copy(file.getInputStream(), filePath, StandardCopyOption.REPLACE_EXISTING);

	        CompanyAssignment companyAssignment = new CompanyAssignment();
	        companyAssignment.setName(title);
	        companyAssignment.setDescription(description);
	        companyAssignment.setFilePath(sanitizedFileName);
	        companyAssignment.setStudentId(studentId);
	        companyAssignment.setCompanyId(companyId);
	        assignmentRepo.save(companyAssignment);
	        User user = userService.getUserById(studentId);

	        NotificationRequest notificationRequest = new NotificationRequest();
	        notificationRequest.setMsgBody("You have Assigned New Assignment!");
	        notificationRequest.setDateTime(LocalDateTime.now());
	        notificationRequest.setReceiverId(user.getId());
	        notificationRequest.setSenderId(companyId);
	        notificationRequest.setTopic("Assignment Received!");
	        notificationService.addNotification(notificationRequest);

	        String mailBody = "<h1 style=\"font-size:55px;margin:20px;text-align:center\">"
	                + "<span style=\"color:#1974c3;\">Skill<span style=\"color:#01af36;\">Pilots</span></h1>"
	                + "<p style=\"text-align:center\">Dear <strong style=\"color:#414ea4\">" + user.getUsername() + "</strong>,<br>"
	                + "We are excited to inform you that you have received a <strong style=\"color:#01af36;\">new assignment</strong> on <strong style=\"color:#414ea4\"><a href=\"http://www.skillpilots.com\" style=\"color:#414ea4; text-decoration:none;\">SkillPilots</a></strong>!<br></p>"
	                + "<p style=\"text-align:center\"><strong>Assignment Details:</strong><br>"
	                + "<strong>Title:</strong> " + title + "<br>"
	                + "<strong>Description:</strong> " + (description != null ? description : "No description provided") + "</p>"
	                + "<p style=\"text-align:center\">Please log in to your SkillPilots dashboard to view the assignment and submit it before the deadline.</p>"
	                + "<p style=\"text-align:center\">For any questions, feel free to reach out to us at <strong style=\"color:#414ea4\"><a href=\"http://www.skillpilots.com\" style=\"color:#414ea4; text-decoration:none;\">SkillPilots</a></strong>.<br>"
	                + "We wish you all the best with your learning journey!</p>"
	                + ProjectConstants.mail_footer;

	        userService.sendVerificationEmail(user.getEmail(),"New Assignment Received!", mailBody);

	        return ResponseEntity.ok("Assignment uploaded and student notified successfully");
	    } catch (IOException e) {
	        e.printStackTrace();
	        return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("Failed to upload file");
	    } catch (Exception e) {
	        e.printStackTrace();
	        return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("An unexpected error occurred");
	    }
	}

	
	
	// download
	@GetMapping("/download/{fileName:.+}")
	public ResponseEntity<Resource> serveFile(@PathVariable String fileName) {
		 String baseDirectory;
		    if (System.getenv("ENV") != null && System.getenv("ENV").equalsIgnoreCase("LIVE")) {
		        // Use live directory path for production
		        baseDirectory = "/var/www/html/study-material";
		    } else {
		        // Use local directory for development/testing
		        baseDirectory = "uploads";
		    }
		
		Path filePath = Paths.get(baseDirectory).resolve(fileName).normalize();
	    Resource resource = null;
		try {
			resource = new UrlResource(filePath.toUri());
		} catch (MalformedURLException e) {
			e.printStackTrace();
		}
	    if (!resource.exists()) {
	        throw new ResponseStatusException(HttpStatus.NOT_FOUND, "File not found");
	    }
	    return ResponseEntity.ok()
	            .contentType(MediaType.APPLICATION_OCTET_STREAM)
	            .header(HttpHeaders.CONTENT_DISPOSITION, "inline; filename=\"" + fileName + "\"")
	            .body(resource);
	}




	
	// 24/01/25 for upload solved assignment by student
	@PostMapping("/uploadSolvedAssignment")
	public ResponseEntity<String> solvedAssignment(
	        @RequestParam("studentId") Long studentId,
	        @RequestParam(value = "assignmentFile", required = false) MultipartFile file,
	        @RequestParam("companyId") Long companyId) {
	    try {
	        // Determine the upload directory
	        String uploadDirectory = System.getenv("ENV") != null && System.getenv("ENV").equalsIgnoreCase("LIVE")
	                ? "/var/www/html/study-material"
	                : "uploads";

	        Path uploadPath = Paths.get(uploadDirectory).toAbsolutePath().normalize();
	        Files.createDirectories(uploadPath);

	        if (file == null || file.isEmpty()) {
	            return ResponseEntity.badRequest().body("No file uploaded");
	        }

	        String originalFileName = file.getOriginalFilename();
	        if (originalFileName == null || originalFileName.isEmpty()) {
	            throw new IOException("Invalid file name");
	        }

	        String sanitizedFileName = originalFileName.replaceAll("\\s+", "_");
	        Path filePath = uploadPath.resolve(sanitizedFileName);
	        int counter = 1;
	        while (Files.exists(filePath)) {
	            String baseName = sanitizedFileName.contains(".")
	                    ? sanitizedFileName.substring(0, sanitizedFileName.lastIndexOf('.'))
	                    : sanitizedFileName;
	            String extension = sanitizedFileName.contains(".")
	                    ? sanitizedFileName.substring(sanitizedFileName.lastIndexOf('.'))
	                    : "";
	            sanitizedFileName = baseName + "_" + counter + extension;
	            filePath = uploadPath.resolve(sanitizedFileName);
	            counter++;
	        }

	        Files.copy(file.getInputStream(), filePath, StandardCopyOption.REPLACE_EXISTING);

	        SolvedAssignments solvedAssignments = new SolvedAssignments();
	        solvedAssignments.setCompanyId(companyId);
	        solvedAssignments.setStudentId(studentId);
	        solvedAssignments.setUploadUrl(sanitizedFileName);
	        solvedAssignmentRepo.save(solvedAssignments);
	        return ResponseEntity.ok("Assignment uploaded and student notified successfully");

	    } catch (IOException e) {
	        e.printStackTrace();
	        return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("Failed to upload file");
	    } catch (Exception e) {
	        e.printStackTrace();
	        return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("An unexpected error occurred");
	    }
	}
	
	
	// get solved assiments by students 
	@GetMapping("/solved-assignments/{studentId}")
	public ResponseEntity<?> getSolvedAssignmentByStudent(@PathVariable Long studentId) {
	    SolvedAssignments solvedAssignment = solvedAssignmentRepo.findByStudentId(studentId);

	    if (solvedAssignment!=null) {

	        Map<String, Object> response = new HashMap<>();
	        response.put("message", "Solved assignment found.");
	        response.put("fileName", solvedAssignment.getUploadUrl());

	        return ResponseEntity.ok(response);
	    } else {
	        return ResponseEntity.status(HttpStatus.NOT_FOUND)
	                .body("No solved assignment found for student ID: " + studentId);
	    }
	}


}
