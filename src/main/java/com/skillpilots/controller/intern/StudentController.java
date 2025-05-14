package com.skillpilots.controller.intern;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Base64;
import java.util.Collections;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;
import java.util.Random;
import java.util.concurrent.ExecutionException;
import java.util.stream.Collectors;

import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.ss.usermodel.WorkbookFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.DeleteMapping;

import com.skillpilots.Dto.AppliedCompanyDTO;
import com.skillpilots.Dto.CollegeInternalReqDto;
import com.skillpilots.model.CollDeptLink;
import com.skillpilots.model.College;
import com.skillpilots.model.CompAdvertisement;
import com.skillpilots.model.CompanyDrive;
import com.skillpilots.model.CompanyInternalRequest;
import com.skillpilots.model.Department;
import com.skillpilots.model.ExternalRequest;
import com.skillpilots.model.Internships;
import com.skillpilots.model.LiveProject;
import com.skillpilots.model.NotificationRequest;
import com.skillpilots.model.RecruitmentStatus;
import com.skillpilots.model.StickyNotes;
import com.skillpilots.model.Student;
import com.skillpilots.model.StudentPast;
import com.skillpilots.model.Technologies;
import com.skillpilots.model.Universities;
import com.skillpilots.model.User;
import com.skillpilots.repository.CompAdvertismentRepo;
import com.skillpilots.repository.CompanyDriveRepository;
import com.skillpilots.repository.RecruitmentStatusRepo;
import com.skillpilots.repository.StudentPastRepository;
import com.skillpilots.repository.StudentRepository;
import com.skillpilots.repository.UserRepository;
import com.skillpilots.service.CollDeptService;
import com.skillpilots.service.CollegeService;
import com.skillpilots.service.CompanyAdvertisementService;
import com.skillpilots.service.CompanyInternalRequestService;
import com.skillpilots.service.ComponyService;
import com.skillpilots.service.DepartmentService;
import com.skillpilots.service.ExternalRequestService;
import com.skillpilots.service.InternshipService;
import com.skillpilots.service.NotificationService;
import com.skillpilots.service.ProjectService;
import com.skillpilots.service.StickyNotesService;
import com.skillpilots.service.StudentRequestService;
import com.skillpilots.service.StudentService;
import com.skillpilots.service.TechnologyService;
import com.skillpilots.service.UniversitiesService;
import com.skillpilots.service.UserBeanService;
import com.skillpilots.service.UserService;
import com.skillpilots.utility.CommonUtil;
import com.skillpilots.utility.FirebaseService;
import com.skillpilots.utility.ProjectConstants;


import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;


//public class StudentController extends BeanCopyUtil{   sk
@Controller
public class StudentController {

	@Autowired
	private UserService userService;
	@Autowired
	private ComponyService componyService;
	@Autowired
	private StudentService studentService;
	@Autowired
	private HttpSession session;
	@Autowired
	private StudentRequestService studentRequestService;
	@Autowired
	private ExternalRequestService externalRequestService;
	@Autowired
	private CompanyInternalRequestService companyInternalRequestService;
	@Autowired
	private DepartmentService departmentService;
	@Autowired
	private TechnologyService technologyService;
	@Autowired
	private CollegeService collegeService;
	@Autowired
	private CompanyAdvertisementService companyAdvertisementService;
	@Autowired
	private CommonUtil commonUtil;
	@Autowired
	private UserBeanService beanService;
	@Autowired
	private CollDeptService collDeptService;
	@Autowired
	private NotificationService notificationService;
	@Autowired
	private InternshipService internshipService;
	@Autowired
	private UserRepository userRepository;
	@Autowired
	private FirebaseService firebaseService;
	@Autowired
	private StudentRepository studentRepository;
	@Autowired
	private StudentPastRepository studentPastRepository;
	@Autowired
	private ProjectService projectService;
	@Autowired
	private CompanyDriveRepository companyDriveRepository;
	@Autowired
	private RecruitmentStatusRepo recruitmentStatusRepo;
	@Autowired
	private CompAdvertismentRepo advertismentRepo;
	@Autowired
	private StickyNotesService  stickyNotesService;
	
	@Autowired
	private UniversitiesService universitiesService;
	
	public static final String uploadDirectory = "/newdemo/uploadedxls";

	
	
