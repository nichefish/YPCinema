package service.member;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.sun.xml.internal.bind.v2.model.core.ID;

import model.DTO.AuthInfo;
import model.DTO.MemberDTO;
import repository.member.MemberRepository;

@Service
public class MemberDetailService {
	@Autowired
	private MemberRepository memberRepository;
	
	public void memberMypage(HttpSession session, Model model) {
		MemberDTO member = new MemberDTO();
		member.setM_id(((AuthInfo)(session.getAttribute("authInfo"))).getM_id());
		model.addAttribute("memberCommand", memberRepository.selectByUserInfo(member));
	}

	public void memberDetail(String m_num, Model model) {
		MemberDTO member = new MemberDTO();
		member.setM_num(m_num);
		model.addAttribute("memberCommand", memberRepository.selectByUserInfo(member));
	}
}
