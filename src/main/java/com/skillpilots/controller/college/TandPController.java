package com.skillpilots.controller.college;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.ParameterizedTypeReference;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.util.UriComponentsBuilder;

import com.oracle.wls.shaded.org.apache.xpath.operations.Mod;
import com.skillpilots.Dto.ApiResponse;
import com.skillpilots.Dto.AppliedCompanyDTO;
import com.skillpilots.Dto.RecruiterInfo;
import com.skillpilots.Dto.RecruitmentResponse;
import com.skillpilots.Dto.StdListApplied;
import com.skillpilots.Dto.StdListAppliedResponse;
import com.skillpilots.Dto.StdListAppliedforR1;
import com.skillpilots.model.College;
import com.skillpilots.model.Company;
import com.skillpilots.model.CompanyDrive;
import com.skillpilots.model.User;
import com.skillpilots.repository.CompanyDriveRepository;
import com.skillpilots.repository.ComponyRepository;
import com.skillpilots.repository.RecruitmentStatusRepo;
import com.skillpilots.service.CollegeService;
import com.skillpilots.service.UserService;
import com.skillpilots.utility.ProjectConstants;

import jakarta.servlet.http.HttpSession;

import java.util.Map;

@Controller
public class TandPController {
	@Autowired
	private HttpSession session;
	@Autowired
	private UserService userService;
	@Autowired
	private CollegeService collegeService;
	@Autowired
	private ComponyRepository componyRepository;
	@Autowired
	private CompanyDriveRepository companyDriveRepository;
	@Autowired
	private RecruitmentStatusRepo recruitmentStatusRepo;

	@GetMapping("/tandp_dashboard")
	public String tpDashboard() {
		return "tandp_dashboard";
	}

	@GetMapping("/createRecrutment")
	public String createRecrutment(Model model, @RequestParam(name = "page", defaultValue = "0") int page,
			@RequestParam(name = "size", defaultValue = "6") int size) {

		User user = (User) session.getAttribute("user");
		String email = null;
		College college = null;
		if (user.getRole().equals("5")) {
			college = collegeService.getCollegeByEmail(user.getEmail());
			email = user.getEmail();
		} else {
			college = collegeService.getCollegeByEmail(user.getEmailIdCommon());
			email = user.getEmailIdCommon();
		}
		Long cid = college.getCollege_id();

		System.out.println("CollegegeeeggegegeId" + cid);

		RestTemplate restTemplate = new RestTemplate();
		String url = "http://43.204.35.211:8000/newskill/list?collegeId=" + cid + "&page=" + page + "&size=" + size;
		; // Replace with your actual API endpoint
//	      testing ip
//	        String url = "http://43.204.35.211:8000/newskill/list?collegeId=10";

//		 local ip
		// String url = "http://43.204.35.211:8000/newskill/list?collegeId=" + cid;

		ApiResponse response = restTemplate.getForObject(url, ApiResponse.class);
		model.addAttribute("email", email);
		model.addAttribute("cid", cid);
		model.addAttribute("placements", response.getPlacements());
		model.addAttribute("currentPage", page);
		model.addAttribute("totalPages", response.getTotalPages()); // Assuming the API includes totalPages
		model.addAttribute("size", size);

		return "createRecrutment";
	}

