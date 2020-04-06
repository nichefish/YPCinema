package service.member;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.validation.Errors;

import command.member.LoginCommand;
import model.DTO.AuthInfo;
import model.DTO.MemberDTO;
import repository.member.MemberRepository;

@Service
public class AuthService {
	@Autowired
	private MemberRepository memberRepository;
	@Autowired
	private BCryptPasswordEncoder bcryptPasswordEncoder;
	
	public String authenticate(LoginCommand loginCommand, HttpSession session, Errors errors,	HttpServletResponse response) {
		MemberDTO member = new MemberDTO();
		member.setM_id(loginCommand.getId());
		Cookie idStoreCookie = new Cookie("idStore", loginCommand.getId());
		Cookie adminSelectCookie = new Cookie("adminSelect", loginCommand.getAdmin());		// 자동로그인 쿠키...
		if (loginCommand.getIdStore()) {		// 자동로그인 체크되어 있으면..
			idStoreCookie.setMaxAge(60*60*24*30);	// 여기서 시간조절.. 필요에 따라 바꿔주면 된다.. 초단위...
			adminSelectCookie.setMaxAge(60*60*24*30);
		} else {
			idStoreCookie.setMaxAge(0);		// 수명을 0으로 주니까 바로 삭제된다...
			adminSelectCookie.setMaxAge(0);
		}
		response.addCookie(idStoreCookie);		// 쿠키추가..
		response.addCookie(adminSelectCookie);
		String path = "";
		member = memberRepository.selectByUserInfo(member);		// 아이디만 갖고 찾는거임...
		if (member == null || member.getJoin_ok() == null) {				// 아이디 없음
			errors.rejectValue("id","notId");
			path = "login";
		} else {
			if (bcryptPasswordEncoder.matches(loginCommand.getPass(), member.getM_pass())) {	// 패스워드 두개 비교- 맞으면-
				AuthInfo authInfo = new AuthInfo();
				authInfo.setM_id(member.getM_id());
				authInfo.setM_num(member.getM_num());
				authInfo.setM_name(member.getM_name());
				authInfo.setM_picture(member.getM_picture());
				authInfo.setM_admin(member.getM_admin());
				authInfo.setMode("0");
				Cookie autoLoginCookie = new Cookie("autoLogin", member.getM_id());		// 자동로그인 쿠키...
				autoLoginCookie.setMaxAge(60*60*24*30);
				response.addCookie(autoLoginCookie);
				session.setAttribute("authInfo", authInfo);
				path = "redirect:/main";
			} else {
				errors.rejectValue("pass","wrong");		// 비밀번호가 틀린 거-
				path = "login";
			}
		}
		return path;
	}

	public void logout(HttpSession session, HttpServletResponse response) {
		Cookie autoLoginCookie = new Cookie("autoLogin", "0");		// 세션 지우기 전에 해야된다..
		autoLoginCookie.setMaxAge(0);								// 자동로그인 쿠키 삭제... 안하면 로그아웃 안됨.. 
		response.addCookie(autoLoginCookie);
		session.invalidate();
	}

	public void changeMode(String mode, HttpSession session) {
		AuthInfo authInfo = (AuthInfo) session.getAttribute("authInfo");
		authInfo.setMode(mode);
		session.setAttribute("authInfo", authInfo);
	}
}
