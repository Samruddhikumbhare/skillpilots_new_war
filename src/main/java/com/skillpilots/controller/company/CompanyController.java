package com.skillpilots.controller.company;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.Base64;
import java.util.Date;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.validation.BindingResult;
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
import org.springframework.web.multipart.MultipartFile;

import com.skillpilots.model.BalanceData;
import com.skillpilots.model.Company;
import com.skillpilots.model.PackagesData;
import com.skillpilots.model.User;
import com.skillpilots.service.BalanceDataService;
import com.skillpilots.service.ComponyService;
import com.skillpilots.service.PackageDataService;
import com.skillpilots.service.UserService;
import com.skillpilots.utility.ProjectConstants;

import jakarta.servlet.http.HttpSession;

@Controller
//public class CompanyController extends BeanCopyUtil{
public class CompanyController{
	@Autowired
	private UserService userService;
	
	@Autowired
	private ComponyService compService;
	@Autowired
	private HttpSession session;
	@Autowired
	private PackageDataService packageDataService;
	@Autowired
	private BalanceDataService balanceDataService;
	
	@RequestMapping("/comp_reg")
	public String regComp() {
		
		return "company_registration";
	}
// old sk working
//	@RequestMapping(value="/add_company",method=RequestMethod.POST)
//	public String addComp(Company compony) {
//		User user = new User();
//		user.setEmail(compony.getEmail_id());
//		user.setRole(ProjectConstants.iii_role2);
//		userService.saveUser(user);
//		
//		compService.saveCompony(compony);
//			return "redirect:comp_reg";
//	}
	
	
	@PostMapping("/add_company")
    public String addComp(
            Company company,
             String username,
           String gender,
           String email,
             Long ucontact,
             @RequestParam(value = "companylogo", required = false) MultipartFile companyLogo,
 			@RequestParam(value = "hrSign", required = false) MultipartFile hrSign ) throws IOException {
     
		
		
	
      
         
		
		
		
		
		//addcompanyUser
		String CmpEmail = "info@cluematrix.com";
        User companyUser = new User();
        companyUser.setUsername(company.getCompany_name());
        companyUser.setEmail(company.getEmail_id());
        companyUser.setContact_no(company.getContact_1());
        companyUser.setRole(ProjectConstants.company);
        companyUser.setOtp("007");
        company.setCreation_date(LocalDate.now());
        compService.saveCompony(company);
        
        companyUser.setInstituteId(98765+company.getCompany_id());
        userService.saveUser(companyUser);
      //add hr
        User hrUser = new User();
        hrUser.setUsername(username);
        hrUser.setGender(gender);
        hrUser.setEmail(email);
        hrUser.setContact_no(ucontact);
        hrUser.setRole(ProjectConstants.hr);
        hrUser.setOtp("007");
        hrUser.setEmailIdCommon(company.getEmail_id());
        if (!hrSign.isEmpty() && hrSign != null) {
			System.out.println("Uploading Signature");
			byte[] bytes = hrSign.getBytes();
			hrUser.setSignature(bytes);
		}
        userService.saveUser(hrUser);
        hrUser.setCommonId(98765+company.getCompany_id());
        
        
        
        if (null != companyLogo) {
			try {
				company.setLogo(companyLogo.getBytes());
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
        compService.saveCompony(company);
        
        String password = UUID.randomUUID().toString().substring(0, 5);
		password = password.replaceAll("\\s", "");
		PackagesData packageData = packageDataService.getDefaultPkg(ProjectConstants.package_data_package_for_company);
		BalanceData balanceData = new BalanceData();
		balanceData.setCreation_date(new Date());
		balanceData.setUser_id(company.getCompany_id());
		balanceData.setNo_of_dept(packageData.getNo_of_dept());
		balanceData.setNo_of_internships(packageData.getNo_of_internships());
		balanceData.setPackage_id(packageData.getPackage_id());
		balanceData.setBalancefor("Compony");
		Date dt = new Date();
		balanceData.setEffective_date(dt);
		balanceData.setExpiration_date(userService.getDateAfterDays(dt, packageData.getValidity()));
		balanceDataService.saveBalance(balanceData);
		

		String body = 
	            "<h1 style=\"font-size:55px;margin:20px;text-align:center\">Welcome to <span style=\"color:#01af36;\">SkillPilots</span></h1>"
	            + "</header>"
	            + "<div style=\"padding:20px; text-align:center;\">"
	            + "<p style=\"font-size:18px; color:#333;\">"
	            + "A new company, <strong>" + company.getCompany_name() + "</strong>, has just registered with SkillPilots!</p>"
	            + "<p style=\"font-size:16px; color:#666;\">Please log in to the admin portal to review the details.</p>"
	            + "<p style=\"font-size:16px;\">Click the button below to access the SkillPilots admin portal:</p>"
	            + "<a href=\"https://admin.skillpilots.com\" style=\"background-color:#1974c3; color:#fff; padding:10px 20px; border-radius:5px; text-decoration:none; font-size:16px;\">Go to Admin Portal</a>"
	            + "</div>"
	            + "<footer style=\"background-color:#f0f0f0; padding:10px; text-align:center; font-size:12px; color:#777;\">"
	            + ProjectConstants.mail_footer
	            + "</footer>"
	            + "</div>"
	            + "</div>";

		
		
        // send email to hr User
        userService.sendVerificationEmail(email, ProjectConstants.mail_from, ProjectConstants.mail_body_registration_completed);
        //send email to company
        userService.sendVerificationEmail(company.getEmail_id(), ProjectConstants.mail_from, ProjectConstants.mail_body_registration_completed);
      
        userService.sendVerificationEmail(CmpEmail,"New Notification From Skillpilot", body);
        
        
        
        return "redirect:/login";
    }






	@RequestMapping("/editCompProfile")
	public String changeProfile(Model model){
		User user1 = (User) session.getAttribute("user");
	
		User user = userService.getUserById(user1.getId());
		model.addAttribute("user", user);
		String email = user.getEmail();
		
		Company company = compService.getCompanyById(email);
		model.addAttribute("company", company);
		byte[] photoData = company.getLogo(); // Assuming photo is stored as a byte array in the 'photo' field

	    // Convert the byte array to a Base64-encoded string for display in HTML
	    String photoBase64 = "";
	    if (photoData != null && photoData.length > 0) {
	        photoBase64 = Base64.getEncoder().encodeToString(photoData);
	    }

	    // Add the Base64-encoded photo data to the model
	    model.addAttribute("photoBase64", photoBase64);
	
	
		return "changeCompanyProfile";
	}
	
	@RequestMapping(value="/editCompProfile", method=RequestMethod.POST)
	public String updateProfile(@ModelAttribute Company company,
	                            String about,
	                            Long contact_1,
	                            Long contact_2,
	                            String web_url,
	                            String city,
	                            @RequestParam(value = "companylogo", required = false) MultipartFile companyLogo) {
	    User user1 = (User) session.getAttribute("user");

	    if (user1 == null) {
	        return "redirect:/logout";
	    }

	    User user = userService.getUserById(user1.getId());
	    String email = user.getEmail();

	    Company existCompany = compService.getCompanyById(email);
	    if (existCompany == null) {
	        return "redirect:/editCompProfile";
	    }

	    // Update logo only if a new file is provided or if the existing logo is empty
	    if (companyLogo != null && !companyLogo.isEmpty()) {
	        try {
	            existCompany.setLogo(companyLogo.getBytes());
	        } catch (IOException e) {
	            e.printStackTrace();
	            // Handle exception as needed
	        }
	    } else if (existCompany.getLogo() == null || existCompany.getLogo().length == 0) {
	        // Optional: handle the case where the existing logo is empty
	        
	    }

	    // Update other fields
	    existCompany.setAbout(about);
	    existCompany.setContact_1(contact_1);
	    existCompany.setContact_2(contact_2);
	    existCompany.setWeb_url(web_url);
	   
	    if (existCompany.getCity() == null) {
	        existCompany.setCity(company.getCity());
	    }
	    // Save the updated company entity
	    compService.saveCompony(existCompany);

	    return "redirect:/editCompProfile";
	}

	
	
	 @GetMapping("/get_logos")
	    public ResponseEntity<byte[]> getLogoById(@RequestParam Long id) {
	    	Company company = compService.getCompany(id);
	        if (company == null || company.getLogo() == null) {
	            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
	        }

	        byte[] logo = company.getLogo();

	        HttpHeaders headers = new HttpHeaders();
	        headers.setContentType(MediaType.IMAGE_JPEG); // Adjust media type if needed (e.g., IMAGE_PNG)
	        headers.setContentLength(logo.length);

	        return new ResponseEntity<>(logo, headers, HttpStatus.OK);
	    }
	
	
	
   
	//**************Interns Request***************
	
	@RequestMapping(value="/approveStudentRequest")
	public String internsApprove_Reject(){
		
		return "redirect:interns_verify_reuest";
	}
	
	@RequestMapping("/compname_exists")
	public @ResponseBody String checkcompname(@RequestParam String company_name){
			return "exists";
		}
	
	
	@GetMapping("/getCompanyDetails")
	public @ResponseBody Company getdetails(@RequestParam("company_id") Long company_id)
	{
	    System.out.println("working " + company_id);
	    
	    if (String.valueOf(company_id).startsWith("987")) {
	        // Execute userService
	        User userCollege = userService.findByInstitute(company_id);
	        Company comp = compService.getCompanyById(userCollege.getEmail());
	        Company company = compService.getCompany(comp.getCompany_id());
	        System.out.println("Company " + company);
	        return company;
	    } else {
	        // Execute default logic
	        Company company = compService.getCompany(company_id);
	        return company;
	    }
	}


	
	

	@InitBinder
	protected void initBinder(WebDataBinder binder) {
//		SimpleDateFormat dateFormat = new SimpleDateFormat(ProjectConstants.date_format);
//		binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, false));
	}
}
