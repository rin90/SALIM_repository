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
	private MailSender sender; //spring설정파일에 등록한 JavamailSenderImpl을 주입 받는다.
	
	
	@RequestMapping("/sendMail.do")
	public String sendMail(String from, String to, String subject, String content){
		SimpleMailMessage message = new SimpleMailMessage();
		/*	메일을 보내기 위해 사용한 API는 javaMaileAPI입니다.

		 *  google이 제공하는 메일 서버를 사용하기 때문에 발신자를 setting하는 것은 의미가 없다. 왜냐하면 발신자는 spring-config파일에 설정한
		 *  구글 이메일로 고정되기 때문입니다. 
		 *  
		 * */
		message.setTo(to); // 사용자가 보낼 사람으로 입력한 email주소가 setting된다.
		message.setSubject(subject); // 사용자가 입력한 메일 제목이 setting된다. 
		message.setText(from+"\n"+content); //사용자가 입력한 메일 내용이 setting된다.
		sender.send(message); //google이 제공하는 메일 서버를 통해 발송된다.
		return "redirect:/free/login/list.do?page=1"; //문의하기 메일을 전송이 성공하면 게시글 목록으로 이동한다.
	}
}


