package com.skillpilots.controller.company;


import java.util.Arrays;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.Optional;

import org.apache.el.lang.ELArithmetic.BigIntegerDelegate;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.skillpilots.Dto.QuestionDTO;
import com.skillpilots.model.Company;
import com.skillpilots.model.CompanyTest;
import com.skillpilots.model.ExternalRequest;
import com.skillpilots.model.SectionQuestion;
import com.skillpilots.model.StudentRequest;
import com.skillpilots.model.StudentTestData;
import com.skillpilots.model.TestSection;
import com.skillpilots.model.User;
import com.skillpilots.service.CompTestService;
import com.skillpilots.service.ComponyService;
import com.skillpilots.service.ExternalRequestService;
import com.skillpilots.service.SectionQuestionService;
import com.skillpilots.service.StudentRequestService;
import com.skillpilots.service.StudentTestDataService;
import com.skillpilots.service.TestSectionService;
import com.skillpilots.service.UserService;
import com.skillpilots.utility.ProjectConstants;

import jakarta.servlet.http.HttpSession;



@Controller
public class OnlineTestController {
@Autowired
private CompTestService compTestService;
@Autowired
private HttpSession session;
@Autowired
private ComponyService componyService;
@Autowired
private TestSectionService sectionService;
@Autowired
private SectionQuestionService questionService;
@Autowired
private UserService userService;

@Autowired
private StudentRequestService studentRequestService;

@Autowired
private StudentTestDataService studentTestDataService;
@Autowired
private ExternalRequestService externalRequestService;


@RequestMapping(value = "/company_online_test", method = RequestMethod.GET)
public String online_test(Model model) {
    User user = (User) session.getAttribute("user");
    if (user == null) {

        return "redirect:/login"; // or appropriate error handling
    }

    Long instid = user.getCommonId() != null ? user.getCommonId() : user.getInstituteId();

    
    if (user.getRole().equals("1")) { // Assuming role is a String
        String email = user.getEmail();
        Company company = componyService.getCompanyById(email);
        List<CompanyTest> comptest_list = compTestService.getCompanyTestByCompanyId(company.getCompany_id());
        model.addAttribute("comTest_list", comptest_list);
    System.out.println("qqqqqqqqqqqqqqqqqqqqq"+comptest_list);
    } else if (user.getRole().equals("2")) {
   
    	User u = userService.findByEmailAndRole("2", user.getEmailIdCommon());
    	Company company = componyService.getCompanyById(u.getEmailIdCommon());
      
       
        List<CompanyTest> comptest_list2 = compTestService.getCompanyTestByCompanyId2(company.getCompany_id());
        model.addAttribute("comTest_list", comptest_list2);
   
       
    } else {
        System.out.println("user has a different role");
        // Handle other roles or error condition
    }
    return "company_online_test";
}


	 @PostMapping("/saveCompanyTestData")
	    public String saveCompanyTestData(@ModelAttribute  CompanyTest companyTest, @RequestParam(value = "test_type_time") String test_type_time,
				@RequestParam(value = "cut_off") String test_type_cutoff,
				@RequestParam(value = "test_type_marks") String test_type_marks, Model model) {
	        // Logic to save the test data
		 User user = (User) session.getAttribute("user");
	
		 if(user==null) {
				return "redirect:company_online_test";
			}
		 Long instid = user.getCommonId() != null ? user.getCommonId() : user.getInstituteId();
		 
		 if (user.getRole().equals("1")) {
			String email = user.getEmail();
		
			Company company = componyService.getCompanyById(email);
			companyTest.setCompany_id(company.getCompany_id());
			companyTest.setCreation_date(new Date());
			companyTest.setInstitute_id(instid);
			companyTest.setStatus(ProjectConstants.company_test_status_inactive);
			ObjectMapper objectMapper = new ObjectMapper();

		    try {
		        String json = objectMapper.writeValueAsString(Map.of(
		                ProjectConstants.test_type_time_key, test_type_time,
		                ProjectConstants.test_type_cutoff_key, test_type_cutoff,
		                ProjectConstants.test_type_marks_per_ques_key, test_type_marks
		                
		        ));
		        System.out.println(json);
		        companyTest.setTest_type(json);
		    } catch (JsonProcessingException e) {
		        // Handle the exception
		        e.printStackTrace(); 
		    }
		 } else if (user.getRole().equals("2")) {
			 User u = userService.findByEmailAndRole("2", user.getEmailIdCommon());
		    	Company company = componyService.getCompanyById(u.getEmailIdCommon());
		      
			    User user2 = userService.findByInstituteId(instid);
		        Long companyId  =  user2.getId();
		    	companyTest.setCompany_id(company.getCompany_id());
				companyTest.setCreation_date(new Date());
				companyTest.setInstitute_id(instid);
				companyTest.setStatus(ProjectConstants.company_test_status_inactive);

				ObjectMapper objectMapper = new ObjectMapper();

			    try {
			        String json = objectMapper.writeValueAsString(Map.of(
			                ProjectConstants.test_type_time_key, test_type_time,
			                ProjectConstants.test_type_cutoff_key, test_type_cutoff,
			                ProjectConstants.test_type_marks_per_ques_key, test_type_marks
			                
			        ));
			        System.out.println(json);
			        companyTest.setTest_type(json);
			    } catch (JsonProcessingException e) {
			        // Handle the exception
			        e.printStackTrace();
			    }
		 }
		 compTestService.save(companyTest);
		
	        return "redirect:/company_online_test"; // Redirect to a success page
	    }


@RequestMapping(value = "/get_questions", method = RequestMethod.GET)
public ResponseEntity<List<SectionQuestion>> getCompanyTestData(@RequestParam("section_id") Long sectionId) {
    List<SectionQuestion> sectionQuestion = questionService.findAllBySectionId(sectionId);
    return new ResponseEntity<>(sectionQuestion, HttpStatus.OK);
}

