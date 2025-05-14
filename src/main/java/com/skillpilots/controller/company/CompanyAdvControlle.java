package com.skillpilots.controller.company;

import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.skillpilots.model.CompAdvertisement;
import com.skillpilots.model.Company;
import com.skillpilots.model.InternshipSchedule;
import com.skillpilots.model.User;
import com.skillpilots.repository.UserRepository;
import com.skillpilots.service.CompanyAdvertisementService;
import com.skillpilots.service.ComponyService;
import com.skillpilots.service.DepartmentService;
import com.skillpilots.service.EmailService;
import com.skillpilots.service.TechnologyService;
import com.skillpilots.service.UserService;
import com.skillpilots.utility.FirebaseService;
import com.skillpilots.utility.ProjectConstants;

import jakarta.servlet.http.HttpSession;


//public class CompanyAdvControlle extends BeanCopyUtil{
	
@Controller
public class CompanyAdvControlle{
	@Autowired
	private ComponyService componyService;
	
	@Autowired
	private HttpSession session;
	@Autowired
	private UserService userService;
	@Autowired
	private CompanyAdvertisementService companyAdvertisementService;
	
	@Autowired
	private DepartmentService departmentService;
	@Autowired
	private TechnologyService technologyService;
	@Autowired
	private UserRepository userRepository;
	@Autowired
	private EmailService emailService;
	@Autowired
    private  FirebaseService firebaseService;
	
	@GetMapping("/company_posts")
    public String compAdv(Model model) {
		User user = (User) session.getAttribute("user");
		Company company=null;
	    if(user.getRole().equals(ProjectConstants.company)) {
	    	 company = componyService.getCompanyById(user.getEmail());
	    }else {
	    	User u = userService.findByEmailAndRole(user.getRole(), user.getEmailIdCommon());
	    	 company = componyService.getCompanyById(u.getEmailIdCommon());
	    }
		
	    List<String> allTechnology = technologyService.getTechnologyNameList();
	   
	    model.addAttribute("allTechnology", allTechnology);
	   
	    List<String> deptNameList = departmentService.getDeptNameList();
	    model.addAttribute("deptName", deptNameList);
	   
	   
        try {
            List<CompAdvertisement> compAdvertisements = componyService.getAdvertisementByCompanyId(company.getCompany_id());
            model.addAttribute("compAdvertisements", compAdvertisements);
        } catch (Exception e) {
            // Handle exceptions if any.
            e.printStackTrace();
        }
        return "company_posts";
    }




