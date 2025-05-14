package com.skillpilots.controller.college;


import java.util.Base64;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.skillpilots.model.BalanceData;
import com.skillpilots.model.College;
import com.skillpilots.model.PackagesData;
import com.skillpilots.model.Student;
import com.skillpilots.model.User;
import com.skillpilots.service.BalanceDataService;
import com.skillpilots.service.CollDeptService;
import com.skillpilots.service.CollegeService;
import com.skillpilots.service.PackageDataService;
import com.skillpilots.service.UserService;
import com.skillpilots.utility.ProjectConstants;

import jakarta.servlet.http.HttpSession;
import org.springframework.web.multipart.MultipartFile;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.Files;
import java.nio.file.StandardCopyOption;
import java.time.LocalDate;

import org.springframework.util.StringUtils;
import java.io.IOException;

@Controller
//public class CollegeController extends BeanCopyUtil {  sk
public class CollegeController{

	@Autowired
	private HttpSession session;
	@Autowired
	private CollegeService collegeService;
	
	@Autowired
	private UserService userService;
	@Autowired
	private PackageDataService packageDataService;
	@Autowired
	private BalanceDataService balanceDataService;
	@Autowired
	private CollDeptService collDeptService;
	
	@RequestMapping(value = "/college_reg")
	public String getCollegeRegistrationForm() {
		
		
		return "collegeRegistration";
	}