	@GetMapping("/stdList")
	@ResponseBody
	public List<StdListApplied> stdList(@RequestParam String placementId, @RequestParam String ssc,
			@RequestParam String hsc, @RequestParam String ug, @RequestParam List<String> years) {

		User user = (User) session.getAttribute("user");

		College college = null;
		if (user.getRole().equals("5")) {
			college = collegeService.getCollegeByEmail(user.getEmail());
		} else {
			college = collegeService.getCollegeByEmail(user.getEmailIdCommon());
		}
		Long cid = college.getCollege_id();

		RestTemplate restTemplate = new RestTemplate();

		String yearsParam = String.join(",", years); // Convert back to comma-separated for URL

//	    local ip
		String url2 = String.format(
				"http://43.204.35.211:8000/newskill/performance?ssc=%s&hsc=%s&ug=%s&collegeId=%s&placementId=%s&years=%s",
				ssc, hsc, ug, cid, placementId, yearsParam);

//	  
//	    testing ip
//	    String url2 = String.format("http://43.204.35.211:8000/newskill/performance?ssc=%s&hsc=%s&ug=%s&collegeId=1&placementId=%s&years=%s", 
//                ssc, hsc, ug, placementId, yearsParam);

//	    String url2 = String.format("http://43.204.35.211:8000/newskill/performance?ssc=%s&hsc=%s&ug=%s&collegeId=1&placementId=%s&years=%s", 
//                ssc, hsc, ug, placementId, yearsParam);
		List<StdListApplied> stdList = Arrays.asList(restTemplate.getForObject(url2, StdListApplied[].class));

		return stdList;
	}

	@GetMapping("/stdfilter")
	@ResponseBody
	public List<StdListApplied> stdListfilter(@RequestParam String placementId, @RequestParam String ssc,
			@RequestParam String hsc, @RequestParam String ug, @RequestParam List<String> years) {
		System.out.println("Received Placement ID: " + placementId);
		System.out.println("Received SSC: " + ssc);
		System.out.println("Received HSC: " + hsc);
		System.out.println("Received UG: " + ug);
		System.out.println("Received years: " + years);

		User user = (User) session.getAttribute("user");

		College college = null;
		if (user.getRole().equals("5")) {
			college = collegeService.getCollegeByEmail(user.getEmail());
		} else {
			college = collegeService.getCollegeByEmail(user.getEmailIdCommon());
		}
		Long cid = college.getCollege_id();

		RestTemplate restTemplate = new RestTemplate();

		String yearsParam = String.join(",", years); // Convert back to comma-separated for URL

//local ip
		String url2 = String.format(
				"http://43.204.35.211:8000/newskill/filerByYear?ssc=%s&hsc=%s&ug=%s&collegeId=%s&placementId=%s&years=%s",
				ssc, hsc, ug, cid, placementId, yearsParam);

//	    testing ip
//	    String url2 = String.format("http://43.204.35.211:8000/newskill/filerByYear?ssc=%s&hsc=%s&ug=%s&collegeId=1&placementId=%s&years=%s", 
//                ssc, hsc, ug, placementId, yearsParam);

//	    String url2 = String.format("http://43.204.35.211:8000/newskill/filerByYear?ssc=%s&hsc=%s&ug=%s&collegeId=1&placementId=%s&years=%s", 
//                ssc, hsc, ug, placementId, yearsParam);
		List<StdListApplied> stdList = Arrays.asList(restTemplate.getForObject(url2, StdListApplied[].class));

		return stdList;
	}

	@GetMapping("/tandp_applied_list")
	public String tandp_applied_list(Model model, @RequestParam(name = "page", defaultValue = "0") int page,
			@RequestParam(name = "size", defaultValue = "6") int size) {

		User user = (User) session.getAttribute("user");

		College college = null;
		if (user.getRole().equals("5")) {
			college = collegeService.getCollegeByEmail(user.getEmail());
		} else {
			college = collegeService.getCollegeByEmail(user.getEmailIdCommon());
		}
		Long cid = college.getCollege_id();

		RestTemplate restTemplate = new RestTemplate();

		String url = "http://43.204.35.211:8000/newskill/list?collegeId=" + cid + "&page=" + page + "&size=" + size;
		; // Replace with your actual API
		// endpoint

		ApiResponse response = restTemplate.getForObject(url, ApiResponse.class);
		int totalPages = response.getTotalPages() > 0 ? response.getTotalPages() : 1;

		System.out.println("totalllllllllllllllllllll" + totalPages);
		model.addAttribute("placements", response.getPlacements());
		model.addAttribute("currentPage", page);
		model.addAttribute("totalPages", totalPages);
		model.addAttribute("size", size);

		return "tandp_applied_list"; // Ensure this view exists
	}

