package mail.controller;

import java.util.Random;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;

import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MailController {

	private JavaMailSender mailSender;
	
	public void setMailSender(JavaMailSender mailSender) {
		this.mailSender = mailSender;
	}

	@RequestMapping(value="/mail/mailForm")
	public String mailForm() {
		return "/mail/mailForm";
	}
	
	@RequestMapping(value="/mail/mailSending")
	public String mailSending(HttpServletRequest request, Model model) {
		String setfrom = "itbank.1111@gmail.com";
		String tomail = request.getParameter("tomail");
		String title = "인증번호";
		String content = "인증번호 : ";
		int ran = new Random().nextInt(100000) + 10000; // 10000 ~ 99999
	
		try{
			MimeMessage message = mailSender.createMimeMessage();
			MimeMessageHelper messageHelper = 
					new MimeMessageHelper(message, true, "utf-8");
			
			messageHelper.setFrom(setfrom);  // 보내는사람 생략하거나 하면 정상작동을 안함
			messageHelper.setTo(tomail);     // 받는사람 이메일
			messageHelper.setSubject(title); // 메일제목은 생략이 가능하다
			messageHelper.setText(content + ran);  // 메일 내용
			model.addAttribute("tomail", tomail);
			mailSender.send(message);
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return "redirect:/mail/mailForm";
	
	}
}
