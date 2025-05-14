package com.skillpilots.controller.company;

import java.time.LocalDate;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Optional;
import java.util.UUID;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.MethodArgumentNotValidException;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.skillpilots.Dto.CompManagerDto;
import com.skillpilots.Dto.TeamDto;
import com.skillpilots.model.BalanceData;
import com.skillpilots.model.CompDeptLink;
import com.skillpilots.model.Company;
import com.skillpilots.model.User;
import com.skillpilots.service.BalanceDataService;
import com.skillpilots.service.CompDeptService;
import com.skillpilots.service.ComponyService;
import com.skillpilots.service.UserService;
import com.skillpilots.utility.ProjectConstants;

import jakarta.mail.MessagingException;
import jakarta.servlet.http.HttpSession;

@Controller
public class CompMemberController {
	@Autowired
	private UserService userService;
	@Autowired
	private HttpSession session;
	@Autowired
	private CompDeptService compDeptService;
	@Autowired
	private ComponyService componyService;
	@Autowired
	private BalanceDataService balanceDataService;

	@RequestMapping(value = "/add_company_member", method = RequestMethod.GET)
	public String addCompMember(Model model) {

		User user2 = (User) session.getAttribute("user");
		if (user2 != null) {
			List<User> userList = userService.findAllByManager();
			List<CompManagerDto> allCompManager = null;
			List<TeamDto> teams = null;
			Long commaonId = (user2 != null && user2.getCommonId() != null) ? user2.getCommonId()
					: user2.getInstituteId();
//	List<User> userListDeleted=	userService.findAllByManagerDeleted();
//	List<User> userInternshipLeadListDeleted=	userService.findAllByInternshipLeadDeleted();
//	List<User> InternshipLead =  userService.findAllByCommanIdintershipLead(commaonId);
			if (user2.getRole().equals("1")) {
				Company company = componyService.getCompanyById(user2.getEmail());
				teams = compDeptService.getAllDept(company.getCompany_id(),
						ProjectConstants.comp_dept_link_status_active);
				allCompManager = compDeptService.getAllCompManager(company.getCompany_id(),
						ProjectConstants.comp_dept_link_status_active);
				System.out.println("all manage list" + allCompManager);

				model.addAttribute("manager_list", allCompManager);
			} else if (user2.getRole().equals("2")) {
				User u = userService.findByEmailAndRole(user2.getRole(), user2.getEmailIdCommon());
				
				Company company = componyService.getCompanyById(u.getEmailIdCommon());
				allCompManager = compDeptService.getAllCompManager(company.getCompany_id(),
						ProjectConstants.comp_dept_link_status_active);
				teams = compDeptService.getAllDept(company.getCompany_id(),
						ProjectConstants.comp_dept_link_status_active);
				model.addAttribute("manager_list", allCompManager);

			}

			else if (user2.getRole().equals("3") || user2.getRole().equals("4")) {
//		teams	= compDeptService.getTeams(user2.getId());
				teams = compDeptService.getManagerAndLead(user2.getId(), user2.getTeam_name());

			}

			System.out.println("all departments   " + teams);
			System.out.println("manager list     shsujs" + teams);
			model.addAttribute("compTeamLinkList", teams);
			model.addAttribute("userList", userList);
//	model.addAttribute("InternshipLead", InternshipLead);
//	model.addAttribute("userListDeleted", userListDeleted);
//	model.addAttribute("userInternshipLeadListDeleted", userInternshipLeadListDeleted);
			return "comp_member";

		} else {
			return "redirect:logout";
		}
	}

	@RequestMapping(value = "/add_company_member", method = RequestMethod.POST)
	public String add_Member(@Valid @ModelAttribute User user,
			@RequestParam(value = "team_name", required = false) String team_name,
			@RequestParam(value = "compDeptLinkId", required = false) Long compDeptLinkId,

			@RequestParam("form_action") String form_action,
			@RequestParam(value = "exist_manager_id", required = false) Long exist_user_id, BindingResult bindingResult)
			throws MessagingException, MethodArgumentNotValidException