	@RequestMapping(value = "/add_advertisment", method = RequestMethod.POST)
	public String addAdv(@ModelAttribute(value = "compAdvertisements", binding = true) @Validated CompAdvertisement compAdvertisements, BindingResult bindingResult,
	                     Model model, @RequestParam(value = "type_of_adv", required = false) String type_of_adv, @RequestParam("start_date") String startDate,
	                     @RequestParam(value = "weekly_data_str", required = false) String weekly_data_str,
	                     @RequestParam(value = "getskipval") String getskipval,
	                     @RequestParam(value="technology_name") String technology_name,
	                     @RequestParam(value="description") String description,
	                     @RequestParam(value= "jobType") String jobType,
	                     @RequestParam(value = "workingType") String workingType,
	                     @RequestParam(value = "location") String location
) {

		System.out.println("Advertisemet "+compAdvertisements);



	    User user = (User) session.getAttribute("user");
	    if(!(user==null)) {
	    Company company=null;
	    if(user.getRole().equals(ProjectConstants.company)) {
	    	 company = componyService.getCompanyById(user.getEmail());
	    }else {
	    	User u = userService.findByEmailAndRole(user.getRole(), user.getEmailIdCommon());
	    	 company = componyService.getCompanyById(u.getEmailIdCommon());
	    }
	    System.out.println(getskipval + "jdjdjdj");
	    List<InternshipSchedule> internshipSchedule = new ArrayList<InternshipSchedule>();
	   
	    if (getskipval.equals("no")) {
	        String[] parts = null;

	        System.out.println(weekly_data_str);
	        parts = weekly_data_str.split(",");

	        for (int i = 0; i < parts.length; i++) {
	            InternshipSchedule is = new InternshipSchedule();
	            is.setCompAdvertisement(compAdvertisements);
	            is.setSchedule_type(ProjectConstants.weekly_schedule_internship);
	            while (is.setSchedule(parts[i])) {
	                i++;
	                if (i == parts.length)
	                    break;
	            }
	            internshipSchedule.add(is);
	        }
	    }

	  
	    //New advertisement
	    if (compAdvertisements.getId() == null) {
	
	        compAdvertisements.setCompanyName(company.getCompany_name());
	        compAdvertisements.setInternshipSchedule(internshipSchedule);
	        compAdvertisements.setLocation(company.getCity());
	        compAdvertisements.setCreation_date(LocalDate.now());
	        compAdvertisements.setCompanyId(company.getCompany_id());
	        compAdvertisements.setJobType(jobType);
	        compAdvertisements.setWorkingType(workingType);
	        compAdvertisements.setLocation(location);
	        if(compAdvertisements.getStipend()>0) {
	        	compAdvertisements.setAdvertisementType("paid");
	        }
	        else {
	        	compAdvertisements.setAdvertisementType("free");

	        }
	        compAdvertisements.setTechnology(technology_name);

	        compAdvertisements.setStatus(ProjectConstants.comp_advertisements_status_active);
	        companyAdvertisementService.saveCompAdvertisement(compAdvertisements);
	        
	        List<Map<String, Object>> students = userRepository.findAllByRole6();
	        int batchSize = 50; // Set batch size
	        int counter = 0;

	        for (Map<String, Object> student : students) {
	            String username = student.get("username") != null ? student.get("username").toString() : "User";
	            String email = student.get("email") != null ? student.get("email").toString() : null;
	            String notificationToken = student.get("notificationToken") != null ? student.get("notificationToken").toString() : "";

	            if (email == null) {
	                continue; 
	            }

	            String mailBody = "<h1 style=\"font-size:55px;margin:20px;text-align:center\">"
	                    + "<span style=\"color:#1974c3;\">Skill<span style=\"color:#01af36;\">Pilots</span></h1>"
	                    + "<p style=\"text-align:center\">Dear <strong style=\"color:#414ea4\">" + username + "</strong>,<br>"
	                    + "We are pleased to inform you that a new Recruitment is going on! Log in and apply at <strong style=\"color:#414ea4\"><a href=\"http://www.skillpilots.com\" style=\"color:#414ea4; text-decoration:none;\">SkillPilots</a></strong>.<br>"
	                    + "Here are the details regarding your placement opportunities:</p>"
	                    + "<ul style=\"text-align:center; list-style-type:none; padding:0;\">"
	                    + "<li><strong>Company:</strong> " + company.getCompany_name() + "</li>"
	                    + "</ul>"
	                    + "<p style=\"text-align:center\">We encourage you to prepare well for your interview.<br>"
	                    + "If you have any questions, feel free to reach out to us at <strong style=\"color:#414ea4\"><a href=\"http://www.skillpilots.com\" style=\"color:#414ea4; text-decoration:none;\">SkillPilots</a></strong>.<br>"
	                    + "Best of luck with your placement!</p>"
	                    + ProjectConstants.mail_footer;

	            emailService.sendVerificationEmail(email, "Recruitment Update", mailBody);

	            if (!notificationToken.isEmpty()) {
	                firebaseService.sendNotification(notificationToken, "Internship Update",
	                        company.getCompany_name() + " is hiring. Go and apply!");
	            }

	            counter++;

	            if (counter % batchSize == 0) {
	                try {
	                    Thread.sleep(2000); 
	                } catch (InterruptedException e) {
	                    Thread.currentThread().interrupt();
	                }
	            }
	        }

	        
	       

	        model.addAttribute("message", "adv_added");
	    } else {
	        CompAdvertisement comadv = companyAdvertisementService.getCompAdv(compAdvertisements.getId());
	        
	        System.out.println("hdhhd"+comadv);
	        List<InternshipSchedule> internshipschdsaved = comadv.getInternshipSchedule();

	        System.out.println();
	        
	        //update feilds
	        comadv.setAdv_title(compAdvertisements.getAdv_title());
	        comadv.setTechnology(compAdvertisements.getTechnology());
	        comadv.setCapacity(compAdvertisements.getCapacity());
	        comadv.setDuration(compAdvertisements.getDuration());
	        comadv.setStipend(compAdvertisements.getStipend());
	        comadv.setTechnology(technology_name);
	        comadv.setStart_date(compAdvertisements.getStart_date());
	        comadv.setLocation(company.getCity());
	        comadv.setDescription(compAdvertisements.getDescription());
	        comadv.setJobType(compAdvertisements.getJobType());
            comadv.setWorkingType(compAdvertisements.getWorkingType());
	        comadv.setCommonId(user.getInstituteId());
	        compAdvertisements.setLocation(compAdvertisements.getLocation());

			int rows_to_be_updated, extra_rows, updated_no_of_rows;
			
			updated_no_of_rows = internshipSchedule.size();
				
			if (internshipschdsaved.size() == updated_no_of_rows) {
				rows_to_be_updated = updated_no_of_rows;
				extra_rows = 0;
			}else {
				rows_to_be_updated=(internshipschdsaved.size()>updated_no_of_rows)?updated_no_of_rows:internshipschdsaved.size();
				extra_rows = updated_no_of_rows - internshipschdsaved.size();
			}
			
			for(int i=0;i<rows_to_be_updated;i++){
				//for rows existing set same schedule id
				internshipSchedule.get(i).setSchedule_id(internshipschdsaved.get(i).getSchedule_id());
			}
			for(int i=rows_to_be_updated;i<extra_rows;i++){
				//for new rows (extra_rows)
				//nothing to be done
				//internshipSchedule.get(i).setCompAdvertisement(comadv);
			}
			for(int i=extra_rows; i<0; i++) {
				//to remove lastextra rows when duration is decreased
				InternshipSchedule is = internshipschdsaved.get(internshipschdsaved.size()-1);
				internshipschdsaved.remove(is);
				//internshipscheduleService.delInternshipSchedule(is);
			}
			comadv.setInternshipSchedule(internshipSchedule);
			
	        // Save the updated CompAdvertisement
	        comadv.setUpdation_date(LocalDate.now());
	        companyAdvertisementService.saveCompAdvertisement(comadv);
	        model.addAttribute("message", "adv_updated");
	    }
	    return "redirect:company_posts";
	
	    }
	    else {
	    	return "redirect:logout";
	    }
	}


