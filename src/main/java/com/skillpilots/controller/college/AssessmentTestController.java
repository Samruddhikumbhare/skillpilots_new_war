package com.skillpilots.controller.college;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.skillpilots.Dto.QuestionResponse;
import com.skillpilots.enumclass.QuestionType;
import com.skillpilots.model.AssessmentTest;
import com.skillpilots.model.CampusDrive;
import com.skillpilots.model.CampusResult;
import com.skillpilots.model.Questions;
import com.skillpilots.model.Results;
import com.skillpilots.model.User;
import com.skillpilots.repository.CampusDriveRepository;
import com.skillpilots.repository.CampusDriveResultRepository;
import com.skillpilots.service.ExamService;
import com.skillpilots.service.QuestionService;
import com.skillpilots.service.ResultService;

import jakarta.servlet.http.HttpSession;

@Controller
public class AssessmentTestController {

	@Autowired
	private HttpSession session;
	@Autowired
	private ExamService examService;
	@Autowired
	private QuestionService questionService;
	@Autowired
	private ResultService resultService;
	@Autowired
	private CampusDriveRepository  driveRepository;
	@Autowired
	private CampusDriveResultRepository campusDriveRepository;
	@Autowired
	private HttpSession httpSession;
	/*
	 * @RequestMapping(value = "/assessment_test", method = RequestMethod.GET)
	 * public String AssessmentTest(Model model) { User user = (User)
	 * session.getAttribute("user"); Map<Long, Results> resultsByTestId = new
	 * HashMap<>(); Results result=null; List<AssessmentTest> allTests =
	 * examService.getAllTests(); //Results result =
	 * resultService.getResultByStudentId(user.getId()); // Loop through all tests
	 * and fetch results for each test ID for (AssessmentTest test : allTests) {
	 * result = resultService.getResultByStudentIdTestId(user.getId(),
	 * test.getTesId()); resultsByTestId.put(test.getTesId(), result); }
	 * 
	 * model.addAttribute("tests", allTests); model.addAttribute("resultsByTestId",
	 * resultsByTestId);
	 * 
	 * return "exam"; }
	 */

    @GetMapping("/assessment_test")
    public String getTestsForStudent( Model model) {
    User user=	(User) httpSession.getAttribute("user");
        List<Map<String, Object>> testList = examService.getTestsForStudent(user.getId());
        model.addAttribute("tests", testList); // Store test data in model
        return "exam"; // Returns the JSP page (testList.jsp)
    }
	
	
	
	
	@GetMapping("/start")
	public String startTest(@RequestParam Long testId, Model model) {
	    User user = (User) session.getAttribute("user");
	   
	    AssessmentTest test = examService.findByTestId(testId);
	    if (test == null) {
	        return "errorPage";
	    }
	   
	    List<Questions> questions = questionService.getQuestionByTestId(testId);
	    Collections.shuffle(questions);
	    int limit = Math.min(test.getTotal_que(), questions.size());
	    List<Questions> limitedQuestions = questions.subList(0, limit);
	    model.addAttribute("questions", limitedQuestions);
	    model.addAttribute("testId", testId);
	    model.addAttribute("studentId", user.getId()); // Example student ID; replace with actual data
	    model.addAttribute("testTime", test.getTime());
	    model.addAttribute("test", test);
	    return "startTest"; // Returns to the startTest view
	}
	
