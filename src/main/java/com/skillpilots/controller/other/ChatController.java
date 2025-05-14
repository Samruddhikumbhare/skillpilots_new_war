package com.skillpilots.controller.other;

import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.util.Arrays;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.skillpilots.Dto.CompManagerDto;
import com.skillpilots.model.CollDeptLink;
import com.skillpilots.model.CompDeptLink;
import com.skillpilots.model.Company;
import com.skillpilots.model.Internships;
import com.skillpilots.model.LiveChat;
import com.skillpilots.model.NotificationRequest;
import com.skillpilots.model.User;
import com.skillpilots.repository.CompDeptRepository;
import com.skillpilots.repository.CompanyDeptRepo;
import com.skillpilots.repository.InternshipRepository;
import com.skillpilots.repository.NotificationRepository;
import com.skillpilots.repository.UserRepository;
import com.skillpilots.service.CollDeptService;
import com.skillpilots.service.CompDeptService;
import com.skillpilots.service.ComponyService;
import com.skillpilots.service.InternshipService;
import com.skillpilots.service.LiveChatService;
import com.skillpilots.service.UserService;
import com.skillpilots.utility.ProjectConstants;

import jakarta.servlet.http.HttpSession;

@Controller
public class ChatController {
	@Autowired
	private UserService userService;
	@Autowired
	private LiveChatService liveChatService;
	@Autowired
	private HttpSession session;
	@Autowired
	private InternshipService internshipService;
	@Autowired
	private CompDeptService compDeptService;
	@Autowired
	private CollDeptService collDeptService;
	@Autowired
	private UserRepository userRepository;
	@Autowired
	private InternshipRepository internshipRepository;
	@Autowired
	private ComponyService componyService;
	@Autowired
	private CompDeptRepository companyDeptRepo;
	@Autowired
	private NotificationRepository notificationRepository;

