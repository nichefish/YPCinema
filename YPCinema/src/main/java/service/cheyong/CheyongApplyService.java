package service.cheyong;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import model.DTO.AuthInfo;
import model.DTO.MemberDTO;
import repository.member.MemberRepository;

@Service
public class CheyongApplyService {
	@Autowired
	MemberRepository memberRepository;
	public void memberInfo(HttpSession session, Model model) {
		String num = ((AuthInfo)session.getAttribute("authInfo")).getM_num();
		MemberDTO dto = memberRepository.selectUseNum(num);
		model.addAttribute("userInfo",dto);
		
		
	}
}