	@GetMapping("/startDrive")
	public String startTestDrive(@RequestParam Long testId,@RequestParam Long studentId, Model model) {
	    //User user = (User) session.getAttribute("user");
	   System.out.println("PPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPpppppppppppppppppppppppppp"+studentId);
	    AssessmentTest test = examService.findByTestId(testId);
	    if (test == null) {
	        return "errorPage";
	    }
	   
	    List<Questions> questions = questionService.getQuestionByTestId(testId);
	    Collections.shuffle(questions);
	    int limit = Math.min(test.getTotal_que(), questions.size());
	    List<Questions> limitedQuestions = questions.subList(0, limit);
	    model.addAttribute("questions", limitedQuestions);
	    CampusDrive drive = driveRepository.findById(studentId).orElseThrow(()-> new RuntimeException("not found"));
	    drive.setStatus(0L);
	    driveRepository.save(drive);
	    System.out.println("sssssssssssssssssssssssssssssssssssssssssssss"+limitedQuestions);
	    
	    
	    
	    model.addAttribute("testId", testId);
	    //model.addAttribute("studentId", user.getId()); // Example student ID; replace with actual data
	    model.addAttribute("testTime", test.getTime());
	    model.addAttribute("test", test);
	    return "drive_exam"; // Returns to the startTest view
	}
	
	
    @GetMapping("/disclaimer")
    public String showDisclaimer(@RequestParam Long testId, Model model) {
        model.addAttribute("testId", testId);
        return "disclaimer";
    }
	
   
	
//    @PostMapping("/submit")
//    public ResponseEntity<String> submitTest(@RequestParam Long studentId,
//                                             @RequestParam Long testId,
//                                             @RequestBody List<QuestionResponse> questionResponses) {
//        try {
//        	resultService.submitTest(studentId, testId, questionResponses);
//            return ResponseEntity.ok("Test submitted successfully");
//        } catch (Exception e) {
//            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("Failed to submit test");
//        }
//    }
//	
	
//    @PostMapping("/submit")
//    @ResponseBody
//    public Results submitTest(@RequestParam("studentId") Long studentId,
//                              @RequestParam("testId") Long testId,
//                              @RequestParam Map<String, String> allAnswers,
//                              @RequestParam(value = "disqualified", required = false, defaultValue = "false") boolean disqualified) {
//
//        System.out.println("Student ID: " + studentId);
//        System.out.println("Test ID: " + testId);
//        System.out.println("All Answers: " + allAnswers);
//
//        Results results = new Results();
//
//        AssessmentTest test = examService.findByTestId(testId);
//        if (test == null) {
//            System.out.println("Test not found!");
//            return results;
//        }
//
//        if (disqualified) {
//            System.out.println("Student disqualified.");
//            results.setResultStatus("Disqualified");
//            results.setTestId(testId);
//            resultService.saveResult(results);
//            return results;
//        }
//
//        int totalQuestions = test.getQuestions().size();
//        int correctAnswers = 0;
//        int wrongAnswers = 0;
//        int unanswered = 0;
//
//        System.out.println("Total Questions: " + totalQuestions);
//
//        // Process each question and its corresponding answer
//        for (Questions question : test.getQuestions()) {
//            Long questionId = question.getId();
//            String submittedAnswer = allAnswers.get("answers[answer_" + questionId + "]");
//            
//            System.out.println("Question ID: " + questionId);
//            System.out.println("Submitted Answer: " + submittedAnswer);
//
//            if (submittedAnswer == null || submittedAnswer.isEmpty()) {
//                System.out.println("Question unanswered.");
//                unanswered++;
//                continue;
//            }
//
//            if (question.getType()==(QuestionType.MULTIPLE_CHOICE)) {
//                List<String> correctAnswersList = question.getCorrectAnswers();
//                if (correctAnswersList.contains(submittedAnswer)) {
//                    System.out.println("Correct answer selected.");
//                    correctAnswers++;
//                } else {
//                    System.out.println("Incorrect answer selected.");
//                    wrongAnswers++;
//                }
//            } else {
//                if (submittedAnswer.equals(question.getCorrectAnswer())) {
//                    System.out.println("Correct answer selected.");
//                    correctAnswers++;
//                } else {
//                    System.out.println("Incorrect answer selected.");
//                    wrongAnswers++;
//                }
//            }
//        }
//
//        int totalMarks = correctAnswers * test.getMark_per_que();
//        int marksObtained = (totalMarks / totalQuestions) * correctAnswers;
//
//        System.out.println("Correct Answers: " + correctAnswers);
//        System.out.println("Wrong Answers: " + wrongAnswers);
//        System.out.println("Unanswered: " + unanswered);
//        System.out.println("Marks Obtained: " + marksObtained);
//
//        String resultStatus = calculateResultStatus(marksObtained, totalMarks);
//
//        System.out.println("Result Status: " + resultStatus);
//
//        results.setStudentId(studentId);
//        results.setMarks(marksObtained);
//        results.setTotalMarks(totalMarks);
//        results.setCorrectAns(correctAnswers);
//        results.setWrongAns(wrongAnswers);
//        results.setNoAns(unanswered);
//        results.setOutof(test.getTotal_mark());
//        results.setResultStatus(resultStatus);
//        results.setTestId(testId);
//
//        System.out.println("Saving results: " + results);
//
//        resultService.saveResult(results);
//
//        System.out.println("Results saved successfully!");
//
//        return results;
//    }
//
//    private String calculateResultStatus(int marksObtained, int totalMarks) {
//        double percentage = (double) marksObtained / totalMarks * 100;
//        System.out.println("Percentage: " + percentage);
//        return percentage >= 40 ? "Pass" : "Fail";
//    }


