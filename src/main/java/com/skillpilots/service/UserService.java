package com.skillpilots.service;

import java.io.File;
import java.time.LocalDateTime;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.repository.query.Param;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

import com.skillpilots.model.CompAdvertisement;
import com.skillpilots.model.Company;
import com.skillpilots.model.CompanyTest;
import com.skillpilots.model.User;
import com.skillpilots.repository.UserRepository;
import com.skillpilots.utility.ProjectConstants;

import jakarta.mail.MessagingException;
import jakarta.mail.internet.MimeMessage;

@Service
public class UserService {

   
	@Autowired
    private UserRepository userRepository;
	
	@Autowired
	private ComponyService componyService;

	@Autowired
	private JavaMailSender javaMailSender;
	
	@Autowired
	private CompTestService compTestService;
	
    public User findByEmailAndOtp(String email, String otp) {
        return userRepository.findByEmailAndOtp(email, otp);
    }
    
    public User saveUser(User user) {
		return userRepository.save(user);
    	
    }
    
    
    public boolean isValidUser(String email, String password) {
        // Retrieve user from the database based on the email
        Optional<User> optionalUser = userRepository.findByEmail(email);
        if (optionalUser.isPresent()) {
            // User found in the database
            User user = optionalUser.get();
            // Compare the provided password with the stored hashed password
            if (password.equals(user.getPassword())) {
                // Passwords match, user is valid
                return true;
            }
        }
        return false;
}

	public Optional<User> getUserByEmail(String email) {
		// TODO Auto-generated method stub
		return userRepository.findByEmail(email);
	}

	public List<User> findAll() {
	    return userRepository.findAll();
	}

	public User getUserById(Long id) {
	    return userRepository.findById(id).orElseThrow(()-> new RuntimeException("User not found"));
	}

	public void deleteUserById(Long id) {
		userRepository.deleteById(id);
		
	}

	public List<User> findAllByManager() {
	    return userRepository.getUserByManger();
	}

	public List<User> findAllByManagerDeleted() {
		
		return userRepository.getUserByMangerDeleted();
	}
	public List<User> findAllByInternshipLeadDeleted() {
		
		return userRepository.getUserByInternshipLeadDeleted();
	}

	public List<CompAdvertisement> findAllAdv() {
		return componyService.getAllCompAdvertisements() ;
	}

	public void setPhoto(String abc, Long userId) {
		
		User user = userRepository.findById(userId).orElse(null);
		if (user != null) {
            // Update the photo field
            user.setPhoto(abc);
            // Save the updated user entity
            userRepository.save(user);
        }
	}

	public List<User> findAllByRole() {
		return userRepository.findAllByRole();
	}


	public List<User> findAllByRole2() {
		return userRepository.findAllByRole2();
	}
	public List<User> findAllByRole3() {
		return userRepository.findAllByRole3();
	}
	public List<User> findAllByRole4() {
		return userRepository.findAllByRole4();
	}
	public List<User> findAllByRole5() {
		return userRepository.findAllByRole5();
	}
	public List<Map<String, Object>> findAllByRole6() {
		
		return userRepository.findAllByRole6();
	}
	public List<User> findAllByRole7() {
		
		return userRepository.findAllByRole7();
	}
	

	public	User findByCommonId(Long commonId) {
		return userRepository.findByCommonId(commonId);
		
	 }

	public List<User> findAllByCommanId(Long commaonId) {
		
		return userRepository.findAllByCommonId(commaonId);
	}

	public List<User> findAllByCommanIddeptLead(Long commaonId) {
	
		return userRepository.findAllByCommonIddeptLead(commaonId);
	}

	public List<User> findAllByCommanIdintershipLead(Long commaonId) {
		
		return userRepository.findAllByCommonIdinternshiptLead(commaonId);
	}

	public User findByInstituteId(Long instid) {
		
		return userRepository.findbyInstituteId(instid);
	}

	public List<User> findById(String student_id) {
		
		return userRepository.findById(student_id);
	}