	   @PutMapping("/about")
	   @ResponseBody
	    public ResponseEntity<?> updateAbout( @RequestBody Map<String, String> payload) {
		   User user
			  = (User) session.getAttribute("user");
		   
		   Optional<Student> studentOpt = studentRepository.findById(user.getId());
	        if (studentOpt.isEmpty()) {
	            return ResponseEntity.status(HttpStatus.NOT_FOUND).body("Student not found");
	        }

	        Student student = studentOpt.get();
	        student.setAbout(payload.get("about"));
	        student.setUpdation_date(new Date());
	        studentRepository.save(student);

	        return ResponseEntity.ok("About updated successfully");
	    }
	
	
	
	
	
	  @GetMapping("/dash1") public String studentDashboard(Model model) { User user
	  = (User) session.getAttribute("user");
	  
	  model.addAttribute("user", user); LocalDate date = LocalDate.now(); String
	  formattedDate = date.format(DateTimeFormatter.ofPattern("dd-MMMM-yyyy"));
	  model.addAttribute("date", formattedDate);
	  
	  
	  // Assessment data 
	  List<Map<String, String>> assessments = new ArrayList<>();
	  assessments.add(Map.of("test", "Java", "level", "Basic", "score",
	  "40 Marks")); assessments.add(Map.of("test", "Python", "level", "Advance",
	  "score", "70 Marks")); model.addAttribute("assessments", assessments);
	  
	  
	  List<Map<String, String>> jobs = new ArrayList<>();
	  assessments.add(Map.of("title", "Java Devloper", "level", "Basic", "score",
	  "40 Marks")); assessments.add(Map.of("test", "Python", "level", "Advance",
	  "score", "70 Marks")); model.addAttribute("assessments", assessments);
	  
	  
	  Map<String, Integer> availableJobs = new LinkedHashMap<>();
	  availableJobs.put("Frontend Developer", 3);
	  availableJobs.put("UI/UX Designer", 2);
	  availableJobs.put("ReactJS Developer", 1);
	  model.addAttribute("availableJobs", availableJobs);
	  
	  // Available Internships 
	  Map<String, Integer> availableInternships = new
	  LinkedHashMap<>(); availableInternships.put("UI/UX Design Intern", 2);
	  availableInternships.put("Web Development Intern", 1);
	  availableInternships.put("Android App Intern", 1);
	  model.addAttribute("availableInternships", availableInternships);
	  
	  model.addAttribute("internshipsCompleted", 7);
	  model.addAttribute("jobApplications", 50); model.addAttribute("acceptedJobs",
	  10);
	  
	  // Course Progress 
	  model.addAttribute("courseProgress", Map.of( "UIUX", 30,
	  "Frontend", 50, "Python", 70 ));
	  
	  return "student_dash";
	  
	  }
	 
	@GetMapping("/dash")
	public String studentDashboard(Model model, HttpSession session) {
	    User user = (User) session.getAttribute("user");
	    if(user==null) {
	    	 return "redirect:/login";
	    }
	    model.addAttribute("user", user);
	    model.addAttribute("avtar", "https://cdn-icons-png.flaticon.com/512/3135/3135715.png");

	    Student student = studentRepository.findById(user.getId()).orElseThrow(()-> new RuntimeException("not found student"));
	    model.addAttribute("about", student.getAbout());
	    LocalDate date = LocalDate.now();
	    String formattedDate = date.format(DateTimeFormatter.ofPattern("dd-MMMM-yyyy"));
	    model.addAttribute("date", formattedDate);

	    // Assessments
        List<Map<String, Object>> assessments = studentService.getAssessmentData(user.getId());

        List<Internships> pending = internshipService.getCurrentInternshipsOfStudent(user.getId());
        List<Internships> completed = internshipService.getCompletedInternshipStude(user.getId());
       List<Internships> ongoing = internshipService.getOngoingInternshipStude(user.getId());
       List<Internships> cancelled = internshipService.getCancelledInternshipStude(user.getId());
        Map<String, Number> internships = Map.of(
            "approved", pending.stream().count(),
            "completed", ongoing.stream().count(),
            "totalSubmitted",completed.stream().count()
        );

        List<CompanyDrive> list = companyDriveRepository.findAll();
        List<AppliedCompanyDTO> appliedCount = recruitmentStatusRepo.getAppliedCount(user.getId());
        List<AppliedCompanyDTO> selectedCount = recruitmentStatusRepo.getSelectedCount(user.getId());
        // Jobs
        Map<String, Number> jobs = Map.of(
            "applied", appliedCount.stream().count(),
            "total", list.stream().count(),
            "accepted", selectedCount.stream().count()
        );

        
        List<CompanyDrive> top3 = list.stream()
        	    .limit(3)
        	    .collect(Collectors.toList());

        List<Map<String, String>> availableJobs = top3.stream()
        	    .map(dto -> (Map<String, String>) Map.of(
        	        "title", dto.getCompanyName(),
        	        "role", dto.getJobRole()
        	    ))
        	    .collect(Collectors.toList());


        List<CompAdvertisement> advertisement = advertismentRepo.findAll();
        

      List<Map<String,String>> avList= advertisement.stream().map(dto -> (Map<String,String>)
        		Map.of("title", dto.getCompanyName(),"advTitle",dto.getAdv_title())).limit(3)
        	    .collect(Collectors.toList());

       

       
        List<Map<String, Object>> courses = Arrays.asList(
            Map.of("name", "UI & UX Designer", "progress", 30, "color", "#f97316"),
            Map.of("name", "Frontend Development", "progress", 50, "color", "#2563eb"),
            Map.of("name", "Python", "progress", 70, "color", "#10b981")
        );

       
        model.addAttribute("date", LocalDate.now());
        model.addAttribute("user", user);
        model.addAttribute("assessments", assessments);
        model.addAttribute("internships", internships);
        model.addAttribute("jobs", jobs);
        model.addAttribute("availableJobs", availableJobs);
        model.addAttribute("availableInternships", avList);
        model.addAttribute("courses", courses);

	    return "dash";
	}

