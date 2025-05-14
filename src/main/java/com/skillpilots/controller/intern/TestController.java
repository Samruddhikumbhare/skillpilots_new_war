package com.skillpilots.controller.intern;

import java.util.Date;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.skillpilots.model.CompanyTest;
import com.skillpilots.model.ExternalRequest;
import com.skillpilots.model.SectionQuestion;
import com.skillpilots.model.StudentRequest;
import com.skillpilots.model.StudentTestData;
import com.skillpilots.model.TestSection;
import com.skillpilots.model.User;
import com.skillpilots.service.CompTestService;
import com.skillpilots.service.ExternalRequestService;
import com.skillpilots.service.StudentRequestService;
import com.skillpilots.service.StudentTestDataService;
import com.skillpilots.service.UserService;
import com.skillpilots.utility.ProjectConstants;

import jakarta.servlet.http.HttpSession;


@Controller
public class TestController {
	
	@Autowired
	private HttpSession session;
	
	@Autowired
	private StudentTestDataService studentTestDataService;
	
	@Autowired
	private CompTestService compTestService;
	
	@Autowired
	private StudentRequestService studentRequestService;
	
	@Autowired
	private UserService userService;
	@Autowired
	private HttpSession session2;
	@Autowired
	private ExternalRequestService externalRequestService;
	
	@RequestMapping("/stud_testHistory")
	public String getHistory(Model model) {
		User user = (User) session.getAttribute("user");
		List<Object[]> testHistory = studentTestDataService.getTestHistory(user.getId());
	
		model.addAttribute("testHistory", testHistory);
		
		return "studentTestHistory";
	}

	@SuppressWarnings("unchecked")
	@RequestMapping("/startTest")
	public String startMyTest(@RequestParam("test_data_id") Long test_data_id, Model model,String current_page) {
		//set session timeout
		session.setMaxInactiveInterval(30*60);
		// selecting test
		StudentTestData sd = studentTestDataService.getStudentTestData(test_data_id);
		CompanyTest companyTest = compTestService.getCompanyTestData_by_id(sd.getTest_id());
		System.out.println("hdhdhdhdhdhd"+companyTest);
		List<TestSection> testSections = compTestService.getTestSections(companyTest.getTest_id());
		System.out.println("Test section "+testSections);
		// selecting random questions per section
		Map<String, List<SectionQuestion>> questionSet = new LinkedHashMap<>();
		Map<String, SectionQuestion> qustionMap = new HashMap<>();
		for (TestSection ts : testSections) {
			System.out.println("in 1st loop");
			questionSet.put(ts.getSection_name(),
					compTestService.getRandomQuestions(ts.getSection_id(), ts.getTotal_ques()));
		
		}

		// creating map of all questions
		for (String key : questionSet.keySet()) {
		    for (SectionQuestion q : questionSet.get(key)) {
		        System.out.println("in 2nd loop");
		        // Generate a unique key for each question
		        String uniqueKey = q.getQuestionId() + "_" + key; // Append section name to ensure uniqueness	
		        qustionMap.put(uniqueKey, q);
		        System.out.println(qustionMap);
		    }
		}
		// Test type
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> testType = new HashMap<>();
		try {
			System.out.println("in 1st try");
			testType = (HashMap<String, Object>) mapper.readValue(companyTest.getTest_type(), Map.class);
		} catch (Exception e) {
		
			System.out.println("aaaaaaaaaa"+e);
			e.printStackTrace();
		}

		model.addAttribute("companyTest", companyTest);
		model.addAttribute("testType", testType);
		model.addAttribute("testSections", testSections);
		model.addAttribute("questionSet", questionSet);
		model.addAttribute("currentPage", current_page); //show the current page value
		Map<String, TestSection> sectionMap = new HashMap<>();
		for (TestSection ts : testSections) {
			System.out.println("in 3rd loop");
			sectionMap.put(ts.getSection_name(), ts);
		}

		String testSecJson = "";
		String qSetJson = "";
		String qMap = "";
		try {
			System.out.println("in 2nd try");
			testSecJson = mapper.writeValueAsString(sectionMap);
			qSetJson = mapper.writeValueAsString(questionSet);
			qMap = mapper.writeValueAsString(qustionMap);
		} catch (Exception e) {
			System.out.println("gggggg"+e);
			e.printStackTrace();
		}
		System.out.println(testSecJson);
		model.addAttribute("testSecJson", testSecJson);
		model.addAttribute("qSetJson", qSetJson);
		model.addAttribute("qMapJson", qMap);
		model.addAttribute("test_data_id", test_data_id);

		model.addAttribute("test_id", companyTest.getTest_id());

		//session.setMaxInactiveInterval(20);
		return "testPaper";
	}
	@GetMapping("/updateTestData")
	public @ResponseBody String updateTestData(@RequestParam("test_data_id") Long test_data_id,
			@RequestParam(value = "status") String status) {

		StudentTestData sd = studentTestDataService.getStudentTestData(test_data_id);
		sd.setStatus(status);
		studentTestDataService.saveStudTestData(sd);
		return "success";
	}