    @PostMapping("/submit")
    @ResponseBody
    public Results submitTest(@RequestParam("studentId") Long studentId,
                              @RequestParam("testId") Long testId,
                              @RequestParam Map<String, String> allAnswers,
                              @RequestParam(value = "disqualified", required = false, defaultValue = "false") boolean disqualified) {

        System.out.println("Student ID: " + studentId);
        System.out.println("Test ID: " + testId);
        System.out.println("All Answers: " + allAnswers);

        Results results = new Results();

        AssessmentTest test = examService.findByTestId(testId);
        if (test == null) {
            System.out.println("Test not found!");
            return results;
        }

        if (disqualified) {
        	results.setStudentId(studentId);
            results.setResultStatus("Disqualified");
            results.setTestId(testId);
            results.setTestTakenDate(new Date());

            resultService.saveResult(results);
            return results;
        }

        int totalQuestions = test.getQuestions().size();
        int correctAnswers = 0;
        int wrongAnswers = 0;
        int unanswered = 0;

        System.out.println("Total Questions: " + totalQuestions);

        for (Map.Entry<String, String> entry : allAnswers.entrySet()) {
            String key = entry.getKey();
            String selectedOption = entry.getValue();

            if (!key.startsWith("answers[answer_")) {
                continue;
            }

            String questionIdStr = key.split("_")[1].replace("]", "");
            System.out.println("Processing Question ID: " + questionIdStr + ", Selected Option: " + selectedOption);

            try {
                Long questionId = Long.parseLong(questionIdStr);

                Questions question = test.getQuestions()
                        .stream()
                        .filter(q -> q.getId().equals(questionId))
                        .findFirst()
                        .orElse(null);

                if (question != null) {
                    System.out.println("Correct Answer: " + question.getCorrectAnswer());

                    if (selectedOption == null || selectedOption.isEmpty()) {
                        unanswered++;
                    } else if (question.getType().equals(QuestionType.MULTIPLE_CHOICE)) {
                    	
                    	System.out.println("Multiple cjoicecssssss"+question.getCorrectAnswers());
                        List<String> correctAnswersList = question.getCorrectAnswers();
                        if (correctAnswersList.contains(selectedOption)) {
                            correctAnswers++;
                        } else {
                            wrongAnswers++;
                        }
                    } else if (selectedOption.equals(question.getCorrectAnswer())) {
                        correctAnswers++;
                    } else {
                        wrongAnswers++;
                    }
                } else {
                    System.out.println("Question not found for ID: " + questionId);
                }
            } catch (NumberFormatException e) {
                System.err.println("Invalid question ID: " + questionIdStr);
            }
        }

        int totalMarks = correctAnswers * test.getMark_per_que();
       // int marksObtained = (totalMarks / totalQuestions) * correctAnswers;

        System.out.println("Correct Answers: " + correctAnswers);
        System.out.println("Wrong Answers: " + wrongAnswers);
        System.out.println("Unanswered: " + unanswered);
        //System.out.println("Marks Obtained: " + marksObtained);

        String resultStatus = calculateResultStatus(totalMarks, test.getCut_off());

        System.out.println("Result Status: " + resultStatus);

        results.setStudentId(studentId);
        results.setMarks(totalMarks);
        results.setTotalMarks(totalMarks);
        results.setCorrectAns(correctAnswers);
        results.setWrongAns(wrongAnswers);
        results.setNoAns(unanswered);
        results.setOutof(test.getTotal_mark());
        results.setResultStatus(resultStatus);
        results.setTestId(testId);
        results.setTestTakenDate(new Date());

        System.out.println("Saving results: " + results);

        resultService.saveResult(results);

        System.out.println("Results saved successfully!");

        return results;
    }

    private String calculateResultStatus(int totalMarks, int cutOff) {
        return totalMarks >= cutOff ? "Pass" : "Fail";
    }




	@GetMapping("/getTestResults")
	@ResponseBody
    public Results getTestResult(@RequestParam Long testId,Long studentId) {
	    User user = (User) session.getAttribute("user");

		Results result = resultService.getResultByStudentIdTestId(user.getId(), testId);
		return result;
    }
	
	
	
	public String saveTest() {
		
		return "redirect:assessment_test";

	}

	@RequestMapping(value = "/get_Assessment_Test_Data", method = RequestMethod.GET)
	public  String get_Assessment_Test_Data() {
		
		return "create_test";
	}
	