	/*student dashboard*/
	@RequestMapping(value = "/stud_home", method = RequestMethod.GET)
	public String studentHome(HttpSession session, Model model, @RequestParam(value="role", required = false) String role) {
	    User user = (User) session.getAttribute("user");
	    List<CompAdvertisement> adv=null;
	    if (user != null) {
	    	Student std = studentService.getSpecificStudent(user.getId());
	    	if(std.getCurr_city()!=null) {
		      adv = companyAdvertisementService.findByLocationOrderByLocation(std.getCurr_city());

	    	}else {
	    		adv =	componyService.getAllCompAdvertisements();
	    	}
	        // List<CompAdvertisement> allCities = componyService.getAllCities();
	        if (role != null && !role.isBlank()) {
	            user.setRole(role);
	            userService.saveUser(user);
	        }
	        
	        HashMap<String, String> compMap=new HashMap<>();
			List<String> compIdList1 = studentRequestService.getAppliedCompanies(user.getId());
			//List<String> compIdList3 = studentRequestService.getAppliedCompaniesFromExternalRequest(user.getId());

			compIdList1.forEach(s->compMap.put(s, "s"));

		;
		List<String> allCities = componyService.getAllCities();
			List<String> dept_names = departmentService.getDeptNameList();
			List<String> tech_names = technologyService.getTechList();
			model.addAttribute("dept_names", dept_names);
			model.addAttribute("tech_names", tech_names);
			model.addAttribute("cities", allCities);
			System.out.println("allCities"+allCities);

			
			List<String> jobType = componyService.getAllJobTypes();
			
			List<String> workingType = componyService.getAllWorkingTypes();
			System.out.println("dept_names"+dept_names);
			System.out.println("tech_names"+ tech_names);
			//model.addAttribute("com_list", getCityWiseCompnayList);
			session.setAttribute("appliedCompanies", compMap);
			model.addAttribute("jobTypes", jobType);
			model.addAttribute("workingTypes", workingType);
	        model.addAttribute("adv", adv);
	        model.addAttribute("user", user);
	    
	        return "student_home";
	    } else {
	        // Handle the case where the user is not in the session (e.g., redirect to login)
	        return "redirect:/login";
	    }
	}

