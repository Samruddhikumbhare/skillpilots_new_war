package com.skillpilots.controller.other;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.skillpilots.model.LiveProject;
import com.skillpilots.model.User;
import com.skillpilots.repository.ProjectRepository;

import jakarta.servlet.http.HttpSession;

@Controller

public class ProjectContrller {

	    @Autowired
	    private ProjectRepository projectRepository;
	    @Autowired
	    private HttpSession session;

	    @PostMapping(value = "/api/projects", consumes = MediaType.MULTIPART_FORM_DATA_VALUE)
	    @ResponseBody
	    public ResponseEntity<LiveProject> addProject(
	            @RequestParam("title") String title,
	            @RequestParam("description") String description,
	            @RequestParam("githubLink") String githubLink,
	            @RequestParam(value = "file", required = false) MultipartFile file) {
			User user = (User) session.getAttribute("user");


	        LiveProject project = new LiveProject();
	        project.setTitle(title);
	        project.setDescription(description);
	        project.setGithubLink(githubLink);
	        project.setUserId(user.getId());

	        if (file != null && !file.isEmpty()) {
	            String baseDirectory;
	            if ("LIVE".equalsIgnoreCase(System.getenv("ENV"))) {
	                baseDirectory = "/var/www/html/study-material";
	            } else {
	                baseDirectory = "uploads";
	            }

	            File uploadDir = new File(baseDirectory);
	            if (!uploadDir.exists()) {
	                uploadDir.mkdirs();
	            }

	            String originalFileName = file.getOriginalFilename();
	            String sanitizedFileName = originalFileName.replaceAll("\\s+", "_");
	            Path filePath = Paths.get(baseDirectory, sanitizedFileName).normalize();

	            try {
	                Files.copy(file.getInputStream(), filePath, StandardCopyOption.REPLACE_EXISTING);
	                project.setFilePath(sanitizedFileName);
	            } catch (IOException e) {
	                e.printStackTrace();
	                return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).build();
	            }
	        }

	        LiveProject savedProject = projectRepository.save(project);
	        return ResponseEntity.ok(savedProject);
	    }

	    
	    @GetMapping("/api/projectlist/{userId}")
	    @ResponseBody
	    public ResponseEntity<List<LiveProject>> getProjects(@PathVariable Long userId){
	    	List<LiveProject> list = projectRepository.findByUserId(userId);

            return ResponseEntity.status(HttpStatus.OK).body(list);
	    }
	
	    
	    @PutMapping("/api/projects/edit/{id}")
	    @ResponseBody
	    public ResponseEntity<String> editProject(@PathVariable Long id,
	                                              @RequestParam String title,
	                                              @RequestParam String description,
	                                              @RequestParam String githubLink,
	                                              @RequestParam(required = false) MultipartFile file) {
	        
	        Optional<LiveProject> optionalProject = projectRepository.findById(id);

	        if (optionalProject.isPresent()) {
	            LiveProject existingProject = optionalProject.get();
	            
	            // Update the project details
	            existingProject.setTitle(title);
	            existingProject.setDescription(description);
	            existingProject.setGithubLink(githubLink);

	            // Handle file upload if a file is provided
	            if (file != null && !file.isEmpty()) {
	                String baseDirectory;
	                
	                // Set directory based on environment
	                if ("LIVE".equalsIgnoreCase(System.getenv("ENV"))) {
	                    baseDirectory = "/var/www/html/study-material";
	                } else {
	                    baseDirectory = "uploads";
	                }

	                File uploadDir = new File(baseDirectory);
	                if (!uploadDir.exists()) {
	                    uploadDir.mkdirs();
	                }

	                String originalFileName = file.getOriginalFilename();
	                String sanitizedFileName = originalFileName.replaceAll("\\s+", "_");
	                Path filePath = Paths.get(baseDirectory, sanitizedFileName).normalize();

	                try {
	                    // Save the file to the directory
	                    Files.copy(file.getInputStream(), filePath);
	                    existingProject.setFilePath(sanitizedFileName); // Update the file path in project
	                } catch (IOException e) {
	                    e.printStackTrace();
	                    return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("Error uploading file.");
	                }
	            }

	            // Save the updated project to the repository
	            projectRepository.save(existingProject);
	            return ResponseEntity.ok("Project updated successfully.");
	        } else {
	            return ResponseEntity.status(HttpStatus.NOT_FOUND).body("Project not found.");
	        }
	    }
	    
	    @DeleteMapping("/api/deleteProject/{id}")
	    public ResponseEntity<?> deleteProject(@PathVariable Long id){
	    	
	        Optional<LiveProject> optionalProject = projectRepository.findById(id);
	        if(optionalProject.isPresent()) {
	        	projectRepository.deleteById(id);
	        }
            return ResponseEntity.ok("Project Deleted successfully.");

	    }
	
}
