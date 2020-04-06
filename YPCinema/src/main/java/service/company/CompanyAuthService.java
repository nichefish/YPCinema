package service.company;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.validation.Errors;

import command.company.CompanyLoginCommand;
import command.member.LoginCommand;
import model.DTO.CompanyAuthInfo;
import model.DTO.CompanyDTO;
import repository.company.CompanyRepository;

@Service
public class CompanyAuthService {
	@Autowired
	private CompanyRepository companyRepository;
	@Autowired
	private BCryptPasswordEncoder bcryptPasswordEncoder;
	
	public String authenticate(LoginCommand loginCommand, HttpSession session, Errors errors,	HttpServletResponse response) {
		CompanyDTO company = new CompanyDTO();
		company.setC_id(loginCommand.getId());
		Cookie idStoreCookie = new Cookie("idStore", loginCommand.getId());
		Cookie adminSelectCookie = new Cookie("adminSelect", loginCommand.getAdmin());		// 자동로그인 쿠키...
		if (loginCommand.getIdStore()) {		// 쿠키추가..
			idStoreCookie.setMaxAge(60*60*24*30);	// 여기서 시간조절.. 필요에 따라 바꿔주면 된다.. 초단위...
			adminSelectCookie.setMaxAge(60*60*24*30);
		} else {
			idStoreCookie.setMaxAge(0);		// 수명을 0으로 주니까 바로 삭제된다...
			adminSelectCookie.setMaxAge(0);
		}
		response.addCookie(idStoreCookie);		// 쿠키추가..
		response.addCookie(adminSelectCookie);
		String path = "";
		company = companyRepository.selectByUserInfo(company);		// 아이디만 갖고 찾는거임...
		if (company == null) {				// 아이디 없음
			errors.rejectValue("id","notId");
			path = "login";
		} else {
			if (bcryptPasswordEncoder.matches(loginCommand.getPass() , company.getC_pass())) {	// 패스워드 두개 비교- 맞으면-
				CompanyAuthInfo companyAuthInfo = new CompanyAuthInfo();
				companyAuthInfo.setC_id(company.getC_id());
				companyAuthInfo.setC_num(company.getC_num());
				companyAuthInfo.setC_comname(company.getC_comname());
				companyAuthInfo.setC_name(company.getC_name());
				companyAuthInfo.setC_picture(company.getC_picture());
				companyAuthInfo.setC_admin(company.getC_admin());
				companyAuthInfo.setMode(company.getC_admin());
				Cookie autoLoginCookie = new Cookie("autoLogin", company.getC_id());		// 자동로그인 쿠키...
				autoLoginCookie.setMaxAge(60*60*24*30);
				response.addCookie(autoLoginCookie);
				session.setAttribute("companyAuthInfo", companyAuthInfo);
				path = "redirect:/main";
			} else {
				errors.rejectValue("pass","wrong");		// 비밀번호가 틀린 거-
				path = "login";
			}
		}
		return path;
	}
}
