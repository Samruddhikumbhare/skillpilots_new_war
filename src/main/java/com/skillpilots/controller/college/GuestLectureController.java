package com.skillpilots.controller.college;


import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;




@Controller
public class GuestLectureController {

	
	@RequestMapping(value="/guest_lect",method = RequestMethod.GET)
	public String guestLect(Model model) {
		
		return "guest_lect";
	}
	
	@RequestMapping(value="/get_guest_lect")
	public String getGuestLect() {
				
		return "redirect:guest_lect";
	}
}
