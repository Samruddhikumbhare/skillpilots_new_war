package com.skillpilots.controller.intern;

import java.io.IOException;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.skillpilots.model.StudentOffer;
import com.skillpilots.service.StudentTestDataService;

@Controller
public class StudentOfferController {
	@Autowired
	private StudentTestDataService dataService;
	private static final String UPLOAD_ = "src/main/resources/static/style/offer";


	@PostMapping("/uploadOffer")
		    public ResponseEntity<Object> uploadOffer(
		            @RequestParam Long studentId,
		            @RequestParam Long companyId,
		            @RequestParam("file") MultipartFile file) {
		        HashMap<String, Object> response = new HashMap<>();
		        if (file.isEmpty()) {
		            response.put("statusCode", 400);
		            response.put("message", "No file selected.");
		            return new ResponseEntity<>(response, HttpStatus.BAD_REQUEST);
		        }
		        try {
		          StudentOffer studentOffer = dataService.uploadOffer(studentId, companyId, file);
		            response.put("statusCode", 200);
		            response.put("message", "Offer uploaded successfully.");
		            response.put("offerId", studentOffer.getOfferId());
		            response.put("status", studentOffer.getStatus());
		            return new ResponseEntity<>(response, HttpStatus.OK);
		        } catch (IOException e) {
		            response.put("statusCode", 500);
		            response.put("message", "File upload failed.");
		            return new ResponseEntity<>(response, HttpStatus.INTERNAL_SERVER_ERROR);
		        }
		    }







}
