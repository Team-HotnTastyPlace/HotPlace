package register.controller;

import java.util.Random;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import register.spring.AlreadyExistingMemberException;
import register.spring.MemberRegisterService;
import register.spring.RegisterRequest;
import register.spring.RegisterRequest2;
import register.spring.SendMail;
import register.validator.RegisterRequest2Validator;
import register.validator.RegisterRequestValidator;

@Controller
public class RegisterController {
	
	private SendMail sendMail;
	private MemberRegisterService memberRegisterService;
	
	public void setSendMail(SendMail sendMail) {
		this.sendMail = sendMail;
	}
	
	public void setMemberRegisterService (MemberRegisterService memberRegisterService) {
		this.memberRegisterService = memberRegisterService;
	}
	
	//주소 /register/regForm 호출시  : http://localhost:8080/email/regForm 로 호출
	
	@RequestMapping(value="/register/regForm")
	public String registerForm(HttpServletRequest request, Model model) {

		model.addAttribute("formData", new RegisterRequest());
		
		return "/register/regForm";
	}
	
	//주소 /register/mailform 호출시  : http://localhost:8080/email/main 로 호출
	
	@RequestMapping(value="/register/mailForm")
	public String mailForm() {
		
		return "/register/mailForm";
	}
	
	@RequestMapping(value="/register/mailSend")
	public String mailSend(@ModelAttribute("mf1")RegisterRequest2 req, HttpServletRequest request, Model model, Errors errors) {
		new RegisterRequest2Validator().validate(req, errors);
		if(errors.hasErrors()) {
			return "/register/mailForm";
		}
		try {
			int ran = new Random().nextInt(100000) + 100000;
			sendMail.Send(req, ran);
			model.addAttribute("email", req.getEmail());
			model.addAttribute("ran", ran);
			
			return "/register/mailForm";
		}catch(AlreadyExistingMemberException e) {
			errors.rejectValue("email", "duplicate");
			return "/register/mailForm";
		}
	}
	
	@RequestMapping(value="/register/regSuccess")
	public String regSuccess(@ModelAttribute("formData")RegisterRequest req, Errors errors, Model model) {
		new RegisterRequestValidator().validate(req, errors);
		if(errors.hasErrors()) {
			model.addAttribute("email", req.getEmail());
			return "/register/regForm";
		}
		try {
			memberRegisterService.regist(req);
			return "/register/regSuccess";
		}catch(AlreadyExistingMemberException e) {
			errors.rejectValue("name", "duplicate");
			model.addAttribute("email", req.getEmail());
			return "/register/regForm";
		}
	}

}
