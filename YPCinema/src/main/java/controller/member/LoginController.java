package controller.member;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import command.member.LoginCommand;
import service.member.AuthService;
import service.member.LoginCookieService;

@Controller
public class LoginController {
	@Autowired
	private LoginCookieService loginCookieService;
	@Autowired
	private AuthService authService;
	
	@RequestMapping(value="/login", method=RequestMethod.GET)
	public String login(LoginCommand loginCommand, HttpServletRequest request, HttpSession session) {
		loginCookieService.execute(request, session);
		return "login";
	}
	
	@RequestMapping(value="/login", method=RequestMethod.POST)
	public String loginPro(LoginCommand loginCommand, Errors errors, HttpSession session, HttpServletResponse response) {
//		new LoginCommandValidator().validate(loginCommand, errors);
//		if (errors.hasErrors()) {
//			return "main";
//		}
		authService.authenticate(loginCommand, session, errors, response);
		System.out.println("로그인!!!");
		return "redirect:/main";
	}
	
	@RequestMapping("/logout")
	public String logout(HttpSession session, HttpServletResponse response) {
		authService.logout(session, response);
		return "redirect:/main";
	}
}
