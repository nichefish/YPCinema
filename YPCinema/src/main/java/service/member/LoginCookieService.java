package service.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Cookie;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import command.member.LoginCommand;
import model.DTO.AuthInfo;
import model.DTO.MemberDTO;
import repository.member.MemberRepository;

@Service
public class LoginCookieService {
	@Autowired
	private MemberRepository memberRepository;
	
	public void execute(LoginCommand loginCommand, HttpServletRequest request, HttpSession session) {
		Cookie[] cookies = request.getCookies();
		if (cookies != null && cookies.length > 0) {
			for (Cookie c : cookies) {
				if (c.getName().equals("idStore")) {
					loginCommand.setId(c.getValue());
					loginCommand.setIdStore(true);
				}
				if (c.getName().equals("adminSelect")) {
					request.setAttribute("admin", c.getValue());
				}
				if (c.getName().equals("autoLogin")) {
					MemberDTO member = new MemberDTO();
					member.setM_id(c.getValue());
					member = memberRepository.selectByUserInfo(member);
					AuthInfo authInfo = new AuthInfo();
					authInfo.setM_id(member.getM_id());
					authInfo.setM_num(member.getM_num());
					authInfo.setM_name(member.getM_name());
					authInfo.setM_picture(member.getM_picture());
					authInfo.setM_admin(member.getM_admin());
					authInfo.setMode("0");
					session.setAttribute("authInfo", authInfo);
				}
			}
		}
	}

}