	@RequestMapping("/appliedCompanies")
	public String internships(Model model) {
	    User user = (User) session.getAttribute("user");
		Map<List<Object>, String> map = new HashMap<>();

	    List<CollegeInternalReqDto> cirlist = new ArrayList<>();
	    
	    if (user != null) {
	    	List<Object[]> studentAppliedRequest = studentRequestService
					.getAppliedStudentOfCompany(user.getId());
	    	System.out.println("Student Rrequest "+studentAppliedRequest);
	        Integer collegeId = user.getCollege_id();
	        if (collegeId != null && collegeId != 0) {
	            cirlist.addAll(studentRequestService.getClgInternalReqOfStudentWithDept(
	                user.getId(), user.getId(), (long) user.getCollege_id(), new Date(), ProjectConstants.coll_dept_link_status_active));
	            
	            System.out.print("CollegeInternalRequest:- " + cirlist);
	            
	            if (cirlist != null && !cirlist.isEmpty()) {
	                for (CollegeInternalReqDto objData : cirlist) {
	                    List<Object> slist = new ArrayList<>();
	                    String approvalStatus = objData.getApprovalStatus();
	                  //  String againstExternalReq = objData.getAgainstExtReq();
	                    // Add individual college internal data into list (to show on JSP)
	                    System.out.println("Company Name=" + objData.getCompanyName());
	                    System.out.println("Technology=" + objData.getTechnology());
	                    System.out.println("Test Exp Date=" + objData.getTestDataExpirationDate());
	                    slist.add(objData.getCompanyName());
	                    slist.add(objData.getTechnology());
	                    slist.add(objData.getDuration());
	                    slist.add(objData.getRequestId());
	                    slist.add(objData.getExpirationDate());
	                    slist.add(objData.getRejectionMsg()); // Reject reason also used below as index 5, do not change
	                    slist.add(objData.getTestDataStatus()); // Student test status
	                    slist.add((objData.getTestDataId()));	                  
	                    switch (approvalStatus) {
	                        case ProjectConstants.coll_internal_req_approval_status_approved:
	                            ExternalRequest externalRequest = externalRequestService.getExternalRequestByERid((Long)objData.getAgainstExtReq());
	                            System.out.println("External Request "+externalRequest);
							if (null != externalRequest) {
								String companyapprovalStatus = externalRequest.getApproval_status();
								slist.add(companyapprovalStatus);
								if(!companyapprovalStatus.equals(ProjectConstants.external_req_approval_status_test_assigned))
									slist.remove(3); //remove test id if test status has been changed
								switch (companyapprovalStatus) {
								//new code for checking if test is assigned and what is status of test
								//------ start -----
								case ProjectConstants.external_req_approval_status_test_assigned:
									if(slist.get(6).equals(ProjectConstants.student_test_data_status_disqualified) ||
										slist.get(6).equals(ProjectConstants.student_test_data_status_failed) ||
										slist.get(6).equals(ProjectConstants.student_test_data_status_passed))
											map.put(slist, "Test submitted.Please wait for the Industry to evaluate your result.");
									else if(slist.get(6).equals(ProjectConstants.student_test_data_status_pending))
										map.put(slist, "Test Assigned.");
									break;
							  //------- end ------	
								case ProjectConstants.external_req_approval_status_pending:
									map.put(slist, "Pending Approval From Industry");
									break;
								case ProjectConstants.external_req_approval_status_approved:
									map.put(slist, "In Process within Industry");
									break;
								case ProjectConstants.external_req_approval_status_cancelled:
									map.put(slist, "Request Cancelled");
									break;
								case ProjectConstants.external_req_approval_status_dept_del:
									map.put(slist, "Request deleted");
									break;
								case ProjectConstants.external_req_approval_status_rejected:
									slist.set(5, externalRequest.getRejection_msg());
									map.put(slist, "Request Rejected by industry");
									break;
								case ProjectConstants.external_req_approval_status_assigned:
									CompanyInternalRequest compintreq = new CompanyInternalRequest();
									compintreq = companyInternalRequestService.getCompIntReqFromExtReqId((Long)objData.getAgainstExtReq());
									if(null != compintreq) {
										String compapprovalstatus = compintreq.getApproval_status(); 
										switch (compapprovalstatus) {
										case ProjectConstants.comp_internal_req_approval_status_internship_lead:
										case ProjectConstants.comp_internal_req_approval_status_manager:
											map.put(slist, "In Process within Industry");
											break;
										case ProjectConstants.comp_internal_req_approval_status_approved:
											map.put(slist, "Internship has been scheduled");
											break;
										case ProjectConstants.comp_internal_req_approval_status_cancelled:
											map.put(slist, "Cancelled from within the Industry");
											break;
										/*case ProjectConstants.comp_internal_req_approval_status_rejected:
											slist.set(5, compintreq.getRejection_msg());
											map.put(slist, "Rejected from within the Industry");
											break;*/
										}
									}
									break;
								}
							}
							break;
						case ProjectConstants.coll_internal_req_approval_status_HOD:
							map.put(slist, "Pending HOD Approval");
							break;
						case ProjectConstants.coll_internal_req_approval_status_III:
							map.put(slist, "Pending T&P/III Head Approval");
							break;
						case ProjectConstants.coll_internal_req_approval_status_cancelled:
							map.put(slist, "Request Cancelled");
							break;
						case ProjectConstants.coll_internal_req_approval_status_rejected:
							map.put(slist, "Request Rejected");
							break;
						case ProjectConstants.coll_internal_req_approval_status_dept_del:
							map.put(slist, "Department Deleted");
							break;
						}
					}
				}
			}

			model.addAttribute("studentsAppliedToCompanies", studentAppliedRequest);
			model.addAttribute("map", map);
			System.out.println("student internal "+map);
			return "appliedToCompanyFromStudent";
		} else {
			return "redirect:logout";
		}

	}
	
	
	@RequestMapping("/student_list")
	public String studentList(Model model) {
		User user = (User) session.getAttribute("user");
		Long deptId = user.getDepartment();
	
		System.out.println("department id"+deptId);
		List<Student> students = studentService.findAllByDept(deptId,Long.valueOf(user.getCollege_id()));
		List<Student> students2 = studentService.findAllByDept2(deptId,Long.valueOf(user.getCollege_id()));
List<Student> rejectedStudents = studentRepository.getRejectedStudents(deptId, Long.valueOf(user.getCollege_id()));
		
		model.addAttribute("rejectedStudents", rejectedStudents);
		
		model.addAttribute("studentRequestList", students);
		model.addAttribute("studentApprove_List", students2);
			return "student_list";
		
	}