	public User save(User user) {
	
		return userRepository.save(user);
	}

	public void sendVerificationEmail(String toEmail, String subject, String content) {
	    try {
	        MimeMessage message = javaMailSender.createMimeMessage();
	        MimeMessageHelper helper = new MimeMessageHelper(message, true);
	        helper.setTo(toEmail);
	        helper.setSubject(subject);
	       
	        // Combine the provided content with the OTP
	        String emailContent = content ;
	       
	        // Set the email content
	        helper.setText(emailContent, true);
	        javaMailSender.send(message);
	    } catch (MessagingException e) {
	        e.printStackTrace();
	    }
	}
	
	
	public void sendEmailWithAttachment(String toEmail, String subject, String content, String attachmentPath) {
        try {
            // Create a new email message
            MimeMessage message = javaMailSender.createMimeMessage();
            MimeMessageHelper helper = new MimeMessageHelper(message, true); // Enable multipart mode

            // Set recipient email, subject, and content
            helper.setTo(toEmail);
            helper.setSubject(subject);
            helper.setText(content, true); // Use true for HTML content

            // Attach file if attachmentPath is provided
            if (attachmentPath != null && !attachmentPath.isEmpty()) {
                File attachment = new File(attachmentPath);
                if (attachment.exists()) {
                    helper.addAttachment(attachment.getName(), attachment);
                } else {
                    System.err.println("Attachment file not found: " + attachmentPath);
                }
            }

            // Send the email
            javaMailSender.send(message);
            System.out.println("Email with attachment sent successfully to " + toEmail);
        } catch (MessagingException e) {
            System.err.println("Error sending email with attachment: " + e.getMessage());
            e.printStackTrace();
        }
    }

	
	
	
	public Date getDateAfterDays(Date date, int days) {
		Calendar c = Calendar.getInstance(); 
		c.setTime(date); 
		c.add(Calendar.DATE, days);
		date = c.getTime();
		return date;
	}

	// Test Result method
	
	public Map<String,Object> getTestResult(Map<String, HashMap<String, String>> answers,Map<String, String> testType,CompanyTest test){
		int totalMarks = 0, markPerQ = 0;
		String testResult = "", answer = "",rightAnswer="",ansString[]={};
		int correctAns = 0, wrongAns = 0, noAns = 0;
		int secMarks;
		Map<String, Integer> sectionMarks = new HashMap<>();
		// calculating total marks,wrong ans,correct ans,not answered.
		for (String key : answers.keySet()) {
			//System.out.println(key + " : " + answers.get(key));
			secMarks = 0;
			for (String k : answers.get(key).keySet()) {
				if (answers.get(key).get(k).equals("none")) {
					noAns++;
				} else {
					//System.out.println(answers.get(key).get(k));
					ansString=answers.get(key).get(k).split("/");
					answer = ansString[0];
					markPerQ=Integer.parseInt(ansString[1]);
					
					System.out.println("<marks per qyeshnsssj"+markPerQ);
					
					
					rightAnswer=ansString[2];
					
					System.out.println("<aaaaaa per qyeshnsssj"+rightAnswer);

					if (answer.equalsIgnoreCase(rightAnswer)) {
						correctAns++;
						totalMarks += markPerQ;
						
						System.out.println("<ttttttttttt per qyeshnsssj"+totalMarks);

						secMarks+= markPerQ;
					} else {
						wrongAns++;
					}
				}
				sectionMarks.put(key, secMarks);
			}
		}

		if (testType.get("time").equals(ProjectConstants.company_test_type_for_test)) {
		    if (totalMarks >= test.getCut_off()) {
		        testResult = ProjectConstants.company_test_result_passed;
		    } else {
		        testResult = ProjectConstants.company_test_result_failed;
		    }
		} else if (testType.get("cut_off").equals(ProjectConstants.company_test_type_for_section)) {
		    int sec_cutoff;
		    testResult = ProjectConstants.company_test_result_passed;
		    for (String key : sectionMarks.keySet()) {
		        long sectionId = Long.parseLong(key); // Parse the string key to long
		        sec_cutoff = compTestService.getTestSection(sectionId).getCut_off();
		        if (sectionMarks.get(key) < sec_cutoff) {
		            testResult = ProjectConstants.company_test_result_failed;
		            break;
		        }
		    }
		}
		Map<String, Object> result = new HashMap<>();
		result.put("correctAns", correctAns);
		result.put("wrongAns", wrongAns);
		result.put("noAns", noAns);
		result.put("outof", test.getTotal_marks());
		result.put("totalMarks", totalMarks);
		result.put("testResult", testResult);
		return result;

	
	
}
	