	@GetMapping("/stdListApplied")
	@ResponseBody
	public List<StdListAppliedforR1> StdListAppliedforR1(@RequestParam Long placementId) {
		User user = (User) session.getAttribute("user");

		College college = null;
		if (user.getRole().equals("5")) {
			college = collegeService.getCollegeByEmail(user.getEmail());
		} else {
			college = collegeService.getCollegeByEmail(user.getEmailIdCommon());
		}
		Long cid = college.getCollege_id();
		Long recruitmentId = placementId;
		String Status = "Applied";

		RestTemplate restTemplate = new RestTemplate();
//	    String url = String.format("http://43.204.35.211:8000/newskill/recruitment?collegeId=%s&reqruitmentId=%s", 
//	                                collegeId, recruitmentId);

//	    testing ip
//	    String url = String.format("http://43.204.35.211:8000/newskill/recruitment?collegeId=%s&reqruitmentId=%s&status=%s", 
//                collegeId, recruitmentId,Status);

//	    local ip
		String url = String.format(
				"http://43.204.35.211:8000/newskill/recruitment?collegeId=%s&reqruitmentId=%s&status=%s", cid,
				recruitmentId, Status);

		RecruitmentResponse response = restTemplate.getForObject(url, RecruitmentResponse.class);

		List<StdListAppliedforR1> stdListApplied = response != null ? response.getData() : List.of();

		return stdListApplied;
	}

	@GetMapping("/getCompanyDriveAppliedStd")
	@ResponseBody
	public List<StdListAppliedforR1> StdListAppliedforR12(@RequestParam Long companyId, @RequestParam String jobRole,
			Model model) {
		User user = (User) session.getAttribute("user");

		RestTemplate restTemplate = new RestTemplate();

		String url = String.format("http://43.204.35.211:8000/newskill/studentDriveRequest?companyId=%s&jobRole=%s",
				companyId, jobRole);

		RecruitmentResponse response = restTemplate.getForObject(url, RecruitmentResponse.class);
		System.out.println("Response from API: " + response);

		model.addAttribute("recruitmentResponse", response);

		return response != null ? response.getData() : Collections.emptyList();
	}