	@SuppressWarnings("unused")
	@RequestMapping(value = "stud_a_r", method = RequestMethod.GET)
	public @ResponseBody String studentApprove_Reject(@RequestParam String student_id,
	                                                  @RequestParam String click_type) {
		
		User u = (User) session.getAttribute("user");
		   if ("approve".equalsIgnoreCase(click_type)) {
		        Arrays.stream(student_id.split(",")).forEach(id -> {
		            userRepository.findById(id).forEach(user -> {
		                user.setHodverified(1);
		                userService.save(user);
		                
		                //commonUtil.sendSms("Profile activated", user.getContact_no());
		                if(user.getNotificationToken()!=null && !user.getNotificationToken().isEmpty()) {
		                	  sendNotification(user.getNotificationToken(), 
				                		"Profile Activation", "Your profile has been activated.",user.getId(),u.getId());
		                }

		            });
		        });
		    }
		    return "success";
		}

		private void sendNotification(String token, String title, String body,Long receiverId,Long senderId) {
			if(!token.isEmpty()) {
		    NotificationRequest request = new NotificationRequest();
		    request.setToken(token);
		    request.setTitle(title);
		    request.setMsgBody(body);
		    request.setReceiverId(receiverId);
		    request.setSenderId(senderId);
		    request.setDateTime(LocalDateTime.now());
		    notificationService.addNotification(request);
		    try {
		      firebaseService.  sendMessageToToken(request);
		    } catch (InterruptedException | ExecutionException e) {
		        System.err.println("Error sending notification: " + e.getMessage());
		    }
			}
			}


	// reject student
		@SuppressWarnings("unused")
		@RequestMapping(value = "studentrejection", method = RequestMethod.GET)
		public @ResponseBody String student_Reject(@RequestParam String student_id, @RequestParam String reject_msg,
				@RequestParam String click_type) {
			
			User u = (User) session.getAttribute("user");
			   if ("reject".equalsIgnoreCase(click_type)) {
			        Arrays.stream(student_id.split(",")).forEach(id -> {
			            userRepository.findById(id).forEach(user -> {
			                user.setHodverified(2);
			                userService.save(user);
			               
			                //commonUtil.sendSms("Profile activated", user.getContact_no());
			                if(user.getNotificationToken()!=null && !user.getNotificationToken().isEmpty()) {
			                	  sendNotification(user.getNotificationToken(),
					                		"Profile", "Your profile is not approved.",user.getId(),u.getId());
			                }
			            });
			        });
			    }
			    return "success";
			}

	// getAllStudent
	@RequestMapping(value = "/getAllstudent", method = RequestMethod.GET)
	public @ResponseBody List<?> getAllStudent() {
		
		return null;
	}