	@RequestMapping(value = "/delete_assessment_Test_Data")
	public @ResponseBody String delete_assessment_Test_Data(String test_id) {
		
//		assessmentTestService.delete_assessment_Test(test_id);
		return "success";
	}
	
	
	@RequestMapping(value = "/update_status_of_assessment_test", method = RequestMethod.POST)
	public @ResponseBody String update_status_of_assessment_test() {
		
		
			return "Test Successfully de-activated!";
		
	}
	
	
	@InitBinder
	protected void initBinder(WebDataBinder binder) {
		SimpleDateFormat dateFormat = new SimpleDateFormat("MM/dd/yyyy");
		binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, false));
	}
	
	
	@PostMapping("/submitDrive")
    @ResponseBody
    public CampusResult submitTestDrive(@RequestParam("studentId") Long studentId,
                              @RequestParam("testId") Long testId,
                              @RequestParam Map<String, String> allAnswers,
                              @RequestParam(value = "disqualified", required = false, defaultValue = "false") boolean disqualified) {

        System.out.println("Student ID: " + studentId);
        System.out.println("Test ID: " + testId);
        System.out.println("All Answers: " + allAnswers);

        CampusResult results = new CampusResult();

        AssessmentTest test = examService.findByTestId(testId);
        
        System.out.println("Testjhbdkjbdkjg"+test);
        if (test == null) {
            System.out.println("Test not found!");
            return results;
        }

        if (disqualified) {
        	results.setStudentId(studentId);
            results.setResultStatus("Disqualified");
            results.setTestId(testId);
            campusDriveRepository.save(results);
            return results;
        }

        int totalQuestions = test.getQuestions().size();
        int correctAnswers = 0;
        int wrongAnswers = 0;
        int unanswered = 0;

        System.out.println("Total Questions: " + totalQuestions);

        for (Map.Entry<String, String> entry : allAnswers.entrySet()) {
            String key = entry.getKey();
            String selectedOption = entry.getValue();

            if (!key.startsWith("answers[answer_")) {
                continue;
            }

            String questionIdStr = key.split("_")[1].replace("]", "");
            System.out.println("Processing Question ID: " + questionIdStr + ", Selected Option: " + selectedOption);

            try {
                Long questionId = Long.parseLong(questionIdStr);

                Questions question = test.getQuestions()
                        .stream()
                        .filter(q -> q.getId().equals(questionId))
                        .findFirst()
                        .orElse(null);

                if (question != null) {
                    System.out.println("Correct Answer: " + question.getCorrectAnswer());

                    if (selectedOption == null || selectedOption.isEmpty()) {
                        unanswered++;
                    } else if (question.getType().equals(QuestionType.MULTIPLE_CHOICE)) {
                    	
                    	System.out.println("Multiple cjoicecssssss"+question.getCorrectAnswers());
                        List<String> correctAnswersList = question.getCorrectAnswers();
                        if (correctAnswersList.contains(selectedOption)) {
                            correctAnswers++;
                        } else {
                            wrongAnswers++;
                        }
                    } else if (selectedOption.equals(question.getCorrectAnswer())) {
                        correctAnswers++;
                    } else {
                        wrongAnswers++;
                    }
                } else {
                    System.out.println("Question not found for ID: " + questionId);
                }
            } catch (NumberFormatException e) {
                System.err.println("Invalid question ID: " + questionIdStr);
            }
        }

        int totalMarks = correctAnswers * test.getMark_per_que();
       // int marksObtained = (totalMarks / totalQuestions) * correctAnswers;

        System.out.println("Correct Answers: " + correctAnswers);
        System.out.println("Wrong Answers: " + wrongAnswers);
        System.out.println("Unanswered: " + unanswered);
        //System.out.println("Marks Obtained: " + marksObtained);

        String resultStatus = calculateResultStatuss(totalMarks, test.getCut_off());

        System.out.println("Result Status: " + resultStatus);

        results.setStudentId(studentId);
        results.setMarks(totalMarks);
        results.setTotalMarks(totalMarks);
        results.setCorrectAns(correctAnswers);
        results.setWrongAns(wrongAnswers);
        results.setNoAns(unanswered);
        results.setOutof(test.getTotal_mark());
        results.setResultStatus(resultStatus);
        results.setTestId(testId);

        System.out.println("Saving results: " + results);

        campusDriveRepository.save(results);

        System.out.println("Results saved successfully!");

        return results;
    }

    private String calculateResultStatuss(int totalMarks, int cutOff) {
        return totalMarks >= cutOff ? "Pass" : "Fail";
    }


}