	@GetMapping("/viewAppliedStudentHistory")
	public String viewAppliedStudentHistory(Model model, @RequestParam Long recruitmentId) {

		User user = (User) session.getAttribute("user");

		College college = null;
		if (user.getRole().equals("5")) {
			college = collegeService.getCollegeByEmail(user.getEmail());
		} else {
			college = collegeService.getCollegeByEmail(user.getEmailIdCommon());
		}
		Long cid = college.getCollege_id();

		RestTemplate restTemplate = new RestTemplate();

		// return the data needed by the frontend, such as a JSON response
		String urlR1 = String.format(
				"http://43.204.35.211:8000/newskill/recruitment?collegeId=%s&reqruitmentId=%s&status=%s", cid,
				recruitmentId, "1ST ROUND");

		String urlR2 = String.format(
				"http://43.204.35.211:8000/newskill/recruitment?collegeId=%s&reqruitmentId=%s&status=%s", cid,
				recruitmentId, "2ND ROUND");

		String urlR3 = String.format(
				"http://43.204.35.211:8000/newskill/recruitment?collegeId=%s&reqruitmentId=%s&status=%s", cid,
				recruitmentId, "3RD ROUND");

		String urlR4 = String.format(
				"http://43.204.35.211:8000/newskill/recruitment?collegeId=%s&reqruitmentId=%s&status=%s", cid,
				recruitmentId, "4TH ROUND");

		String selectedStd = String.format(
				"http://43.204.35.211:8000/newskill/recruitment?collegeId=%s&reqruitmentId=%s&status=%s", cid,
				recruitmentId, "SELECTED");

		RecruitmentResponse responseR1 = restTemplate.getForObject(urlR1, RecruitmentResponse.class);
		RecruitmentResponse responseR2 = restTemplate.getForObject(urlR2, RecruitmentResponse.class);
		RecruitmentResponse responseR3 = restTemplate.getForObject(urlR3, RecruitmentResponse.class);
		RecruitmentResponse responseR4 = restTemplate.getForObject(urlR4, RecruitmentResponse.class);
		RecruitmentResponse selcStd = restTemplate.getForObject(selectedStd, RecruitmentResponse.class);

		List<StdListAppliedforR1> stdListAppliedR1 = responseR1 != null ? responseR1.getData() : List.of();
		List<StdListAppliedforR1> stdListAppliedR2 = responseR2 != null ? responseR2.getData() : List.of();
		List<StdListAppliedforR1> stdListAppliedR3 = responseR3 != null ? responseR3.getData() : List.of();
		List<StdListAppliedforR1> stdListAppliedR4 = responseR4 != null ? responseR4.getData() : List.of();
		List<StdListAppliedforR1> stdListSelected = responseR4 != null ? selcStd.getData() : List.of();
		model.addAttribute("stdListAppliedR1", stdListAppliedR1);
		model.addAttribute("stdListAppliedR2", stdListAppliedR2);
		model.addAttribute("stdListAppliedR3", stdListAppliedR3);
		model.addAttribute("stdListAppliedR4", stdListAppliedR4);
		model.addAttribute("stdListSelected", stdListSelected);

		return "college_viewAppliedStudentsRound"; // Adjust as needed, based on your response type
	}

	@GetMapping("companyCampusDriveForStudentsDashboard")
	public String companyCampusDriveForStudentsDashboard(Model model) {
		User user = (User) session.getAttribute("user");

		List<CompanyDrive> companyDrive = companyDriveRepository.findByStatus("A");

		List<AppliedCompanyDTO> appliedCompanies = recruitmentStatusRepo.getStudentRequestCompany(user.getId());

		model.addAttribute("companyDrive", companyDrive);
		model.addAttribute("appliedCompanies", appliedCompanies);

		System.out.println(companyDrive);
		return "companyCampusDriveForStudentsDashboard";
	}

//	@GetMapping("/campusDriveForStudentsDashboard")
//	public String CampusDriveStudent(Model model) {
//		User user = (User) session.getAttribute("user");
//
//		// Retrieve college ID
////		College college = null;
////		if (user.getRole().equals("5")) {
////			college = collegeService.getCollegeByEmail(user.getEmail());
////		} else {
////			college = collegeService.getCollegeByEmail(user.getEmailIdCommon());
////		}
////		Long collegeId = college.getCollege_id();
////		Long studentId = 1L; // Assuming the user object has an ID for the student
//
//		// API URL with collegeId and studentId
//		String apiUrl = "http://43.204.35.211:8000/newskill/getRecruitmentsList?collegeId=" + user.getCollege_id()
//				+ "&studentId=" + user.getId();
//
//		// Call the API
//		RestTemplate restTemplate = new RestTemplate();
//		try {
//			ResponseEntity<Map[]> response = restTemplate.getForEntity(apiUrl, Map[].class);
//			Map[] recruitmentList = response.getBody();
//
//			// Print the recruitmentList to verify it's being fetched correctly
//			if (recruitmentList != null) {
//				System.out.println(Arrays.toString(recruitmentList)); // Debugging output
//			}
//
//			// Add data to the model for view rendering
//			model.addAttribute("recruitmentList", recruitmentList);
//
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//
//		return "campusDriveForStudentsDashboard";
//	}

