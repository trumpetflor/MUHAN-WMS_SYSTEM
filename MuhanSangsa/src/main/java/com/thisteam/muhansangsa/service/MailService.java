package com.thisteam.muhansangsa.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.MailSender;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.stereotype.Service;

@Service
public class MailService {
	
	@Autowired
	private MailSender mailSender;
	
	public void sendEmail(String emp_email, String addr, String subject, String body) {
		
		SimpleMailMessage smm = new SimpleMailMessage();
		smm.setFrom(addr);
		smm.setTo(emp_email);
		smm.setSubject(subject);
		smm.setText(body);
		
		mailSender.send(smm);
		
		
	}

}
