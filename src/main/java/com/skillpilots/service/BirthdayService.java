package com.skillpilots.service;

import java.io.File;
import java.time.LocalDate;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ClassPathResource;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;

import com.skillpilots.model.Student;
import com.skillpilots.repository.StudentRepository;
import com.skillpilots.utility.ProjectConstants;

import jakarta.mail.MessagingException;
import jakarta.mail.internet.MimeMessage;

@Service 
public class BirthdayService {
	@Autowired
	private StudentRepository studentRepository;
	
	
	
	@Autowired
	private JavaMailSender mailSender;
	
	
	
	// Runs every day at 8 AM  birthday wish msg 04/25 - shrunkhal
   // @Scheduled(cron = "0 * * * * ?") // Runs every 1 minute
    @Scheduled(cron = "0 0 8 * * ?") 
    public void sendBirthdayWishes() {
        LocalDate today = LocalDate.now();
        int month = today.getMonthValue();
        int day = today.getDayOfMonth();

        List<Student> birthdayStudents = studentRepository.findStudentsWithBirthday(month, day);

        for (Student student : birthdayStudents) {
            try {
				sendBirthdayEmail(student);
			} catch (MessagingException e) {
				e.printStackTrace();
			}
        }
    }

    private void sendBirthdayEmail(Student student) throws MessagingException {
        MimeMessage message = mailSender.createMimeMessage();
        MimeMessageHelper helper = new MimeMessageHelper(message, true);

        helper.setTo(student.getEmail_id());
        helper.setSubject(" Happy Birthday " + student.getStudent_name() + "!");

        String htmlContent = "<div style='text-align: center; font-family: Arial, sans-serif;'>"
                + "    <h1 style='color:#1974c3;'>Skill<span style='color:#01af36;'>Pilots</span></h1>"
                + "    <p style='font-size:18px; color:#414ea4;'>Happy Birthday, <strong>" + student.getStudent_name() + "</strong>! 🎂</p>"
                + "    <svg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 600 200' width='100%' height='auto'>"
                + "        <rect width='600' height='200' fill='#01af36' rx='15' ry='15'/>"
            
                + "    </svg>"
                + "    <p style='font-size:16px; color:#333;'>We are thrilled to celebrate your special day with you. "
                + "       May your birthday be filled with joy, success, and endless opportunities!</p>"
                + "    <p>Best wishes for a wonderful birthday and a successful year ahead! 🎊</p>"
                + "    <img src='cid:birthdayImage' style='width:300px; height:auto; margin-top:10px; border-radius:10px;'>"
                + "</div>";

        helper.setText(htmlContent, true);

        helper.addInline("birthdayImage", new ClassPathResource("static/style/images/birthday.png"));


        mailSender.send(message);
        System.out.println("Birthday email sent to: " + student.getEmail_id());
    }
}