	@GetMapping("/campusDriveForStudentsDashboard")
	public String CampusDriveStudent(Model model) {
		User user = (User) session.getAttribute("user");

		// API URL with collegeId and studentId
		String apiUrl = "http://43.204.35.211:8000/newskill/getRecruitmentsList?collegeId=" + user.getCollege_id()
				+ "&studentId=" + user.getId();

		// Call the API
		RestTemplate restTemplate = new RestTemplate();
		try {
			ResponseEntity<Map[]> response = restTemplate.getForEntity(apiUrl, Map[].class);
			Map[] recruitmentList = response.getBody();

			if (recruitmentList != null) {
				System.out.println(Arrays.toString(recruitmentList)); // Debugging output
			}

			model.addAttribute("recruitmentList", recruitmentList);

		} catch (Exception e) {
			e.printStackTrace();
		}
		// API 2: Get applied status list
		String apiUrl1 = "http://43.204.35.211:8000/newskill/appliedStatusStudent?studentId=" + user.getId();

		try {
			ResponseEntity<Map[]> response = restTemplate.getForEntity(apiUrl1, Map[].class);
			Map[] body = response.getBody();
			model.addAttribute("appliedList", body);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return "campusDriveForStudentsDashboard";
	}

	@GetMapping("/studentDriveRequest")
	public String getRecruitment(Model model, @RequestParam(name = "page", defaultValue = "0") int page,
			@RequestParam(name = "size", defaultValue = "6") int size) {
		User user = (User) session.getAttribute("user");

		Company company = null;
		if (user.getRole().equals(ProjectConstants.company)) {
			company = componyRepository.getCompanyDetailsById(user.getEmail());

		} else {
			company = componyRepository.getCompanyDetailsById(user.getEmailIdCommon());

		}

		PageRequest pageble = PageRequest.of(page, size);
		Page<CompanyDrive> drive = companyDriveRepository.findByStatusAndCompanyIdOrderByDrive("A",
				company.getCompany_id(), pageble);

		model.addAttribute("drive", drive.getContent());
		model.addAttribute("currentPage", page);
		model.addAttribute("totalPages", drive.getTotalPages());
		model.addAttribute("size", size);
		
		return "companyCampusDriveAppliedList";

	}

//	temprory not in use

//	@GetMapping("/studentDriveRequest2")
//	public String studentDriveRequest(Model model) {
//	    User user = (User) session.getAttribute("user");
//
//	    // API URL with companyId
//	    String apiUrl = "http://43.204.35.211:8000/newskill/studentDriveRequest?companyId=14";
//
//	    // Initialize RestTemplate
//	    RestTemplate restTemplate = new RestTemplate();
//	    try {
//	        // Make GET request to the API
//	        ResponseEntity<Map> response = restTemplate.getForEntity(apiUrl, Map.class);
//
//	        // Extract the response body
//	        Map<String, Object> responseBody = response.getBody();
//
//	        // Verify and extract the 'data' array from the response
//	        if (responseBody != null && responseBody.containsKey("data")) {
//	            List<Map<String, Object>> recruitmentList = (List<Map<String, Object>>) responseBody.get("data");
//
//	            // Print recruitmentList for debugging
//	            System.out.println(recruitmentList);
//
//	            // Add recruitmentList to model for view rendering
//	            model.addAttribute("recruitmentList", recruitmentList);
//	        } else {
//	            System.out.println("No data found in the response.");
//	        }
//
//	    } catch (Exception e) {
//	        e.printStackTrace();
//	    }
//
//	    // Return the view name where the data will be displayed
//	    return "companyCampusDriveAppliedList"; // replace with your actual view name
//	}

	@GetMapping("/viewAppliedCandidateHistory")
	public String viewAppliedCandidateHistory(Model model, @RequestParam Long companyId, @RequestParam Long drive_id) {

		User user = (User) session.getAttribute("user");

		RestTemplate restTemplate = new RestTemplate();
//		
//	    // return the data needed by the frontend, such as a JSON response
		String urlR1 = String.format(
				"http://43.204.35.211:8000/newskill/companyRecruitmentHistory?company_id=%s&drive_id=%s&status=%s",
				companyId, drive_id, "1ST ROUND");

		String urlR2 = String.format(
				"http://43.204.35.211:8000/newskill/companyRecruitmentHistory?company_id=%s&drive_id=%s&status=%s",
				companyId, drive_id, "2ND ROUND");

		String urlR3 = String.format(
				"http://43.204.35.211:8000/newskill/companyRecruitmentHistory?company_id=%s&drive_id=%s&status=%s",
				companyId, drive_id, "3RD ROUND");

		String urlR4 = String.format(
				"http://43.204.35.211:8000/newskill/companyRecruitmentHistory?company_id=%s&drive_id=%s&status=%s",
				companyId, drive_id, "4TH ROUND");

		String selectedStd = String.format(
				"http://43.204.35.211:8000/newskill/companyRecruitmentHistory?company_id=%s&drive_id=%s&status=%s",
				companyId, drive_id, "SELECTED");

		String selectedRecruiter = String.format("http://43.204.35.211:8000/newskill/managerAndLead?companyId=%s",
				companyId);

		RecruitmentResponse responseR1 = restTemplate.getForObject(urlR1, RecruitmentResponse.class);

		RecruitmentResponse responseR2 = restTemplate.getForObject(urlR2, RecruitmentResponse.class);
		RecruitmentResponse responseR3 = restTemplate.getForObject(urlR3, RecruitmentResponse.class);
		RecruitmentResponse responseR4 = restTemplate.getForObject(urlR4, RecruitmentResponse.class);
		RecruitmentResponse selcStd = restTemplate.getForObject(selectedStd, RecruitmentResponse.class);
		List<RecruiterInfo> selcRecrList = Arrays
				.asList(restTemplate.getForObject(selectedRecruiter, RecruiterInfo[].class));

		List<StdListAppliedforR1> stdListAppliedR1 = responseR1 != null ? responseR1.getData() : List.of();
		List<StdListAppliedforR1> stdListAppliedR2 = responseR2 != null ? responseR2.getData() : List.of();
		List<StdListAppliedforR1> stdListAppliedR3 = responseR3 != null ? responseR3.getData() : List.of();
		List<StdListAppliedforR1> stdListAppliedR4 = responseR4 != null ? responseR4.getData() : List.of();
		List<StdListAppliedforR1> stdListSelected = responseR4 != null ? selcStd.getData() : List.of();

		model.addAttribute("stdListAppliedR1", stdListAppliedR1);
		model.addAttribute("stdListAppliedR2", stdListAppliedR2);
		model.addAttribute("stdListAppliedR3", stdListAppliedR3);
		model.addAttribute("stdListAppliedR4", stdListAppliedR4);
		model.addAttribute("stdListSelected", stdListSelected);
		model.addAttribute("selcRecrList", selcRecrList);

		return "viewAppliedCandidateHistory"; 
	}

	@GetMapping("/appliedStatus")
	public String studentAppliedRequest(int studentId, Model model) {
		String apiUrl = "http://43.204.35.211:8000/newskill/appliedStatusStudent";

		String finalUrl = UriComponentsBuilder.fromHttpUrl(apiUrl).queryParam("studentId", studentId).toUriString();

		RestTemplate restTemplate = new RestTemplate();
		try {
			String response = restTemplate.getForObject(finalUrl, String.class);
			model.addAttribute("appliedList", new org.json.JSONArray(response));
		} catch (Exception e) {
			model.addAttribute("error", "Failed to fetch applied jobs.");
		}
		return "campusDriveForStudentsDashboard"; 
	}

	@GetMapping("/checkApplicationStatus")
	@ResponseBody
	public boolean checkApplicationStatus(@RequestParam Long studentId, @RequestParam Long driveId) {
		return recruitmentStatusRepo.existsByStudentIdAndDriveId(studentId, driveId);
	}

}