	{
		if (bindingResult.hasErrors()) {
			throw new MethodArgumentNotValidException(null, bindingResult);
		}

		String body=null;
		User user3 = userService.findByUsername(user.getUsername());

		String password = UUID.randomUUID().toString().substring(0, 5);
		password = password.replaceAll("\\s", "");
		
		// user.setCommonId(commaonId);
		user.setVerified(1);

		user.setOtp("007");
		user.setPassword(password);
		user.setTemp_pass(ProjectConstants.reg_user_temp_pass_yes);
		user.setTeam_name(team_name);
		User user2 = (User) session.getAttribute("user");
		Long commaonId = (user2 != null && user2.getCommonId() != null) ? user2.getCommonId() : user2.getInstituteId();
		if (user2 != null) {
			if (user3 != null && user3.getUsername().equals(user.getUsername())) {
				if (user.getId() == null && user.getTeam_name() != null) {
					Company company3 = componyService.getCompanyById(user3.getEmailIdCommon());
					User user5 = userService.findByUsername(user.getUsername());
					CompDeptLink compDeptLink3 = new CompDeptLink();
					 body = "<h1 style=\"font-size:55px;margin:20px;text-align:center\">Welcome to <span style=\"color:#1974c3;\">Skill<span style=\"color:#01af36;\">Pilots</span> </h1>"
							+ "<p style=\"text-align:center\"><strong>Dear " + user.getUsername() + ",</strong></p>"
							+ "<p style=\"text-align:center\">Here is your registration code - <strong>" + password
							+ "</strong><br>"
							+ "Click <a href='https://www.skillpilots.com/'><strong>here</strong></a> to Login.<br>"
							+ "You'll be asked to change your password for security reasons.<br><br>"
							+ "<strong>Congratulations!</strong> You have been assigned a manager for the company <strong>" + company3.getCompany_name() + "</strong>.<br><br>"
							+ "<p style=\"text-align:center\"><strong>Your Temporary Password:</strong> <span style=\"font-size:20px;color:#e84c3d;\">" + password + "</span></p><br>"
							+ "Thanks & Regards,<br>SkillPilots Team</p>"
							+ "<p style=\"text-align:justify;font-size:12px;\">Note: This is a system generated mail, please do not reply to it. This mailbox isn't being monitored.<br>"
							+ "The information contained in this e-mail and/or attachments to it contain confidential or privileged information."
							+ "If you are not the intended recipient, any dissemination, use, review, distribution, printing or copying of the"
							+ " information contained in this e-mail message and/or attachments to it are strictly prohibited."
							+ "If you have received this communication in error, please notify us at +91712-2241405.</p>";

					BalanceData balanceData = new BalanceData();
					compDeptLink3.setCompany_id(company3.getCompany_id());
					compDeptLink3.setManager_id((long) user5.getId());
					compDeptLink3.setDept_name(team_name);
					compDeptLink3.setCreation_date(LocalDate.now());
					compDeptLink3.setEffective_date(LocalDate.now());
					compDeptLink3.setStatus(ProjectConstants.comp_dept_link_status_active);

					// balanceData= balanceDataService.getBalanceData(company.getCompany_id());
					compDeptService.saveCompDeptLink(compDeptLink3);
					return "redirect:add_company_member";
				}
				if (user != null) {
					CompDeptLink user5 = compDeptService.findById(user.getId());
					if (user5 != null && user.getId() == user5.getComp_dept_link_id()) {
						// Update existing CompDeptLink object
						user5.setManager_id((long) user3.getId());
						compDeptService.saveCompDeptLink(user5); // Save the updated object
						return "redirect:add_company_member";

					} else {
						System.out.println("add new manager" + user2.getEmailIdCommon());
						Company company = componyService.getCompanyById(user3.getEmailIdCommon());
						User user4 = userService.findByUsername(user.getUsername());
						CompDeptLink compDeptLink = new CompDeptLink();

						BalanceData balanceData = new BalanceData();
						compDeptLink.setCompany_id(company.getCompany_id());
						compDeptLink.setManager_id((long) user4.getId());
						compDeptLink.setDept_name(team_name);
						compDeptLink.setCreation_date(LocalDate.now());
						compDeptLink.setEffective_date(LocalDate.now());
						compDeptLink.setStatus(ProjectConstants.comp_dept_link_status_active);

						// balanceData= balanceDataService.getBalanceData(company.getCompany_id());
						compDeptService.saveCompDeptLink(compDeptLink);
						userService.sendVerificationEmail(user.getEmail(), ProjectConstants.mail_subject_first_login,
								body);

						return "redirect:add_company_member";
					}
				}

				System.out.println("add new manager" + user2.getEmailIdCommon());
				Company company = componyService.getCompanyById(user3.getEmailIdCommon());
				User user4 = userService.findByUsername(user.getUsername());
				CompDeptLink compDeptLink = new CompDeptLink();

				BalanceData balanceData = new BalanceData();
				compDeptLink.setCompany_id(company.getCompany_id());
				compDeptLink.setManager_id((long) user4.getId());
				compDeptLink.setDept_name(team_name);
				compDeptLink.setCreation_date(LocalDate.now());
				compDeptLink.setEffective_date(LocalDate.now());
				compDeptLink.setStatus(ProjectConstants.comp_dept_link_status_active);

				// balanceData= balanceDataService.getBalanceData(company.getCompany_id());
				compDeptService.saveCompDeptLink(compDeptLink);
				userService.sendVerificationEmail(user.getEmail(), ProjectConstants.mail_subject_first_login, body);

				return "redirect:add_company_member";
			}
			String password1 = UUID.randomUUID().toString().substring(0, 5);
			password1 = password.replaceAll("\\s", "");

			// user.setCommonId(commaonId);
			user.setOtp("007");
			user.setPassword(password);
			user.setTemp_pass(ProjectConstants.reg_user_temp_pass_yes);
			user.setTeam_name(team_name);
			user.setVerified(1);
			String body1 = "<h1 style=\"font-size:55px;margin:20px;text-align:center\">Welcome to <span style=\"color:#1974c3;\">Skill<span style=\"color:#01af36;\">Pilots</span> </h1>"
					+ "<p style=\"text-align:center\"> Here is your registration code - <strong>" + password
					+ "</strong><br>"
					+ "Click <a href='https://www.skillpilots.com/'><strong>here</strong></a> to Login.<br>"

					+ "You'll be asked to change your password for security reasons.<br><br>"
					+ "Thanks & Regards,<br>SkillPIlots Team</p>"
					+ "<p style=\"text-align:justify;font-size:12px;\">Note:This is a system generated mail, please do not reply to it. This mailbox isn't being monitored.<br>"
					+ "The information contained in this e-mail and/or attachments to it contain confidential or privileged information."
					+ "If you are not the intended recipient, any dissemination, use, review, distribution, printing or copying of the"
					+ " information contained in this e-mail message and/or attachments to it are strictly prohibited."
					+ "If you have received this communication in error, please notify us at +91712-2241405.</p>";
			CompDeptLink compDeptLink = new CompDeptLink();
			CompDeptLink oldCompDeptLink = new CompDeptLink();
			BalanceData balanceData = new BalanceData();
			if (user2.getRole().equals("2")) {

				User u = userService.findByEmailAndRole(user2.getRole(), user2.getEmailIdCommon());
				System.out.println("add new manager" + user2.getEmailIdCommon());
				Company company = componyService.getCompanyById(u.getEmailIdCommon());
				user.setRole(ProjectConstants.iii_role4manager);
				if (form_action.equals("NewTeam")) {
					user.setRole(ProjectConstants.iii_role4manager);
					user.setEmailIdCommon(user2.getEmailIdCommon());
					userService.save(user);
					compDeptLink.setCompany_id(company.getCompany_id());
					compDeptLink.setManager_id(user.getId());
					compDeptLink.setDept_name(team_name);
					compDeptLink.setCreation_date(LocalDate.now());
					compDeptLink.setEffective_date(LocalDate.now());
					compDeptLink.setStatus(ProjectConstants.comp_dept_link_status_active);

					// balanceData= balanceDataService.getBalanceData(company.getCompany_id());
					compDeptService.saveCompDeptLink(compDeptLink);
					userService.sendVerificationEmail(user.getEmail(), ProjectConstants.mail_subject_first_login,
							body1);

				}

			} else if (user2.getRole().equals("1")) {
				Company company = componyService.getCompanyById(user2.getEmail());
				if (form_action.equals("NewTeam") || form_action.equals("new")) {
					user.setRole(ProjectConstants.iii_role4manager);
					user.setEmailIdCommon(user2.getEmail());
					userService.save(user);
					compDeptLink.setCompany_id(company.getCompany_id());
					// compDeptLink.setManager_id(user.getId());
					compDeptLink.setDept_name(team_name);
					compDeptLink.setCreation_date(LocalDate.now());
					compDeptLink.setEffective_date(LocalDate.now());
					compDeptLink.setStatus(ProjectConstants.comp_dept_link_status_active);
					compDeptLink.setManager_id(user.getId());

					compDeptService.saveCompDeptLink(compDeptLink);

					String body11 = "<h1 style=\"font-size:55px;margin:20px;text-align:center\">Welcome to <span style=\"color:#1974c3;\">Skill<span style=\"color:#01af36;\">Pilots</span> </h1>"
							+ "<p style=\"text-align:center\"> Here is your registration code - <strong>" + password
							+ "</strong><br>"
							+ "Click <a href='https://www.skillpilots.com/'><strong>here</strong></a> to Login.<br>"

							+ "You'll be asked to change your password for security reasons.<br><br>"
							+ "Thanks & Regards,<br>SkillPIlots Team</p>"
							+ "<p style=\"text-align:justify;font-size:12px;\">Note:This is a system generated mail, please do not reply to it. This mailbox isn't being monitored.<br>"
							+ "The information contained in this e-mail and/or attachments to it contain confidential or privileged information."
							+ "If you are not the intended recipient, any dissemination, use, review, distribution, printing or copying of the"
							+ " information contained in this e-mail message and/or attachments to it are strictly prohibited."
							+ "If you have received this communication in error, please notify us at +91712-2241405.</p>";
					userService.sendVerificationEmail(user.getEmail(), ProjectConstants.mail_subject_first_login,
							body11);
				} else if (user2.getRole().equals("1") && form_action.equalsIgnoreCase("ChangeManager")) {

				
					String body11 = "<h1 style=\"font-size:55px;margin:20px;text-align:center\">Welcome to <span style=\"color:#1974c3;\">Skill<span style=\"color:#01af36;\">Pilots</span> </h1>"
							+ "<p style=\"text-align:center\"> Here is your registration code - <strong>" + password
							+ "</strong><br>"
							+ "Click <a href='https://www.skillpilots.com/'><strong>here</strong></a> to Login.<br>"

							+ "You'll be asked to change your password for security reasons.<br><br>"
							+ "Thanks & Regards,<br>SkillPIlots Team</p>"
							+ "<p style=\"text-align:justify;font-size:12px;\">Note:This is a system generated mail, please do not reply to it. This mailbox isn't being monitored.<br>"
							+ "The information contained in this e-mail and/or attachments to it contain confidential or privileged information."
							+ "If you are not the intended recipient, any dissemination, use, review, distribution, printing or copying of the"
							+ " information contained in this e-mail message and/or attachments to it are strictly prohibited."
							+ "If you have received this communication in error, please notify us at +91712-2241405.</p>";
					
					
					System.out.println("eeeeeeeeeeeeeeeeeeeeee"+ exist_user_id);
					if(exist_user_id!=null) {
						User existUser = userService.getUserById(exist_user_id);
						compDeptLink = compDeptService.getCompDeptLink(user.getId());

						compDeptLink.setManager_id(exist_user_id);

						compDeptLink.setStatus(ProjectConstants.comp_dept_link_status_active);
						compDeptService.saveCompDeptLink(compDeptLink);
						
						userService.sendVerificationEmail(existUser.getEmail(), ProjectConstants.mail_subject_first_login,
								body11);
						return "redirect:add_company_member";
					}
					
					compDeptLink = compDeptService.getCompDeptLink(user.getId());
					System.out.println("sssssssssss"+ compDeptLink);
					User newUser = new User();
					newUser.setEmail(user.getEmail());
					newUser.setTeam_name(team_name);
					newUser.setRole(ProjectConstants.iii_role4manager);
					newUser.setEmailIdCommon(user2.getEmail());
					newUser.setUsername(user.getUsername());
					newUser.setVerified(1);

					// user.setCommonId(user.getCommonId());
					newUser.setOtp("007");
					newUser.setPassword(password);
					newUser.setTemp_pass(ProjectConstants.reg_user_temp_pass_yes);
					
					userService.sendVerificationEmail(user.getEmail(), ProjectConstants.mail_subject_first_login,
							body11);

					User myuser = userService.save(newUser);
					compDeptLink.setManager_id(myuser.getId());

					compDeptLink.setStatus(ProjectConstants.comp_dept_link_status_active);
					compDeptService.saveCompDeptLink(compDeptLink);

				}
				return "redirect:add_company_member";
			}

			else if (user2.getRole().equals(ProjectConstants.iii_role4manager)) {
				user.setRole(ProjectConstants.internshipLead);
				user.setEmailIdCommon(user2.getEmailIdCommon());
				user.setTeam_name(user2.getTeam_name());
				user.setVerified(1);

				userService.save(user);
				User u = userService.findByEmailAndRoleAndTeamName(user2.getEmail(), user2.getRole(),
						user2.getEmailIdCommon(), user2.getTeam_name());
				Company company = componyService.getCompanyById(u.getEmailIdCommon());
				if (form_action.equals("AssignLead")) {
					compDeptLink = compDeptService.getCompDeptLink(compDeptLinkId);

					compDeptLink.setInternship_lead_id(user.getId());
					compDeptLink.setUpdation_date(new Date());
					compDeptLink.setCompany_id(company.getCompany_id());
					compDeptLink.setStatus(ProjectConstants.comp_dept_link_status_active);
					compDeptService.saveCompDeptLink(compDeptLink);

					userService.sendVerificationEmail(user.getEmail(), ProjectConstants.mail_subject_first_login,
							body1);

				}
//			
//			compDeptLink = compDeptService.getCompDeptLink(compDeptLinkId);
//
//			user.setRole(ProjectConstants.internshipLead);
//			compDeptLink.setInternship_lead_id(user.getId());
//			compDeptLink.setCompany_id(company.getCompany_id());
//			compDeptLink.setStatus(ProjectConstants.comp_dept_link_status_active);
//			userService.sendVerificationEmail(user.getEmail(), ProjectConstants.mail_subject_first_login, body);
//			

				if (form_action.equals("ChangeLead")) {
					{
						System.out.println("change lead " + compDeptLinkId);
						compDeptLink = compDeptService.getCompDeptLink(compDeptLinkId);
						oldCompDeptLink = compDeptService.getCompDeptLink(compDeptLinkId);
						// deactivate old lead
						oldCompDeptLink.setExpiration_date(new Date());
						oldCompDeptLink.setStatus(ProjectConstants.comp_dept_link_status_deactivate);
						compDeptService.saveCompDeptLink(oldCompDeptLink);

						User oldLead = userService.getUserById(oldCompDeptLink.getInternship_lead_id());
						oldLead.setTeam_name(null);
						oldLead.setExpiration_rsn(ProjectConstants.reg_user_expiration_rsn_dept_changed);
						userService.save(oldLead);
						user.setTeam_name(compDeptLink.getDept_name());
						user.setRole(ProjectConstants.internshipLead);
						user.setEmailIdCommon(user2.getEmailIdCommon());
						user.setVerified(1);

						userService.save(user);
						// create new lead
						compDeptLink.setInternship_lead_id(user.getId());
						compDeptLink.setCreation_date(LocalDate.now());
						compDeptLink.setEffective_date(LocalDate.now());
						compDeptLink.setStatus(ProjectConstants.comp_dept_link_status_active);
						compDeptService.saveCompDeptLink(compDeptLink);
						userService.sendVerificationEmail(user.getEmail(), ProjectConstants.mail_subject_first_login,
								body1);

					}
				}

			}
			return "redirect:add_company_member";
		} else {
			return "redirect:/login_check";
		}
	}

//	@RequestMapping("/cancel_com_team")
//	public @ResponseBody String cancelMemReq(@RequestParam("team_id") Long team_id){
//		if(null!=team_id){
//			CompDeptLink compDeptLink = compDeptService.getCompDeptLink(team_id);
//			List<HashMap<Long, Long>> list=compDeptService.getTeams(compDeptLink.getManager_id(), compDeptLink.getManager_id());
//			System.out.println("******"+list.size());
//			//Check if manager has any other team active
//			if(list.size()==1){
//				User manager=userService.getUserById(compDeptLink.getManager_id());
//			//	manager.setExpiration_date(new Date());
//				manager.setExpiration_rsn(ProjectConstants.reg_user_expiration_rsn_dept_del);
//				userService.save(manager);//dont update session
//			}
//			if(null!=compDeptLink.getInternship_lead_id()){
//				User internshipLead=userService.getUserById(compDeptLink.getInternship_lead_id());
//				internshipLead.setExpiration_date(new Date());
//				internshipLead.setExpiration_rsn(ProjectConstants.reg_user_expiration_rsn_dept_del);
//				userService.updateUser(internshipLead,false);//dont update session
//			}
//			internshipsService.cancelInternshipsForCompDept(compDeptLink.getCompany_id(), compDeptLink.getDept_name());
//			companyInternalRequestService.cancelInternalReqForCompDept(compDeptLink.getCompany_id(), compDeptLink.getDept_name());
//			compDeptLink.setStatus(ProjectConstants.comp_dept_link_status_deleted);
//			compDeptLink.setExpiration_date(new Date());
//			compDeptLinkService.updateCompDeptMem(compDeptLink);
//			return "sucess";
//		}else{
//			return "error";
//		}
//
//	}
}
