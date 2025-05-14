package com.skillpilots.service;

import jakarta.mail.BodyPart;
import jakarta.mail.MessagingException;

public interface UserBeanService {

	

	public int sendMimeMail(String from,String to,String subject,BodyPart part1, BodyPart part2) throws MessagingException;
	
	int sendMimeMail(String from,String to,String subject,String msg)throws MessagingException;

	
		
}
