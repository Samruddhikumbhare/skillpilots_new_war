package com.skillpilots.controller.company;


import java.util.Comparator;
import java.util.List;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.skillpilots.model.CompAdvertisement;
import com.skillpilots.model.InternshipSchedule;
import com.skillpilots.service.CompanyAdvertisementService;



@Controller
public class InternshipScheduleController {
	
	@Autowired
	private CompanyAdvertisementService companyAdvertisementService;


	@GetMapping("/getInternshipScheduleByAdv_id")
    public @ResponseBody String getInternshipSchedule(@RequestParam Long adv_id) {
        JSONObject mainObj = new JSONObject();
        
        try {
            System.out.println("Fetching advertisement with ID: " + adv_id);
            CompAdvertisement compAdvertisements = companyAdvertisementService.getCompAdv(adv_id);

            if (compAdvertisements != null) {
                System.out.println("Advertisement found: " + compAdvertisements);
                List<InternshipSchedule> list = compAdvertisements.getInternshipSchedule();

                if (list != null && !list.isEmpty()) {
                    System.out.println("Internship schedule list size: " + list.size());
                    list.sort(Comparator.comparing(InternshipSchedule::getSchedule_id));

                    JSONArray ja = new JSONArray();
                    for (InternshipSchedule schedule : list) {
                        JSONObject jo = new JSONObject();
                        jo.put("schedule_id", schedule.getSchedule_id());
                        jo.put("schedule_1", schedule.getSchedule_1() != null ? schedule.getSchedule_1() : "");
                        jo.put("schedule_2", schedule.getSchedule_2() != null ? schedule.getSchedule_2() : "");
                        jo.put("schedule_3", schedule.getSchedule_3() != null ? schedule.getSchedule_3() : "");
                        jo.put("schedule_4", schedule.getSchedule_4() != null ? schedule.getSchedule_4() : "");
                        ja.put(jo);
                    }

                    mainObj.put("internshipSchedule", ja);
                    mainObj.put("empty", false);
                    System.out.println("Response JSON: " + mainObj);
                } else {
                    System.out.println("No internship schedules found.");
                    mainObj.put("empty", true);
                }
            } else {
                System.out.println("No advertisement found with ID: " + adv_id);
                mainObj.put("empty", true);
            }
        } catch (Exception e) {
            e.printStackTrace();
            mainObj.put("empty", true);
        }

        return mainObj.toString(); // Convert JSON object to string
    }
	
}
