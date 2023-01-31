package com.thisteam.muhansangsa.service;

import java.util.Random;

import javax.mail.Message.RecipientType;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.MailException;
import org.springframework.mail.MailSender;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

@Service
public class MailService {
	
	@Autowired
	private MailSender mailsender;
	private JavaMailSender emailSender;
	
	// 임시 비밀번호 
	public String ePw = createKey();
	
	public void sendEmail(String toAdderess, String fromAddress, String subject, String msgBody) {
		
		System.out.println("메일 서비스 도착ㄴ");
		
		SimpleMailMessage smm = new SimpleMailMessage();
		smm.setFrom(fromAddress);
		smm.setTo(toAdderess);
		smm.setSubject(subject);
		smm.setText(msgBody);
		
		mailsender.send(smm);
	}

	// 임시 비밀번호 생성 & 비밀번호 전달하기 
	
	// 임시 비밀번호 생성 
	public String createKey() {
		StringBuffer key = new StringBuffer();
		Random rnd = new Random();
		
		// 8자리의 임시 비밀번호
		for(int i = 0; i < 8; i++) {
			
			// 0 ~ 2 까지 랜덤
			int index = rnd.nextInt(3);
			
			switch (index) {
			case 0:
				// a ~ z (ex. 1 + 97 = 98 -> (char)98 = 'b')
				key.append((char) ((int) (rnd.nextInt(26)) + 97 ));
				break;
			case 1:
				// A ~ Z
				key.append((char) ((int) (rnd.nextInt(26)) + 65 ));
				break;
			case 2:
				// 0 ~ 9
				key.append((rnd.nextInt(10)));
				break;
				
			} // switch()
			
		}// for()
		return key.toString();
	} // createKey
	
	// 임시 비밀번호 전달 이메일 내용 작성
	private MimeMessage createMessage(String to) throws Exception {
		System.out.println("보내는 대상 : " + to);
		System.out.println("임시 비밀번호 : " + ePw);
		
		MimeMessage message = emailSender.createMimeMessage();
		
		message.addRecipients(RecipientType.TO, to); // 보내는 대상
		message.setSubject("무한상사 임시 비밀번호 전송 이메일"); // 제목
		
		String msg = "";
			msg += "<div style = 'margin:20px;'>";
			msg += "<h1> 무한상사 사원등록이 완료되었습니다</h1>";
			msg += "<p>무한상사 로그인 시 하단의 임시 비밀번호를 사용하여 주시기 바랍니다.<br>"
					+ "비밀번호 변경은 마이페이지 내에서 가능합니다. 문의사항은 거절합니다.<br>"
					+ "감사합니다</p><br>";
			msg += "<div align='center' style='border:1px solid black; font-family:verdana';>";
	        msg += "<h3 style='color:blue;'>임시 비밀번호</h3>";
	        msg += "<div style='font-size:130%'>";
	        msg += "CODE : <strong>";
	        msg += ePw +"</strong><div><br/> ";
	        msg += "</div>";
	        message.setText(msg, "utf-8", "html");//내용
	        message.setFrom(new InternetAddress("miju.kim.kr@gmail.com","MuhanSangsa"));//보내는 사람
		
	        return message;
	        
	} // createMessage
	
	public void sendSimpleMessage(String to)throws Exception {
		System.out.println("메일 서비스 도착ㄴ");
		MimeMessage message = createMessage(to);
		
		try {
			emailSender.send(message);
		} catch (MailException e) {
			e.printStackTrace();
			throw new IllegalAccessException();
		}
		
	}
	
	
	
}
