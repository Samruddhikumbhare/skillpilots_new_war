package com.skillpilots.controller.other;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.skillpilots.service.PlanDetailsService;

@Controller
public class PlanDetailsController {

	@Autowired
	private PlanDetailsService planDetailsService;
	
	@GetMapping("/planDetail")
	public ResponseEntity<?> getPlanDetails(@RequestParam String user ){
		
		return new ResponseEntity<>(planDetailsService.getPlanDetails(user), HttpStatus.OK);
	}
}
