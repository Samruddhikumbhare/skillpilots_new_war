package com.skillpilots.utility;

import java.io.IOException;
import java.util.HashMap;
import java.util.concurrent.ExecutionException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.skillpilots.model.NotificationRequest;



@org.springframework.web.bind.annotation.RestController
public class RestController {

	@Autowired
	private FirebaseService firebaseService;
	
	@Autowired
    private FirebaseStorageService firebaseStorageService;
	
	
	@PostMapping("/notification")
    public ResponseEntity sendNotification(@RequestBody NotificationRequest request) throws ExecutionException, InterruptedException {
		
		firebaseService.sendMessageToToken(request);
		
        return new ResponseEntity<>(HttpStatus.ACCEPTED);
    }
	
	
	
	@PostMapping("/upload")
    public ResponseEntity<Object> uploadImage(@RequestParam Long studentId, @RequestParam("file") MultipartFile file) {
        HashMap<String, Object> response = new HashMap<>();
        try {
            if (!file.isEmpty()) {
                String imageUrl = firebaseStorageService.uploadFile(file, studentId);
                response.put("code", HttpStatus.OK);
                response.put("msg", "Uploaded Successfully");
                response.put("imageUrl", imageUrl);
                return new ResponseEntity<>(response, HttpStatus.OK);
            } else {
                response.put("code", HttpStatus.BAD_REQUEST);
                response.put("msg", "File is empty");
                return new ResponseEntity<>(response, HttpStatus.BAD_REQUEST);
            }
        } catch (IOException e) {
            e.printStackTrace();
            response.put("code", HttpStatus.BAD_REQUEST);
            response.put("msg", "Unable To Upload");
            return new ResponseEntity<>(response, HttpStatus.BAD_REQUEST);
        }
    }








}