	@RequestMapping(value = "/editStudentProfile", method = RequestMethod.GET)
	public String editProfile(Model model, HttpSession session) throws Exception {
	    User user = (User) session.getAttribute("user");
	    if (user == null || user.getId() == null) {
	        return "redirect:/login";
	    }
	    Long userId = user.getId();
	    Student studentById = studentService.getStudentById(userId);
	    if (studentById == null) {
	        return "redirect:/login"; // or return "errorPage";
	    }
	    
	    
	    List<Map<String, Object>> studentPast = studentService.findAllByStudentId(userId);
	    model.addAttribute("studentPast", studentPast);
	    model.addAttribute("student", studentById);
	    byte[] photoData = studentById.getPhoto();
	    String photoBase64 = "";
	    if (photoData != null && photoData.length > 0) {
	        photoBase64 = Base64.getEncoder().encodeToString(photoData);
	    }
	    model.addAttribute("photoBase64", photoBase64);
	
	    if (user.getDepartment() != null) {
	        Department userDepartment = departmentService.getDepartmentById(user.getDepartment());
	        if (userDepartment != null) {
	            model.addAttribute("department", userDepartment.getDept_name());
	        }
	    } else {
	        model.addAttribute("department", "No Department Assigned");
	    }
	    List<College> allColleges = collegeService.getAllColleges();
	    
	    List<Universities> allUniversities = universitiesService.getAllUniversities();
	    
	    model.addAttribute("allUniversities",allUniversities);

	    List<Department> allDepartment = departmentService.getAllDepartment();
	    List<Technologies> allTechnology = technologyService.getAllTechnology();
	    model.addAttribute("departments", allDepartment);
	    model.addAttribute("allTechnology", allTechnology);

	    model.addAttribute("allColleges", allColleges);
	    return "changeStudentProfile";
	}
	// getStudentPastProfessions
	@RequestMapping(value = "/getStudentPastProfessions", method = RequestMethod.GET)
	public @ResponseBody List<?> getStudentPastProfessions() {

		return null;
	}
	@RequestMapping(value = "/editStudentProfile", method = RequestMethod.POST)
	public String editStudentProfile(@ModelAttribute Student student,
	                                 @RequestParam(value = "profile_photo", required = false) MultipartFile profile_photo,
	                                 HttpSession session) {
	    User user = (User) session.getAttribute("user");

	    if (user == null) {
	        return "redirect:/login";
	    }

	    Long userId = user.getId();

	    Student existingStudent = studentService.getStudentById(userId);
	    if (existingStudent == null) {
	        return "redirect:/editStudentProfile";
	    }

	    // Handle profile photo upload
	    if (profile_photo != null && !profile_photo.isEmpty()) {
	        try {
	            student.setPhoto(profile_photo.getBytes());
	        } catch (IOException e) {
	            e.printStackTrace();
	        }
	    } else {
	        student.setPhoto(existingStudent.getPhoto());
	    }

	    // Update only allowed fields
	    existingStudent.setStudent_name(student.getStudent_name());
	    existingStudent.setContact(student.getContact());
	    existingStudent.setPhoto(student.getPhoto());
	    existingStudent.setEmail_id(student.getEmail_id());
	    existingStudent.setAchievements(student.getAchievements());
	    existingStudent.setHobbies(student.getHobbies());
	    existingStudent.setSkills(student.getSkills());
	    existingStudent.setInterest(student.getInterest());
	    existingStudent.setCurr_city(student.getCurr_city());
	    existingStudent.setHome_city(student.getHome_city());
	    existingStudent.setCurr_enroll_no(student.getCurr_enroll_no());

	    // Do NOT touch resume here
	    studentService.saveStudent(existingStudent);

	    // Update user info
	    user.setUsername(student.getStudent_name());
	    user.setContact_no(student.getContact());
	    userService.saveUser(user);

	    return "redirect:/editStudentProfile";
	}



	
	@RequestMapping(value = "/getStudentsData", method = RequestMethod.GET)
	@ResponseBody
	public Student getStudentDetails(@RequestParam("student_id") Long student_id, Model model) throws Exception {
		Student studentById = studentService.getStudentById(student_id);

	    
	    model.addAttribute("studentDetails", studentById);
	    
	    return studentById;
	}

//	@GetMapping("/getStudentDetails")
//	@ResponseBody
//	public Student getStudentDetails2(@RequestParam("student_id") Long student_id) {
//
//	    try {
//	        Student studentById = studentService.getStudentById(student_id);
//	
//	        return studentById;
//	    } catch (Exception e) {
//	        e.printStackTrace();
//	        return null;
//	    }
//	}