	@PostMapping("/questions")
	@ResponseBody
	public ResponseEntity<?> addQuestion(@RequestBody SectionQuestion question) {
	System.out.println("djjjjjjjjjjjjjjjjjjjjjjjj"+question.getMark_per_ques());
	    questionService.saveQuestion(question);
	    return ResponseEntity.ok(Map.of("success", true, "message", "Question saved successfully"));
	}

	
	@PostMapping("/updateQuestions")
	public ResponseEntity<?> saveQuestions(@RequestBody List<QuestionDTO> questionDTOs) {
		
	    for (QuestionDTO dto : questionDTOs) {
	    	
	        if (dto.getQuestionId() != null) {
	            // Update existing question
	            questionService.updateQuestion(dto);
	          
	        } else {
	        	 return ResponseEntity.ok("Questions processed faild");
	        }
	    }
	    return ResponseEntity.ok("Questions processed successfully");
	}
	
	@PostMapping("/insertsectiondata")
    @ResponseBody
    public String insertSectionData(@RequestBody List<TestSection> sections) {
    
	 sectionService.saveAll(sections);
       
        // Return a response indicating success
        return "Data saved successfully";
    }

	@RequestMapping(value = "/update_section_data", method = RequestMethod.POST)
	public @ResponseBody String saveSectionData() {

		
		return "redirect:company_online_test";
	}

	@RequestMapping(value = "/get_sec_data", method = RequestMethod.GET)
	public @ResponseBody List<TestSection> get_sec_data(@RequestParam("testId") Long testId , Model model ) {
		List<TestSection> testSections = sectionService.findAllByTest_Id(testId);
		 model.addAttribute("testSections", testSections);
		System.out.println("data"+testSections);
		return testSections;
	}

	@RequestMapping(value = "/get_Company_Test_Data", method = RequestMethod.GET)
	public @ResponseBody CompanyTest get_Company_Test_Data(@RequestParam Long id, Model model) {
		System.out.println("woekinh"+id);
		CompanyTest company_test = compTestService.getCompanyTestData_by_id(id);
		return company_test;
	}

	 @DeleteMapping("/delquestions/{questionId}")
	    public String deleteQuestion(@PathVariable Long questionId) {
		 
		 questionService.deleteById(questionId);
	    
	        return "Question with ID " + questionId + " deleted successfully.";
	    }
	 @RequestMapping(value = "/update_status_of_company_test", method = RequestMethod.POST)
		public @ResponseBody String update_status_of_company_test(@RequestParam Long test_id,
				@RequestParam boolean status) {
			if(status) {
				CompanyTest companyTest = compTestService.getCompanyTestData_by_id(test_id);

				
					compTestService.updateCompanyTestStatus(test_id, status);
					return "Test Successfully activated! The test has limited number of questions. Randomness will not be possible.";
				}

				//compTestService.updateCompanyTestData_status(test_id, status);
			else {
				compTestService.updateCompanyTestStatus(test_id, status);

				return "Test Successfully de-activated!";
			}
	 }
	@RequestMapping(value = "/save_questions_data", method = RequestMethod.POST)
	public @ResponseBody String save_questions_data(@RequestParam String sec_id, @RequestParam String question,
			@RequestParam String option_a, @RequestParam String option_b, @RequestParam String option_c,
			@RequestParam String option_d, @RequestParam String ans, @RequestParam String ques_time,
			@RequestParam String ques_mark) {

		
		return "Data inserted Successfully";
	}

//	@RequestMapping(value = "/getQuestions_per_section", method = RequestMethod.GET)
//	public @ResponseBody List<SectionQuestion> getQuestions_per_section(@RequestParam String sec_id) {
//		List<SectionQuestion> list = onlineTestService.getQuestions_data(sec_id);
//		return list;
//	}

