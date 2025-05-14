package com.skillpilots.service.impl;

import java.io.UnsupportedEncodingException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

import com.skillpilots.service.UserBeanService;

import jakarta.mail.BodyPart;
import jakarta.mail.MessagingException;
import jakarta.mail.internet.InternetAddress;
import jakarta.mail.internet.MimeMessage;
import jakarta.mail.internet.MimeMultipart;
@Service
public class UserBeanServiceImpl implements UserBeanService {

	
	@Autowired
	private JavaMailSender javaMailSender;
	
	
	@Override
	public int sendMimeMail(String from, String to, String subject, BodyPart part1, BodyPart part2) {
		int status = 0;

		try {
			MimeMessage mimeMessage = javaMailSender.createMimeMessage();
			MimeMessageHelper helper = new MimeMessageHelper(mimeMessage, false, "utf-8");
			MimeMultipart multipart = new MimeMultipart("related");
			multipart.addBodyPart(part1);
			multipart.addBodyPart(part2);
			mimeMessage.setContent(multipart);
			helper.setTo(to);
			helper.setSubject(subject);
			helper.setFrom(new InternetAddress(from,from));
			javaMailSender.send(mimeMessage);
			status = 1;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return status;
}


	@Override
	public int sendMimeMail(String from, String to, String subject, String msg) throws MessagingException {
		int status = 0;
		MimeMessage mimeMessage = javaMailSender.createMimeMessage();
		MimeMessageHelper helper = new MimeMessageHelper(mimeMessage, false, "utf-8");
		mimeMessage.setContent(msg, "text/html");
		helper.setTo(to);

		helper.setSubject(subject);
		try {
			helper.setFrom(new InternetAddress(from,from));
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		try {
			javaMailSender.send(mimeMessage);
			status = 1;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return status;}}
