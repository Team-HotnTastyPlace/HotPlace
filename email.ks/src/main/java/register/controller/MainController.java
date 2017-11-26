package register.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MainController {

	//주소 /main 호출시 :http://localhost:8080/email/main 로 호출
	@RequestMapping("/main")
	public String main() {
		return "main";
	}
	
	//주소 /logout 호출시 :http://localhost:8080/email/main 로 호출
	@RequestMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/main";
	}

}
