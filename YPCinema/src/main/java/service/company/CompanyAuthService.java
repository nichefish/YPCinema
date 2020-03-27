package service.company;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.validation.Errors;

import command.company.CompanyLoginCommand;
import model.DTO.CompanyAuthInfo;
import model.DTO.CompanyDTO;
import repository.company.CompanyRepository;

@Service
public class CompanyAuthService {
	@Autowired
	private CompanyRepository companyRepository;
	@Autowired
	private BCryptPasswordEncoder bcryptPasswordEncoder;
	
	public void authenticate(CompanyLoginCommand companyLoginCommand, HttpSession session, Errors errors,	HttpServletResponse response) {
		CompanyDTO company = new CompanyDTO();
		company.setC_id(companyLoginCommand.getId());
		Cookie storeIdCookie = new Cookie("storeId", companyLoginCommand.getId());
		if (companyLoginCommand.getIdStore()) {		// 쿠키추가..
			storeIdCookie.setMaxAge(60*60*24*30);	// 여기서 시간조절.. 필요에 따라 바꿔주면 된다.. 초단위...
			// 여기서 조건 줘가지고. 한참 나중에 와도 쿠키만 있으면 자동으로 체크되어 있게..?
		} else {
			storeIdCookie.setMaxAge(0);		// 수명을 0으로 주니까 바로 삭제된다...
		}
		response.addCookie(storeIdCookie);		// 로그인 시도시 아이디저장 쿠키 추가-
		
		company=companyRepository.selectByUserInfo(company);		// 아이디만 갖고 찾는거임...
		if (company == null) {				// 아이디 없음
			System.out.println("아이디 없음!");
//			errors.rejectValue("id","notId");
		} else {
			if (bcryptPasswordEncoder.matches(companyLoginCommand.getPass() , company.getC_pass())) {	// 패스워드 두개 비교- 맞으면-
				CompanyAuthInfo companyAuthInfo = new CompanyAuthInfo();
				companyAuthInfo.setC_id(company.getC_id());
				companyAuthInfo.setC_num(company.getC_num());
				companyAuthInfo.setC_name(company.getC_name());
				companyAuthInfo.setC_picture(company.getC_picture());
				companyAuthInfo.setC_admin(company.getC_admin());
				companyAuthInfo.setMode(company.getC_admin());
				Cookie autoLoginCookie = new Cookie("autoLogin", company.getC_id());		// 자동로그인 쿠키...
				response.addCookie(autoLoginCookie);
				Cookie adminSelectCookie = new Cookie("adminSelect", companyLoginCommand.getAdmin());		// 자동로그인 쿠키...
				response.addCookie(adminSelectCookie);
				
				session.setAttribute("companyAuthInfo", companyAuthInfo);
			} else {
//				errors.rejectValue("pw","wrong");		// 비밀번호가 틀린 거-
			}
		}
	}

	public void companyLogout(HttpSession session, HttpServletResponse response) {
		Cookie autoLoginCookie = new Cookie("autoLogin", "0");		// 세션 지우기 전에 해야된다..
		autoLoginCookie.setMaxAge(0);								// 자동로그인 쿠키 삭제... 안하면 로그아웃 안됨.. 
		response.addCookie(autoLoginCookie);
		session.invalidate();
	}
}
