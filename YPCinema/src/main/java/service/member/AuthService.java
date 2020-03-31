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
	
	public void authenticate(LoginCommand loginCommand, HttpSession session, Errors errors,	HttpServletResponse response) {
		MemberDTO member = new MemberDTO();
		member.setM_id(loginCommand.getId());
		Cookie storeIdCookie = new Cookie("storeId", loginCommand.getId());
		if (loginCommand.getIdStore()) {		// 쿠키추가..
			storeIdCookie.setMaxAge(60*60*24*30);	// 여기서 시간조절.. 필요에 따라 바꿔주면 된다.. 초단위...
			// 여기서 조건 줘가지고. 한참 나중에 와도 쿠키만 있으면 자동으로 체크되어 있게..?
		} else {
			storeIdCookie.setMaxAge(0);		// 수명을 0으로 주니까 바로 삭제된다...
		}
		response.addCookie(storeIdCookie);		// 로그인 시도시 아이디저장 쿠키 추가-
		
		member=memberRepository.selectByUserInfo(member);		// 아이디만 갖고 찾는거임...
		if (member == null) {				// 아이디 없음
			System.out.println("아이디 없음!");
//			errors.rejectValue("id","notId");
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
				response.addCookie(autoLoginCookie);
				Cookie adminSelectCookie = new Cookie("adminSelect", loginCommand.getAdmin());		// 자동로그인 쿠키...
				response.addCookie(adminSelectCookie);
				
				session.setAttribute("authInfo", authInfo);
			} else {
//				errors.rejectValue("pw","wrong");		// 비밀번호가 틀린 거-
			}
		}
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
