package com.skillpilots.controller.college;

import java.util.Date;
import java.util.List;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.skillpilots.model.College;
import com.skillpilots.model.Company;
import com.skillpilots.model.PackagesData;
import com.skillpilots.model.User;
import com.skillpilots.service.BalanceDataService;
import com.skillpilots.service.CollegeService;
import com.skillpilots.service.ComponyService;
import com.skillpilots.service.PackageDataService;
import com.skillpilots.service.UserService;
import com.skillpilots.utility.ProjectConstants;

import jakarta.servlet.http.HttpSession;



@Controller
public class BalanceDataAndPackageDataController {
	
	@Autowired
	private HttpSession session;
	@Autowired
	private BalanceDataService balanceDataService;
	@Autowired
	private ComponyService componyService;
	@Autowired
	private CollegeService collegeService;
	@Autowired
	private PackageDataService packageDataService;
	@Autowired
	private UserService userService;
	
	@RequestMapping("/get_balancedata_list")
	public @ResponseBody List<?> getbdlist() {
	
			return null;
		
	}

	@RequestMapping("/get_clgPkg_list")
	public @ResponseBody List<?> getpkglist(@RequestParam("package_for")String package_for,@RequestParam("package_type")String package_type) {
//		List<PackagesData> list = packageService.getRechargePackages(package_for,package_type);
		return null;
	}
	
	@RequestMapping("/add_balancedata")
	public @ResponseBody String addBalanceData(@RequestParam("package_id")int package_id) throws Exception {
		
			
			return "success";
		
			
		//balanceDataService.addBalanceData(balanceData);
		
	}
	
	@GetMapping("/collegeTransactions")
	public String collegeTransactions(Model model){
		
		User user = (User) session.getAttribute("user");
		List<Object[]> balanceDetails=null;
		College college=null;
		if(user!=null){
			
			if(user.getRole().equals(ProjectConstants.college)) {
				college = collegeService.getCollegeByEmail(user.getEmail());
				 balanceDetails=balanceDataService.getBalanceDetails(college.getCollege_id(), "College");

			}else if(user.getRole().equals(ProjectConstants.tpheadiiicell)) {
				User u = userService.findByEmailAndRole(user.getRole(), user.getEmailIdCommon());
				college = collegeService.getCollegeByEmail(u.getEmailIdCommon());
				 balanceDetails=balanceDataService.getBalanceDetails(college.getCollege_id(), "College");

			}
			
		
			 System.out.println("balanceDetails: ");
		        if (balanceDetails != null) {
		            for (Object[] detail : balanceDetails) {
		                for (Object obj : detail) {
		                    System.out.print(obj + " ");
		                }
		                System.out.println();
		            }
		        }
			model.addAttribute("balanceDetails",balanceDetails);
			
			//model.addAttribute("sidebar", navBarUtil.getCompanyNavBar(ProjectConstants.sidebar_map_key_balances));
			return "collegeTransactions";
		}else{
			return "redirect:logout";
		}}
	
	@GetMapping("/companyTransactions")
	public String companyTransactions(Model model){
		User user = (User) session.getAttribute("user");
		List<Object[]> balanceDetails=null;
		Company company=null;
		if(user!=null){
			
			if(user.getRole().equals(ProjectConstants.company)) {
				 company = componyService.getCompanyById(user.getEmail());
				 balanceDetails=balanceDataService.getBalanceDetails(company.getCompany_id(), "Compony");

			}else if(user.getRole().equals(ProjectConstants.hr)) {
				User u = userService.findByEmailAndRole(user.getRole(), user.getEmailIdCommon());
				company = componyService.getCompanyById(u.getEmailIdCommon());
				 balanceDetails=balanceDataService.getBalanceDetails(company.getCompany_id(), "Compony");

			}
			
		
			 System.out.println("balanceDetails: ");
		        if (balanceDetails != null) {
		            for (Object[] detail : balanceDetails) {
		                for (Object obj : detail) {
		                    System.out.print(obj + " ");
		                }
		                System.out.println();
		            }
		        }
			model.addAttribute("balanceDetails",balanceDetails);
			
			//model.addAttribute("sidebar", navBarUtil.getCompanyNavBar(ProjectConstants.sidebar_map_key_balances));
			return "companyTransactions";
		}else{
			return "redirect:logout";
		}
		
	}
	
	@RequestMapping("/getBalanceDetails")
	public @ResponseBody List<Object[]> getBalanceDetails(@RequestParam("balance_id")Long balance_id){
	return balanceDataService.getBalanceUsage(balance_id);  
		
	}
	
	@RequestMapping("/getPackageDetails")
	public  @ResponseBody PackagesData getpkgDetails(@RequestParam("package_id")int package_id){
		return packageDataService.getPackageData(package_id);
	}
	
	@RequestMapping("/payment")
	public String Payment(){
		System.out.println(">>>>>>>>>>>>>>>>");
		return "redirect:payment";
	}
}