	@RequestMapping(value = "/assignTest",method=RequestMethod.POST)
	public @ResponseBody String assignTestToStud(@RequestParam("request_id") Long request_id,
			@RequestParam("test_id") Long test_id,@RequestParam(value="type", required = false) String type) {
		System.out.println(request_id);
		System.out.println(test_id);
		System.out.println("Type"+type);
		User user = (User) session.getAttribute("user");
		if (user == null) {
			return "redirect:external_internship_request_company";
		}
 
		System.out.println(user);
		List<StudentTestData> studTestDataByReqId = studentTestDataService.getStudPenStatusTestDataByReqId(request_id);
		
//		if(studTestDataByReqId.size() > 0){
//			System.out.println("inside Update");
//			//studentTestDataService.updateStudentTestDataFromReqId(request_id, test_id);
//		}
//		else {
		StudentRequest sr = new StudentRequest();
		ExternalRequest er = new ExternalRequest();
	
	//	User hr=userService.getHRorIIIHead(company_id);
		//String company_name=companyService.getCompanyName(company_id);
//		String next_num = String.format("%011d", studentTestDataService.getNextstudTestData());
//		String stud_test_data_id = ProjectConstants.student_test_data_id_initial + next_num;
		StudentTestData studentTestData = new StudentTestData();
		//studentTestData.setTest_data_id(stud_test_data_id);
		studentTestData.setAgainst_ext_req(request_id);
		studentTestData.setTest_id(test_id);
		studentTestData.setCreation_date(new Date());
		studentTestData.setStatus("pending");
		studentTestData.setExpiration_date(userService.getDateAfterDays(new Date(), ProjectConstants.student_test_validity_days));
		studentTestData.setCompany_id(user.getInstituteId());
		System.out.println("request_id >>>>"+request_id);
		if(type!=null) {
			System.out.println("in External Request");
			er = externalRequestService.getExternalRequestByERid(request_id);
			er.setApproval_status(ProjectConstants.external_req_approval_status_test_assigned);
			String student_id = er.getStudent_ids();
			//param2[1] = "r institute"; // message requirement.

			Arrays.stream(student_id.split(","))
			      .map(Long::parseLong)
			      .forEach(studentId -> {
			         
			          studentTestData.setAgainst_ext_req(request_id);
			          studentTestData.setTest_id(test_id);
			          studentTestData.setCreation_date(new Date());
			          studentTestData.setStudent_id(studentId);
			          studentTestData.setStatus(ProjectConstants.student_test_data_status_pending);
			          studentTestData.setCompany_id(user.getInstituteId());
			          studentTestData.setExpiration_date(
			                  userService.getDateAfterDays(new Date(), ProjectConstants.student_test_validity_days));
			          studentTestDataService.saveStudTestData(studentTestData);
			      });

					
				}
		else {
		System.out.println("in student request");
		sr = studentRequestService.getStudentRequest(request_id);
		studentTestData.setStudent_id(sr.getStudent_id());
		studentTestDataService.saveStudTestData(studentTestData);
		sr.setApproval_status(ProjectConstants.student_req_approval_status_test_assigned);
		sr.setUpdation_date(new Date());
		sr.setExpiration_date(userService.getDateAfterDays(new Date(), ProjectConstants.student_test_validity_days+5));
		studentRequestService.saveRequest(sr);
		
		studentTestDataService.saveStudTestData(studentTestData);
		User student = userService.getUserById(sr.getStudent_id());
		
		String mail = "<h1 style=\"font-size:55px;margin:20px;text-align:center\">" +
	              "<span style=\"color:#1974c3;\">Skill<span style=\"color:#01af36;\">Pilots</span></h1>" +
	              "<p style=\"text-align:center\">Dear <strong style=\"color:#414ea4\">" + student.getName() + "</strong>,<br>" +
	              "A test has been assigned to you. Please log in and complete it as soon as possible.</p>" +
	              "<p style=\"text-align:center\">If you have any questions, feel free to reach out to us at <strong style=\"color:#414ea4\">" +
	              "<a href=\"http://www.skillpilots.com\" style=\"color:#414ea4; text-decoration:none;\">SkillPilots</a></strong>.<br>" +
	              "Best of luck!</p>" +
	              ProjectConstants.mail_footer;

		userService.sendVerificationEmail(student.getEmail(), "Test Assigned ! ", mail);
		

		}
		return "Success";}
	
	
	

	@RequestMapping(value = "/update_question_data", method = RequestMethod.POST)
	public @ResponseBody String update_question_data(@RequestParam String ques_update_str) {
		
		return "success";
	}

	
	// download Excel File For Multiple Test Questions
	@SuppressWarnings({ "resource"})
	public @ResponseBody String getSection() {

		
		return "company_online_test";
	}

	// Uploading Excel File for Multiple Questions in TestSection

	@RequestMapping(value = "/onlineTestQuestionsXL", method = RequestMethod.POST)
	public String queUpload() {

		
		return "redirect:company_online_test";
	}
	
	@RequestMapping(value = "/reassignedTest",method=RequestMethod.POST)
	public @ResponseBody String reassignedTestToStud(@RequestParam("request_id") String request_id,@RequestParam("test_id") String test_id) {
		
		return "inside success";
	}
	
}
