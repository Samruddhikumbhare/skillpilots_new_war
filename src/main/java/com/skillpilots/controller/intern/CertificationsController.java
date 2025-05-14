package com.skillpilots.controller.intern;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.Resource;
import org.springframework.core.io.UrlResource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.skillpilots.model.Certifications;
import com.skillpilots.model.CompanyStudyMaterial;
import com.skillpilots.model.Student;
import com.skillpilots.model.User;
import com.skillpilots.repository.CertificateRepository;
import com.skillpilots.repository.CertificationsRepository;
import com.skillpilots.repository.StudentRepository;

import jakarta.servlet.http.HttpSession;

@Controller
public class CertificationsController {

	@Autowired
	private CertificationsRepository certificateRepository;
	@Autowired
	private HttpSession session;
	@Autowired
	private StudentRepository studentRepository;

	// add external certificate for student - shrunkhal 2/04/25
	@ResponseBody
	@PostMapping("/addCertificate")
	public Certifications uploadCertification(

			@RequestParam("name") String name, @RequestParam("issueDate") String issueDate,
			@RequestParam("companyName") String companyName,
			@RequestParam(value = "certificateFile", required = false) MultipartFile file,
			@RequestParam(value = "certificateUrl", required = false) String certificateUrl) {
		User user = (User) session.getAttribute("user");

		Certifications certification = new Certifications();
		certification.setUserId(user.getId());
		certification.setName(name);
		certification.setIssuueDate(issueDate);
		certification.setCompanyName(companyName);

		if (certificateUrl != null && !certificateUrl.isEmpty()) {
			certification.setUrl(certificateUrl);
		} else if (file != null && !file.isEmpty()) {
			String baseDirectory;
			if (System.getenv("ENV") != null && System.getenv("ENV").equalsIgnoreCase("LIVE")) {
				baseDirectory = "/var/www/html/study-material";
			} else {
				baseDirectory = "uploads";
			}
			File uploadDir = new File(baseDirectory);
			if (!uploadDir.exists()) {
				uploadDir.mkdirs();
			}
			String fileName = file.getOriginalFilename();
	        String newFile = fileName.replaceAll("\\s+", "_");

			Path filePath = Paths.get(baseDirectory).resolve(newFile).normalize();

			try {
				Files.createDirectories(filePath.getParent());
				file.transferTo(filePath);
				String fileUrl = newFile;
				certification.setUrl(fileUrl);

			} catch (IOException e) {
				e.printStackTrace();
				throw new RuntimeException("Error saving file", e);
			}
		}

		return certificateRepository.save(certification);
	}

	// get external certificate for student - shrunkhal 2/04/25

