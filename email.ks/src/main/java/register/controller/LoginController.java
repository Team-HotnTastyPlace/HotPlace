package register.controller;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import register.spring.AuthInfo;
import register.spring.AuthService;
import register.spring.IdPasswordNotMatchingException;
import register.spring.LoginCommand;
import register.validator.LoginCommandValidator;

@Controller


@RequestMapping("/login/loginForm")
public class LoginController {
	
	//authService : ?
	
	private AuthService authService;
	
	public void setAuthService(AuthService authService) {
		this.authService = authService;
	}
	
	@RequestMapping(method=RequestMethod.GET)
	
	public String form(LoginCommand loginCommand,
			@CookieValue(value="REMEMBER", required=false)Cookie cookie) {  //쿠키값 가져오기 ? 
		if(cookie != null) {
			loginCommand.setEmail(cookie.getValue());
			loginCommand.setRememberEmail(true);
		}
		return "login/loginForm";
	}
	
	@RequestMapping(method=RequestMethod.POST)
	public String submit(LoginCommand loginCommand, Errors errors,
			HttpSession session, HttpServletResponse response,
			Model model) {
		new LoginCommandValidator().validate(loginCommand, errors);
		if(errors.hasErrors()) {
			return "login/loginForm";
		}
		try {
			AuthInfo authInfo = authService.authenticate(
							loginCommand.getEmail(),
							loginCommand.getPassword());
			
			session.setAttribute("authInfo", authInfo);
			
			Cookie rememberCookie = 
					new Cookie("REMEMBER", loginCommand.getEmail());
			rememberCookie.setPath("/");
			if(loginCommand.isRememberEmail()) {
				rememberCookie.setMaxAge(60*60*24*30);
			}else {
				rememberCookie.setMaxAge(0);
			}
			response.addCookie(rememberCookie);
			model.addAttribute("name", authInfo.getName());
			
			return "login/loginSuccess";			
		}catch(IdPasswordNotMatchingException e) {
			errors.rejectValue("password", "IdPasswordMatching");
			return "login/loginForm";
		}
	}
	

}
