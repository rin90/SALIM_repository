package com.salim.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.MailSender;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.salim.service.MemberService;
import com.salim.vo.Member;

@Controller
public class MailSenderController {
	
	
	//JavamailSenderImpl - 메일을 전송 처리하는 클래스
	//설정에 메일주소로 보낸다. 그러므로 여기의 from은 아무 의미 없다.
	@Autowired
	private MailSender sender;
	
	
	@RequestMapping("/sendMail.do")
	public String sendMail(String from, String to, String subject, String content){
		SimpleMailMessage message = new SimpleMailMessage();
		
//		message.setFrom(from);
		message.setTo(to); //누구에게
		message.setSubject(subject); //제목
		message.setText(from+"\n"+content); //내용
		sender.send(message); //보내는 것
		return "redirect:/free/login/list.do?page=1";
	}
}


