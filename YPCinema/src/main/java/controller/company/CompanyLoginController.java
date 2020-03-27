package controller.company;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import command.company.CompanyLoginCommand;
import service.company.CompanyAuthService;
import service.company.CompanyLoginCookieService;


@Controller
public class CompanyLoginController {
	@Autowired
	private CompanyLoginCookieService companyLoginCookieService;
	@Autowired
	private CompanyAuthService companyAuthService;
	
	@RequestMapping(value="/companyLogin", method=RequestMethod.GET)
	public String login(CompanyLoginCommand companyLoginCommand, HttpServletRequest request, HttpSession session) {
		companyLoginCookieService.execute(request, session);
		return "companyLogin";
	}
	
	@RequestMapping(value="/companyLogin", method=RequestMethod.POST)
	public String loginPro(CompanyLoginCommand companyLoginCommand, Errors errors, HttpSession session, HttpServletResponse response) {
//		new LoginCommandValidator().validate(loginCommand, errors);
//		if (errors.hasErrors()) {
//			return "main";
//		}
		companyAuthService.authenticate(companyLoginCommand, session, errors, response);
		System.out.println("로그인!!!");
		return "redirect:/main";
	}
	
	@RequestMapping("/companyLogout")
	public String companyLogout(HttpSession session, HttpServletResponse response) {
		companyAuthService.companyLogout(session, response);
		return "redirect:/main";
	}
}
