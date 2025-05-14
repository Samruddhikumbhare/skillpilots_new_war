package com.skillpilots.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.scheduling.annotation.Async;
import org.springframework.scheduling.annotation.EnableAsync;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import com.skillpilots.model.User;
import com.skillpilots.repository.UserRepository;
import com.skillpilots.utility.ProjectConstants;

import jakarta.mail.MessagingException;
import jakarta.mail.internet.MimeMessage;
@Component
@EnableAsync
public class EmailService {

	@Autowired
	private UserRepository repository;
	@Autowired
	private UserService userService;
	@Autowired 
	private JavaMailSender javaMailSender;
	
	@Scheduled(cron = "0 0 16 ? * FRI", zone = "Asia/Kolkata")
    public void sendScheduledEmail() {
		
		String mail_body_weekly_stats_report = 
			    "<h1 style=\"font-size:45px; margin:20px; text-align:center; color:#1974c3;\">Welcome to SkillPilots!</h1>" +
			    
			    "<p style=\"text-align:center; font-size:16px; color:#333;\">Please log in to view your complete weekly updates and insights.<br>" +
			    "Click the button below to access your dashboard:</p>" +
			    
			    "<div style=\"text-align:center; margin-top:20px;\">" +
			    "<a href=\"https://www.skillpilots.com\" style=\"background-color:#1974c3; color:white; padding:10px 20px; text-decoration:none; border-radius:5px;\">Visit Dashboard</a>" +
			    "</div>" +
			    
			    ProjectConstants.mail_footer;

       
		List<User> user = repository.getUserByManger();
		for(User u: user) {
	        userService.sendVerificationEmail(u.getEmail(), "Weekly Status Report!", mail_body_weekly_stats_report);

		}
		
        System.out.println("Scheduled email sent every Friday at 4 PM IST!");
    }
	
	@Async
	public void sendVerificationEmail(String toEmail, String subject, String content) {

        try {
            MimeMessage message = javaMailSender.createMimeMessage();
            MimeMessageHelper helper = new MimeMessageHelper(message, true);
            helper.setTo(toEmail);
            helper.setSubject(subject);

            String emailContent = content ;

            helper.setText(emailContent, true);
         System.out.println("Email Send to {}"+ toEmail);
            javaMailSender.send(message);
        } catch (MessagingException e) {
            e.printStackTrace();
        }
    }
	
	
}