	@RequestMapping(value = "/college_registration", method = RequestMethod.POST)
	public String saveCollege(College college,RedirectAttributes redirectAttributes, String username, String ugender, String uemail,
			Long ucontact,@RequestParam(value = "collegelogo", required = false) MultipartFile collegelogo) {
		
	         
			
			
			
			
			//adminUser
			String CmpEmail = "info@cluematrix.com";
		//add  collegeUser
		User collegeUser = new User();
		collegeUser.setUsername(college.getCollege_name());
		collegeUser.setEmail(college.getEmail_id());
		collegeUser.setRole(ProjectConstants.college);
		collegeUser.setContact_no(college.getContact_1());
		collegeUser.setHodverified(0);
		collegeUser.setOtp("007");
		
		if (null != collegelogo) {
			try {
				college.setLogo(collegelogo.getBytes());
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		college.setCreation_date(LocalDate.now());
		collegeService.saveCollege(college);
		collegeUser.setInstituteId(967434+college.getCollege_id());
		userService.saveUser(collegeUser);
	
		
	    //add internship lead iii
		 User iiiUser = new User();
		 iiiUser.setUsername(username);
		 iiiUser.setGender(ugender);
		 iiiUser.setEmail(uemail);
		 iiiUser.setContact_no(ucontact);
		 iiiUser.setRole(ProjectConstants.tpheadiiicell);
		 iiiUser.setCommonId((967434+college.getCollege_id()));
		 iiiUser.setEmailIdCommon(college.getEmail_id());
		 iiiUser.setHodverified(0);
		 iiiUser.setOtp("007");
	        userService.saveUser(iiiUser);
	        
	        PackagesData packageData = packageDataService
					.getDefaultPkg(ProjectConstants.package_data_package_for_college);
				BalanceData balanceData = new BalanceData();
				balanceData.setCreation_date(new Date());
				balanceData.setUser_id(college.getCollege_id());
				balanceData.setNo_of_dept(packageData.getNo_of_dept());
				balanceData.setNo_of_internships(packageData.getNo_of_internships());
				balanceData.setPackage_id(packageData.getPackage_id());
				balanceData.setBalancefor("College");
				Date dt = new Date();
				balanceData.setEffective_date(dt);
				balanceData.setExpiration_date(userService.getDateAfterDays(dt, packageData.getValidity()));
				balanceDataService.saveBalance(balanceData);
				
				
	        String generateOtp = generateOtp();
		    //send email to T&p
	        String body = "<h1 style=\"font-size:55px;margin:20px;text-align:center\">Welcome to <span style=\"color:#1974c3;\">Skill<span style=\"color:#01af36;\">Pilots</span> </h1>"
					+ "<p style=\"text-align:center\"> Your T&P Login is Created By " + college.getCollege_name()
					
					+ ProjectConstants.mail_footer;
	        userService.sendVerificationEmail(uemail,ProjectConstants.mail_subject_first_login , body);
	        
	        

	        String body2 = 
		            "<h1 style=\"font-size:55px;margin:20px;text-align:center\">Welcome to <span style=\"color:#01af36;\">SkillPilots</span></h1>"
		            + "</header>"
		            + "<div style=\"padding:20px; text-align:center;\">"
		            + "<p style=\"font-size:18px; color:#333;\">"
		            + "A new College, <strong>" + college.getCollege_name() + "</strong>, has just registered with SkillPilots!</p>"
		            + "<p style=\"font-size:16px; color:#666;\">Please log in to the admin portal to review the details.</p>"
		            + "<p style=\"font-size:16px;\">Click the button below to access the SkillPilots admin portal:</p>"
		            + "<a href=\"https://admin.skillpilots.com\" style=\"background-color:#1974c3; color:#fff; padding:10px 20px; border-radius:5px; text-decoration:none; font-size:16px;\">Go to Admin Portal</a>"
		            + "</div>"
		            + "<footer style=\"background-color:#f0f0f0; padding:10px; text-align:center; font-size:12px; color:#777;\">"
		            + ProjectConstants.mail_footer
		            + "</footer>"
		            + "</div>"
		            + "</div>";


	        
	       
	       //send Email to college
	        userService.sendVerificationEmail(college.getEmail_id(), ProjectConstants.mail_from, ProjectConstants.mail_body_registration_completed);
	        // add collegeDetails
	        
	        //send email to admin
	        userService.sendVerificationEmail(CmpEmail,"New Notification From Skillpilot", body2);
	  
		return "redirect:/login";
	}
    
    
	private String generateOtp() {
		// TODO Auto-generated method stub
		return "007";
	}

	@RequestMapping("/get_coll_dept_link")
	public String getCollDeptLink() {
//	public @ResponseBody CollDeptLink getCollDeptLink(@RequestParam("dept_link_id") String dept_link_id) {
//		CollDeptLink collDept = collegeService.getDeptLinkBYID(dept_link_id);
//		return collDept;
		return null;
	}

	//get all college departments 
	@RequestMapping(value = "/getCollegeDetails", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> getdetails(@RequestParam("college_id") Long college_id ) {
		System.out.println("College id :"+college_id);
			College college = collegeService.getCollegeById(college_id);
			List<Object[]> deptLink = collDeptService.getCollDepartment(college_id);
			
			Map<String, Object> hmap=new HashMap<>();
			hmap.put("college",college);
			if(deptLink.size()>0){
				hmap.put("department", deptLink);
			}else{
				hmap.put("department","none");
			}
			
			
			return hmap;}

	@GetMapping("/editCollegeProfile")
	public String updatepro(Model model) {
		User user = (User) session.getAttribute("user");

		College college = collegeService.getCollegeByEmail(user.getEmail());
		
		byte[] photoData = college.getLogo(); 
		String photoBase64 = "";
	    if (photoData != null && photoData.length > 0) {
	        photoBase64 = Base64.getEncoder().encodeToString(photoData);
	    }

	    // Add the Base64-encoded photo data to the model
	    model.addAttribute("photoBase64", photoBase64);
		model.addAttribute("college", college);
		return "changeCollegeProfile";
	}
	
	


@RequestMapping(value = "/editCollegeProfile", method = RequestMethod.POST)
public String updateprofile(@ModelAttribute College college, @RequestParam(value = "collegelogo", required = false) MultipartFile collegelogo, Long contact_1, Long contact_2, String web_url, HttpSession session) {
    User user = (User) session.getAttribute("user");
    if (user == null) {
        return "changeCollegeProfile";
    }

    College existingCollege = collegeService.getCollegeByEmail(user.getEmail());
    if (existingCollege == null) {
        return "redirect:/editCollegeProfile";
    }
    Long userId = user.getId();
    if (collegelogo != null && !collegelogo.isEmpty()) {
        try {
        	existingCollege.setLogo(collegelogo.getBytes());
        } catch (IOException e) {
            e.printStackTrace();
            // Handle exception as needed
        }
    } else if (existingCollege.getLogo() == null || existingCollege.getLogo().length == 0) {
        // Optional: handle the case where the existing logo is empty
        // You could set a default logo here if needed
    }

    

    existingCollege.setContact_1(contact_1);
    existingCollege.setContact_2(contact_2);
    existingCollege.setWeb_url(web_url);
    
    collegeService.saveCollege(existingCollege);
    user.setContact_no(existingCollege.getContact_1());
    
    return "redirect:editCollegeProfile";
}






	@InitBinder
	protected void initBinder(WebDataBinder binder) {
//		SimpleDateFormat dateFormat = new SimpleDateFormat(ProjectConstants.date_format);
//		binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, false));
	}

}
