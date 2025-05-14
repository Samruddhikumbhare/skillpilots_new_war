package com.skillpilots.controller.company;

import java.util.Date;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;


@Controller
public class TopUpDataController {
	
	@RequestMapping("/add_topupdata_company")
	public @ResponseBody String addtopupDataCompany(@RequestParam("package_id")int package_id) {
		
			return "success";
	
		
	}
	@RequestMapping("/add_topupdata_college")
	public @ResponseBody String addtopDataCollege(@RequestParam("package_id")int package_id,@RequestParam("request_id")int request_id){
		
		return "sucess";
		
	}
}
