package com.skillpilots.controller.intern;




import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.skillpilots.model.StudentPast;
import com.skillpilots.service.StudentService;
@Controller
public class StudentPastController {
@Autowired
private StudentService studentService;
	@PostMapping("/saveStudentPast")
	public  String savePast(@ModelAttribute StudentPast studentPast) {
		studentService.saveStudent(studentPast);

		return "redirect:/editStudentProfile";
	}
	
	@RequestMapping(value = "/addStudentPast", produces = { MediaType.APPLICATION_JSON_VALUE },method=RequestMethod.POST)
	   public @ResponseBody String savePastEdu(){
//		 studentService.saveStudentPast(studentPast);
		  return null;
	  }
	
	@DeleteMapping("/removeStudentPast/{studPastId}")
	public ResponseEntity<String> removePast(@PathVariable("studPastId") Long studPastId) {
	    try {
	        studentService.deleteStudentPastById(studPastId);
	        return ResponseEntity.ok("success");
	    } catch (Exception e) {
	        // Log the exception for debugging
	        e.printStackTrace();
	        return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("failure");
	    }
	}

}