	@RequestMapping(value = "/delete_com_adv")
	public String deleteComAdv(@RequestParam("adv_id") Long advId) {
	componyService.delete(advId);
	    return "redirect:/company_posts";
	}

	@RequestMapping(value = "/editCompAdvertisement", method = RequestMethod.GET)
	public @ResponseBody CompAdvertisement editComAdv(@RequestParam Long adv_id, Model model) {
		CompAdvertisement compAdvertisements = companyAdvertisementService.getCompAdv(adv_id);
		
		
		return compAdvertisements;
	}

	
	@RequestMapping(value = "/getCompnayAdvertisement", method = RequestMethod.GET)
	public @ResponseBody String getAdvertisementByCompanyId(String company_id) {
	
		return "compAdvertisements";
	}

	@RequestMapping(value = "/company_adv_forcollege")
	public String comapanyAdvertisement(Model model) {
		
			return "companyadvforcollege";
	}

	@RequestMapping(value = "/getAllCompanyPosts", method = RequestMethod.GET)
	public @ResponseBody List<Object> getAllCompanyPosts(Model model) {
		List<Object> list = new ArrayList<>();
		List<CompAdvertisement> advertisements = companyAdvertisementService.getAdvertisement("");
		list.add(advertisements);
		return list;
	}

	
	

	@InitBinder
	protected void initBinder(WebDataBinder binder) {
	
	}
}