	@GetMapping("/getStudentDetails")
	@ResponseBody
	public Map<String, Object> getStudentDetails(@RequestParam("student_id") Long student_id) {
	    Map<String, Object> response = new HashMap<>();
	    try {
	        Student student = studentService.getStudentById(student_id);
	        LiveProject lastProject = projectService.getLastProjectByUserId(student.getStudent_id());

	        response.put("student", student);
	        response.put("lastProject", lastProject);
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    return response;
	}

	@RequestMapping(value = "/uploadregistrationXL", method = RequestMethod.POST)
	public String excelReg(HttpServletRequest request, HttpSession session,
			@RequestParam("fileUpload") MultipartFile[] fileUpload) {
		User user = (User) session.getAttribute("user");
		College college = null;

		System.out.println("Received file upload request from user: " + user.getEmail());

		if (user.getRole().equals(ProjectConstants.hod) || user.getRole().equals(ProjectConstants.iii_role3deptIn)) {
			User u = userService.findByEmailAndRoleAndDepartment(user.getRole(), user.getEmailIdCommon(),
					user.getDepartment());
			college = collegeService.getCollegeByEmail(u.getEmailIdCommon());
			System.out.println("College identified: " + college.getCollege_id());
		}

		final College finalCollege = college;

		new Thread(() -> {
			if (fileUpload != null && fileUpload.length > 0) {
				for (MultipartFile aFile : fileUpload) {
					if (!aFile.isEmpty()) {
						try (InputStream inputStream = aFile.getInputStream()) {
							System.out.println("Processing file: " + aFile.getOriginalFilename());
							Workbook workbook = WorkbookFactory.create(inputStream);
							Sheet sheet = workbook.getSheetAt(0);
							Iterator<Row> rowIterator = sheet.iterator();
							rowIterator.next(); // Skip header row

							StringBuilder existEmail = new StringBuilder();
							int totalRows = 0, registeredStudents = 0;
							CollDeptLink cdLink = collDeptService.getDepartmentLink(user.getId());

							while (rowIterator.hasNext()) {
								Row row = rowIterator.next();
								if (row != null) {
									String email = row.getCell(0).getStringCellValue();
									System.out.println("Processing row with email: " + email);
									if (email != null && !email.trim().isEmpty() && email.length() > 4) {
										totalRows++;
										if (userService.emailExist(email)) {
											existEmail.append(email).append(",");
											System.out.println("Email already exists: " + email);
										} else {
											String name = row.getCell(1).getStringCellValue();
											Long contact = (long) row.getCell(2).getNumericCellValue();
											String enrollNo = row.getCell(3).getStringCellValue();
											Date dob = row.getCell(4).getDateCellValue();
											int currentYear = (int) row.getCell(5).getNumericCellValue();
											double percentage = row.getCell(6).getNumericCellValue();
											String university = row.getCell(7).getStringCellValue();

											System.out.println("Student details - Name: " + name + ", Contact: "
													+ contact + ", Enroll No: " + enrollNo + ", DOB: " + dob
													+ ", Year: " + currentYear + ", Percentage: " + percentage
													+ ", University: " + university);

											// Generate a random password
											Random random = new Random();
											String password = email.substring(0, 4) + random.nextInt(10000);
											password = password.replaceAll("\\s", "");
											System.out.println("Generated password for " + email + ": " + password);

											// Create User
											User newUser = new User();
											newUser.setEmail(email);
											newUser.setUsername(name);
											newUser.setContact_no(contact);
											newUser.setPassword(password);
											newUser.setTemp_pass(ProjectConstants.reg_user_temp_pass_yes);
											int collegeIdInt = finalCollege.getCollege_id() != null
													? finalCollege.getCollege_id().intValue()
													: 0;
											newUser.setCollege_id(collegeIdInt);
											newUser.setVerified(1);
											newUser.setHodverified(1);
											newUser.setDepartment(cdLink.getDeptId());
											newUser.setRole("0"); // internal student
											userService.saveUser(newUser);
											System.out.println("Saved user: " + email);

											// Create Student
											Student newStudent = new Student();
											newStudent.setEmail_id(email);
											newStudent.setStudent_name(name);
											newStudent.setContact(contact);
											newStudent.setCurr_enroll_no(enrollNo);
											newStudent.setCurr_year(String.valueOf(currentYear));
											newStudent.setStudent_id(newUser.getId());
											newStudent.setCreation_date(new Date());
											newStudent.setDept(String.valueOf(cdLink.getDeptId()));
											newStudent.setCollege_id(finalCollege.getCollege_id());

											studentService.saveStudent(newStudent);
											System.out.println("Saved student: " + email);

											// Create StudentPast
											StudentPast studentPast = new StudentPast();
											studentPast.setDescription(String.valueOf(percentage));
											studentPast.setBoard(university);
											studentPast.setStudent_id(newStudent.getStudent_id());
											College coll = collegeService.getCollegeById(finalCollege.getCollege_id());
											studentPast.setOrganization(coll.getCollege_name());
											studentPast.setCreation_date(new Date());
											studentPast.setDepartment(cdLink.getDeptId());
											// studentPast.setDepartment(collegeService.getDepartmentIdByCollegeId(finalCollege.getCollege_id()));
											// // Assuming you have this method
											studentService.saveStudent(studentPast);
											System.out.println("Saved student past record for: " + email);

											registeredStudents++;

											// Send registration mail to student with password
											String body = "<h1 style=\"font-size:55px;margin:20px;text-align:center\">Welcome to SkillPilots /></h1>"
													+ "<p style=\"text-align:center\"> Here is your temporary password - <strong>"
													+ password + "</strong><br>"
													+ "You'll be asked to change your password for security reasons.<br></p>"
													+ ProjectConstants.mail_footer;
											beanService.sendMimeMail("SkillPilots", email, "Registration Notification",
													body);
											System.out.println("Sent registration email to: " + email);
										}
									} else {
										break;
									}
								}
							}
							workbook.close();
							System.out.println("Processed " + totalRows + " rows, " + registeredStudents
									+ " students registered.");

							String summary = "<p style=\"text-align:center\"> Here is summary of student registrations through excel - <br>"
									+ "You requested for " + totalRows + " students registration through excel.<br>"
									+ registeredStudents + " students were successfully registered and "
									+ "their temporary passwords have been sent to their respective email-ids.<br>";
			 				if (!existEmail.toString().isEmpty()) {
								existEmail.deleteCharAt(existEmail.length() - 1);
								summary += "Please take a note that these email id's are already registered - "
										+ existEmail + ".<br>";
							}
							summary += "</p>" + ProjectConstants.mail_footer;
							// Send mail to hod for summary
							beanService.sendMimeMail("SkillPilots", user.getEmail(),
									"Student Registrations through Excel - Summary", summary);
							System.out.println("Sent summary email to HOD: " + user.getEmail());

						} catch (Exception e) {
							System.out.println("Error processing file: " + e.getMessage());
							e.printStackTrace();
						}
					}
				}
			} else {
				System.out.println("No files to upload.");
			}
		}).start();

		return "redirect:student_list";
	}

	
	
	// stuent resume buillder
	
	@GetMapping("/cv")
	public String resumebuider(Model model, HttpSession session) {
		User user = (User) session.getAttribute("user");

		Long userId = (user != null) ? user.getId() : null;
		List<Internships> internships3 = internshipService.getPastOrPendingOrCancelledInternshipsOfStudent(userId,
				ProjectConstants.internships_status_completed);
		model.addAttribute("internship3", internships3);

		if (user != null && user.getId() != null) {
			List<StudentPast> studentPast = studentPastRepository.findAllByStudentId(user.getId());

			model.addAttribute("studentPast", studentPast);

		} else {
			System.out.println("not work");
		}

		if (user == null) {

			return "redirect:/login";
		}
		Long user_id = user.getId();

		Student studentById = studentService.getStudentById(user_id);

		model.addAttribute("student", studentById);

		byte[] photoData = studentById.getPhoto();
		String photoBase64 = "";
		if (photoData != null && photoData.length > 0) {
			photoBase64 = Base64.getEncoder().encodeToString(photoData);
		}

		model.addAttribute("photoBase64", photoBase64);
		return "cv";
	}


	@PostMapping("/addStickyNotes")
	public StickyNotes addStickyNotes(@RequestParam String notes, HttpSession session,Long studentId)
	{
		User user = (User) session.getAttribute("user");
		StickyNotes saveStickyNotes=null;
		if(user!=null)
		{
			
	      	 saveStickyNotes = stickyNotesService.saveNote(notes,studentId);
	      	 System.out.println("Notessssssssssssss:"+saveStickyNotes);
	      	return saveStickyNotes;
		}
		
		return saveStickyNotes;
	}
	
	
	@GetMapping("/getNotes")
	@ResponseBody
	public List<StickyNotes> viewNotesByStudentId(@RequestParam("studentId") Long studentId)
	{
	    return stickyNotesService.getAllNotesByStudentId(studentId);
	}
	
	  @GetMapping("/getAllStickyNotes")
	  @ResponseBody
	    public List<StickyNotes> getAllStickyNotes() {
	        return stickyNotesService.getAllNotes();
	    }
	
	
	@PutMapping("/updateStickyNote")
	@ResponseBody
	public StickyNotes updateStickyNotes(@RequestParam("noteId") Long noteId, @RequestParam String notes)
	{
	    return stickyNotesService.updateNotes(noteId, notes);
	}
    @DeleteMapping("/deleteStickyNote")
    @ResponseBody
    public void deleteNotesByNotesId(@RequestParam("noteId") Long noteId)
    {
    	stickyNotesService.deleteNotesById(noteId);
    }






	
		
}