  public User findByInstitute(Long institute_id) {
	return userRepository.findbyInstituteId(institute_id);
	  
  }

  public User findByEmailCommon(String emailId) {
	return userRepository.findByEmailIdCommon(emailId);
	
}

  public User findByEmailAndRoleAndDepartment(String role,String emailId,Long department){
	return userRepository.getUserByemailAndRole(role, emailId,department);
	  
  }
  
  public User getUserByemail(String email) {
	return userRepository.getUserEmail(email);
	  
  }
  
  public User findByEmailAndRole(String role,String emailId) {
	return userRepository.findByEmailAndRole(role, emailId);
	  
  }

public User findByEmailAndRoleAndTeamName(String email_id,String role, String email, String team_name) {
	return userRepository.findByRoleAndEmailIdCommonAndTeamName(email_id,role, email, team_name);
	
}

 public List<Long> getAppliedStudentCollege( int college_id ) {
	return userRepository.getAppliedStudentCollege(college_id);
	
}

public	boolean emailExist(String email) {
		return userRepository.existsByEmail(email);
		
	}

public Date yesterday() {
		final Calendar cal = Calendar.getInstance();
		cal.add(Calendar.DATE, -1);
		return cal.getTime();
	}

public User findByUsername(String username) {
	// TODO Auto-generated method stub
	return userRepository.findByUsername(username);
}


public void incrementFailedLoginAttempts(User user) {
    if (user.getLoginAttempt() == null) {
        user.setLoginAttempt(0);
    }
    user.setLoginAttempt(user.getLoginAttempt() + 1);
    user.setLastFailedLoginAttempt(LocalDateTime.now());
    userRepository.save(user);
}
public void resetFailedLoginAttempts(User user) {
    user.setLoginAttempt(0);
    user.setLastFailedLoginAttempt(null);
    userRepository.save(user);
}

public void unlockAccount(User user) {
    resetFailedLoginAttempts(user);
}

public List<User> getManager(Long company_id) {
	return  userRepository.getUserById(company_id);
	
}

public List<User> getInternshipLead(Long internship_lead_id) {
	return  userRepository.getUserById(internship_lead_id);

}

public List<User> getHod(Long headId) {
	return  userRepository.getUserById(headId);
	
}

public  List<User> getDeptIncharge(Long iii_dept_co_id) {
	return  userRepository.getUserById(iii_dept_co_id);
	
}

public List<User> getHR(Long company_id) {
	
	Company company = componyService.getCompany(company_id);
	
	System.out.println("Companyyyyyyy"+company);
	return  userRepository.findByEmail(ProjectConstants.hr, company.getEmail_id());
}

public List<User> findByEmailAndRoleForNotification(String email_id , Long deptId) {
	// TODO Auto-generated method stub
	return userRepository.findByEmailIdCommonForNotification(email_id, deptId);
}

public Optional<User> findByEmail(String email) {
	// TODO Auto-generated method stub
	return userRepository.findByEmailAndRole2(email);
}





public User findByEmailAndRoleAndDeprt(String clgEmail, Long depart) {
	// TODO Auto-generated method stub
	return userRepository.findByEmailAndRoleAndDeprt(clgEmail,depart);
}






}