	@GetMapping("/certifications/{studentId}")
	@ResponseBody
	public List<Certifications> getCertifications(@PathVariable Long studentId) {
		return certificateRepository.findByUserIdOrderByIdDesc(studentId);
	}

	
	 @PutMapping("/updateCertificate/{id}")
	    public ResponseEntity<String> updateCertification(@PathVariable Long id, @RequestBody Certifications updatedCert) {
	        Optional<Certifications> existing = certificateRepository.findById(id);
	        if (existing.isPresent()) {
	            Certifications cert = existing.get();
	            cert.setName(updatedCert.getName());
	            cert.setCompanyName(updatedCert.getCompanyName());
	            cert.setIssuueDate(updatedCert.getIssuueDate());
	            cert.setUrl(updatedCert.getUrl());
	            certificateRepository.save(cert);
	            return ResponseEntity.ok("Certification updated successfully.");
	        } else {
	            return ResponseEntity.status(HttpStatus.NOT_FOUND).body("Certification not found.");
	        }
	    }
	  @DeleteMapping("/deleteCertificate/{id}")
	    public ResponseEntity<String> deleteCertification(@PathVariable Long id) {
	        if (certificateRepository.existsById(id)) {
	            certificateRepository.deleteById(id);
	            return ResponseEntity.ok("Certification deleted successfully.");
	        } else {
	            return ResponseEntity.status(HttpStatus.NOT_FOUND).body("Certification not found.");
	        }
	    }
	// for view certificate in model - 04/04/25 shrunkhal
	@GetMapping("/viewFile/{fileName}")
	@ResponseBody
	public ResponseEntity<Resource> viewCertificate(@PathVariable String fileName) {
		try {
			Path filePath = Paths.get("uploads").resolve(fileName).normalize();
			Resource resource = new UrlResource(filePath.toUri());

			if (resource.exists() && resource.isReadable()) {
				return ResponseEntity.ok().contentType(MediaType.APPLICATION_PDF)
						.header(HttpHeaders.CONTENT_DISPOSITION, "inline; filename=\"" + fileName + "\"") 
						.body(resource);
			} else {
				return ResponseEntity.notFound().build();
			}
		} catch (Exception e) {
			return ResponseEntity.internalServerError().build();
		}
	}

	
	// for upload 04/04 shrunkhal
    @PostMapping(value = "/resume", consumes = "multipart/form-data")
	public String companyUploadStudyMaterial(
	        @RequestParam("file") MultipartFile file,
	        
	        HttpSession session) {
	    User user = (User) session.getAttribute("user");
	    
	  Student student = studentRepository.findById(user.getId()).orElseThrow(()-> new RuntimeException("Student Not found"));
	    try {
	        if (file.isEmpty()) {
	            session.setAttribute("message", "File is empty!");
	            return "redirect:/company_study_material";
	        }
	        String uploadDirectory;
	        if (System.getenv("ENV") != null && System.getenv("ENV").equalsIgnoreCase("LIVE")) {
	            uploadDirectory = "/var/www/html/study-material";
	        } else {
	            uploadDirectory = "uploads";
	        }
	        Path uploadPath = Paths.get(uploadDirectory).toAbsolutePath().normalize();
	        Files.createDirectories(uploadPath);
	        String originalFileName = file.getOriginalFilename();
	        if (originalFileName == null || originalFileName.isEmpty()) {
	            session.setAttribute("message", "Invalid file name!");
	            return "redirect:/company_study_material";
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
	        file.transferTo(filePath.toFile());
	        student.setResume(sanitizedFileName);
	        studentRepository.save(student);
	        System.out.println("File successfully saved at: " + filePath.toString());
	        
	        session.setAttribute("message", "File uploaded successfully!");
	        return "redirect:/company_study_material";
	    } catch (IOException e) {
	        e.printStackTrace(); 
	        session.setAttribute("message", "File upload failed: " + e.getMessage());
	        return "redirect:/company_study_material"; 
	    }
	}
    
    
    @DeleteMapping
    ("/deleteResume")
    @ResponseBody
    public ResponseEntity<String> deleteResume(@RequestParam("studentId") Long studentId) {
        Optional<Student> optionalStudent = studentRepository.findById(studentId);

        if (optionalStudent.isEmpty()) {
            return ResponseEntity.status(HttpStatus.NOT_FOUND).body("Student not found.");
        }

        Student student = optionalStudent.get();
        String resumeName = student.getResume();

        if (resumeName != null && !resumeName.isEmpty()) {
            String uploadDirectory = (System.getenv("ENV") != null && System.getenv("ENV").equalsIgnoreCase("LIVE"))
                    ? "/var/www/html/uploads"
                    : "uploads";

            Path filePath = Paths.get(uploadDirectory, resumeName);

            try {
                Files.deleteIfExists(filePath);
                student.setResume(null);
                studentRepository.save(student);
                return ResponseEntity.ok("Resume deleted successfully.");
            } catch (IOException e) {
                return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR)
                        .body("Failed to delete resume: " + e.getMessage());
            }
        }

        return ResponseEntity.status(HttpStatus.BAD_REQUEST).body("No resume to delete.");
    }

}