	@RequestMapping("/live_chat")
	public String ChatHome(Model model) {
		User user = (User) session.getAttribute("user");

		System.out.println("TAnposhsjdg" + user.getCollege_id());

		List<User> Manager = userService.findAllByRole2();
		List<User> Lead = userService.findAllByRole3();
		List<User> incharge = userService.findAllByRole4();
		List<User> tpos = userRepository.getTpo(user.getCollege_id());
		List<Map<String, Object>> students = userService.findAllByRole6();
		List<User> hod = userService.findAllByRole7();

		if (user.getRole().equals("0")) {
			List<Internships> ir = internshipService.getCompanies(user.getId());
			if (!ir.isEmpty()) {
				for (Internships i : ir) {
					CompDeptLink comp = compDeptService.getAllCompManagers(i.getCompany_id(), i.getComp_dept_id());
					List<User> manager2 = userService.getManager(comp.getManager_id());
					List<User> internshipLead = userService.getInternshipLead(comp.getInternship_lead_id());
					System.out.println("managerssssssssssssssss" + manager2);
					model.addAttribute("Manager", manager2);
					model.addAttribute("Lead", internshipLead);
					model.addAttribute("students", students);

				}
			}

			if (!(0 == user.getCollege_id())) {
				CollDeptLink cdl = collDeptService.getHeadId(user.getCollege_id(), user.getDepartment());
				if (cdl == null) {
					return "live_chat";

				}
				List<User> hod2 = userService.getHod(cdl.getHead_id());
				List<User> deptIncharge = userService.getDeptIncharge(cdl.getIii_dept_co_id());
				model.addAttribute("incharge", deptIncharge);
				model.addAttribute("hod", hod2);
				model.addAttribute("tpos", tpos);
				model.addAttribute("students", students);

			}
			if (!ir.isEmpty()) {
				for (Internships i : ir) {
					List<User> u2 = userService.getHR(i.getCompany_id());
					model.addAttribute("HR", u2);

				}
			}
		}

		else if (user.getRole().equals(ProjectConstants.company)) {

			
			List<Map<String, Object>> tpo = userRepository.getTpo();
			model.addAttribute("tpo", tpo);
			
		} else if (user.getRole().equals(ProjectConstants.hod)) {
			CollDeptLink cdl = collDeptService.getHeadId(user.getCollege_id(), user.getDepartment());
			if (cdl == null) {
				return "live_chat";

			}
			model.addAttribute("tpos", tpos);
			List<User> deptIncharge = userService.getDeptIncharge(cdl.getIii_dept_co_id());
			model.addAttribute("incharge", deptIncharge);
			model.addAttribute("students", students);

		} else if (user.getRole().equals(ProjectConstants.tpheadiiicell)) {
			List<User> hod1 = userRepository.findByEmail(ProjectConstants.hod, user.getEmailIdCommon());
			List<Map<String, Object>> company = userRepository.getCompany();
			model.addAttribute("company", company);

			model.addAttribute("hod", hod1);
			List<Internships> companyId = internshipRepository.getCompanyId(Long.valueOf(user.getCollege_id()));
			for (Internships i : companyId) {
				List<User> u2 = userService.getHR(i.getCompany_id());
				model.addAttribute("HR", u2);
				model.addAttribute("students", students);

			}

		} else if (user.getRole().equals(ProjectConstants.iii_role3deptIn)) {
			CollDeptLink cdl = collDeptService.getHeadId(user.getCollege_id(), user.getDepartment());
			if (cdl == null) {
				return "live_chat";

			}
			List<User> hod2 = userService.getHod(cdl.getHead_id());
			List<User> hod1 = userRepository.findByEmail(ProjectConstants.hod, user.getEmailIdCommon());
			model.addAttribute("hod", hod2);
			model.addAttribute("students", students);


		}

		else if (user.getRole().equals(ProjectConstants.iii_role4manager)) {
			Company companyById = componyService.getCompanyById(user.getEmailIdCommon());
			List<User> u2 = userService.getHR(companyById.getCompany_id());
			model.addAttribute("HR", u2);

			model.addAttribute("students", students);
			List<Map<String, Object>> leadforManager = companyDeptRepo.getLeadforManager(user.getId(),
					companyById.getCompany_id());
			System.out.println("Leadddddddddd" + leadforManager.toString());
			model.addAttribute("incharge", leadforManager);

		} else if (user.getRole().equals(ProjectConstants.internshipLead)) {
			Company companyById = componyService.getCompanyById(user.getEmailIdCommon());

			List<Map<String, Object>> managerforLead = companyDeptRepo.getManagerforLead(user.getId(),
					companyById.getCompany_id());
			model.addAttribute("manager", managerforLead);

		}

		return "live_chat";
	}

	@PostMapping("/saveChat")
	public String saveChat(@RequestParam("message") String message, @RequestParam("sender_id") Long sender_id,
			@RequestParam("receiver_id") Long receiver_id) {
		User user = (User) session.getAttribute("user");
		Date today = new Date();
		SimpleDateFormat formatter = new SimpleDateFormat("MMM.dd 'AT' hh:mm a");
		String timestamp = formatter.format(today);
		LiveChat chat = new LiveChat();
		chat.setMessage(message);
		// chat.setChat_id(sender_id);
		chat.setSenderId(sender_id);
		chat.setReceiverId(receiver_id);
		chat.setTimestamp(timestamp);
		NotificationRequest notificationRequest = new NotificationRequest();
		notificationRequest.setTitle("New Message Received");
		notificationRequest.setDateTime(LocalDateTime.now());
		notificationRequest.setMsgBody(user.getUsername());
		notificationRequest.setReceiverId(receiver_id);
		notificationRepository.save(notificationRequest);
		liveChatService.save(chat);

		System.out.println("" + chat);
		return "live_chat";
	}

	@GetMapping("/getChat")
	@ResponseBody
	public List<LiveChat> getChats(@RequestParam("senderId") Long senderId,
			@RequestParam("receiverId") Long receiverId) {

		return liveChatService.findChatMessagesBySenderAndReceiver(senderId, receiverId);
	}

	@GetMapping("/meet")
	public String meet() {
		return "meet";
	}

	@GetMapping("/aiChat")
	public String getAiChat() {
		return "AIchat";

	}
}
