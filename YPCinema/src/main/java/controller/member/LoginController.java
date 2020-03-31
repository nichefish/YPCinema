package controller.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import command.member.LoginCommand;
import service.company.CompanyAuthService;
import service.company.CompanyLoginCookieService;
import service.member.AuthService;
import service.member.LoginCookieService;

@Controller
public class LoginController {
	@Autowired
	private LoginCookieService loginCookieService;
	@Autowired
	private CompanyLoginCookieService companyLoginCookieService;
	@Autowired
	private AuthService authService;
	@Autowired
	private CompanyAuthService companyAuthService;
	
	@RequestMapping(value="/login", method=RequestMethod.GET)
	public String login(LoginCommand loginCommand, HttpServletRequest request, HttpSession session) {
		loginCookieService.execute(request, session);
		companyLoginCookieService.execute(request, session);
		return "login";
	}
	
	@RequestMapping(value="/login", method=RequestMethod.POST)
	public String loginPro(LoginCommand loginCommand, Errors errors, HttpSession session, HttpServletResponse response) {
//		new LoginCommandValidator().validate(loginCommand, errors);
//		if (errors.hasErrors()) {
//			return "main";
//		}
		if (loginCommand.getAdmin().equals("0")) {
			authService.authenticate(loginCommand, session, errors, response);
		} else {
			companyAuthService.authenticate(loginCommand, session, errors, response);
		}
		
		System.out.println("로그인!!!");
		return "redirect:/main";
	}
	
	@RequestMapping(value="/changeMode", method=RequestMethod.POST)
	public String changeMode(@RequestParam("mode") String mode, HttpSession session) {
		authService.changeMode(mode, session);
		System.out.println("mode: " + mode);
		return "redirect:/main";
	}
	
	@RequestMapping("/logout")
	public String logout(HttpSession session, HttpServletResponse response) {
		if (session.getAttribute("authInfo") != null) {
			authService.logout(session, response);
		} else if (session.getAttribute("companyAuthInfo") != null) {
			companyAuthService.companyLogout(session, response);
		}
		return "redirect:/main";
	}
}
