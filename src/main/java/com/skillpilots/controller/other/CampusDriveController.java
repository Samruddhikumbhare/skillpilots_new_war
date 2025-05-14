package com.skillpilots.controller.other;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
public class CampusDriveController {

	private static final String UPLOAD_ = 	"src/main/resources/static/style/offer";


	
	@GetMapping("/drive_registration")
	public String  driveRegistration() {
		
		return "drive_registration";
	}
	
	@GetMapping("/drive_login")
	public String  drive_login() {
		
		return "drive_login";
	}
	
	@GetMapping("/drive_exam")
	public String  drive_exam() {
		
		return "drive_exam";
	}
	
	@GetMapping("/drive_disclamer")
	public String  drive_disclamer() {
		
		return "drive_disclamer";
	}
	
	 
	

}