	@SuppressWarnings("unchecked")
	@GetMapping("/submitTest")
	public @ResponseBody Map<String, Object> submitTest(@RequestParam("test_data_id") Long test_data_id,
			@RequestParam(value = "ans", required = false) String ans,
			@RequestParam(value = "testStatus", required = false) char testStatus) {
		
		User user = (User) session2.getAttribute("user");
		StudentTestData studentTestData = studentTestDataService.getStudentTestData(test_data_id);
		StudentRequest sr = new StudentRequest();

		
		System.out.println("student data "+ studentTestData);
		
		studentTestData.setUpdation_date(new Date());
		Long againse_request = studentTestData.getAgainst_ext_req();
		if (testStatus == ProjectConstants.student_test_data_status_disqualified_char) {
			studentTestData.setStatus(ProjectConstants.student_test_data_status_disqualified);
			studentTestDataService.saveStudTestData(studentTestData);
			if (user.getRole().equals("0")) {
				sr = studentRequestService.getStudentRequest(againse_request);
				
				System.out.println("sjususuudududdddddddddddd");
				sr.setApproval_status(ProjectConstants.student_req_approval_status_result_declared);
				sr.setUpdation_date(new Date());
				studentRequestService.saveRequest(sr);
			}
			return null;
		}else {
		
		System.out.println("amswerrrrrrr"+ans);
			studentTestData.setAnswer_set(ans);
			ObjectMapper mapper = new ObjectMapper();
			Map<String, HashMap<String, String>> answers = new HashMap<>();
			try {
				answers = (HashMap<String, HashMap<String, String>>) mapper.readValue(ans, Map.class);
				
				System.out.println("Ansers"+answers);
			} catch (Exception e) {
				e.printStackTrace();
			}
			CompanyTest test = compTestService.getCompanyTestData_by_id(studentTestData.getTest_id());
			studentTestData.setOut_off(test.getTotal_marks());
			System.out.println("Ansers"+test.getTotal_marks());

			// type of test
			Map<String, String> testType = new HashMap<>();
			try {
				testType = (HashMap<String, String>) mapper.readValue(test.getTest_type(), Map.class);
			} catch (Exception e) {
				e.printStackTrace();
			}

			Map<String, Object> result = userService.getTestResult(answers, testType, test);
			System.out.println(result+"resulttttttttttttt");

			studentTestData.setMarks_scored(Integer.parseInt(result.get("totalMarks").toString()));
			
			System.out.println(result.get("totalMarks").toString()+"11111111111111111111111111111111111111111111");

			if (result.get("testResult").toString().equals(ProjectConstants.company_test_result_passed)) {
				studentTestData.setStatus(ProjectConstants.student_test_data_status_passed);
			} else {
				studentTestData.setStatus(ProjectConstants.student_test_data_status_failed);
			}
			studentTestDataService.saveStudTestData(studentTestData);
			
			    try {
			        sr = studentRequestService.getStudentRequest(againse_request);
			        if (sr != null) {
			            sr.setApproval_status(ProjectConstants.student_req_approval_status_result_declared);
			            sr.setUpdation_date(new Date());
			            studentRequestService.saveRequest(sr);
			        }
			    } catch (RuntimeException e) {
			        // Log the exception if needed
			        System.out.println("Student request not found, executing else part: " + e.getMessage());
			        
			        // Handle the else part
			        ExternalRequest externalRequestByERid = externalRequestService.getExternalRequestByERid(againse_request);
			       // externalRequestByERid.setApproval_status(ProjectConstants.student_req_approval_status_result_declared);
			        externalRequestByERid.setUpdation_date(new Date());
			        externalRequestService.saveExternalRequest(externalRequestByERid);
			    }
			

			return result;

		}
	}
	@SuppressWarnings("unchecked")
	@RequestMapping("/getTestResult")
	public @ResponseBody Map<String, Object> gethist(@RequestParam("test_data_id") Long test_data_id,
			@RequestParam(value = "student_id", required = false) Long student_id) {
		StudentTestData studentTestData=new StudentTestData();
		System.out.println(">>>>  "+test_data_id+"  "+student_id);
		User user = (User) session.getAttribute("user");
		
		if(user.getRole().equals(ProjectConstants.company) || user.getRole().equals(ProjectConstants.hr)) {
			System.out.println("company");
			studentTestData = studentTestDataService.getStudTestDataAgainstReq(test_data_id, student_id);
		
		}
		else {
			System.out.println("student");
			 studentTestData = studentTestDataService.getStudentTestData(test_data_id);
		}

		
		System.out.println("status"+studentTestData.getStatus());
		if(studentTestData.getStatus().equals(ProjectConstants.student_test_data_status_pending)){
			Map<String, Object> result = new HashMap<>();
			result.put("status", studentTestData.getStatus());
			result.put("exp_date",studentTestData.getExpiration_date());
			System.out.println(studentTestData.getExpiration_date()+"   "+studentTestData.getExpiration_date().toString());
			return result;
		}else if(studentTestData.getStatus().equals(ProjectConstants.student_test_data_status_disqualified)){
			return null;
		}
		else{
			ObjectMapper mapper = new ObjectMapper();
			Map<String, HashMap<String, String>> answers = new HashMap<>();
			try {
				answers = (HashMap<String, HashMap<String, String>>) mapper.readValue(studentTestData.getAnswer_set(),
						Map.class);
			} catch (Exception e) {
				e.printStackTrace();
			}
			CompanyTest test = compTestService.getCompanyTestData_by_id(studentTestData.getTest_id());
			// type of test
			Map<String, String> testType = new HashMap<>();
			try {
				testType = (HashMap<String, String>) mapper.readValue(test.getTest_type(), Map.class);
			} catch (Exception e) {
				e.printStackTrace();
			}

			Map<String, Object> result = userService.getTestResult(answers, testType, test);
			result.put("status", studentTestData.getStatus());
			result.put("exp_date",studentTestData.getExpiration_date());
			System.out.println(studentTestData.getExpiration_date()+"   "+studentTestData.getExpiration_date().toString());
			return result;
		}
	}
 
	@RequestMapping(value="/view_test_result",method=RequestMethod.POST)
	public String getResult(){
		
		return "redirect:get_test_result";
	}

	@RequestMapping("/get_test_result")
	public String viewResult(){
		
		return "test_result";
	}
}