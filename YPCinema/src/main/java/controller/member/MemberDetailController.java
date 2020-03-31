package controller.member;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import model.DTO.AuthInfo;
import model.DTO.MemberDTO;
import service.member.MemberDetailService;

@Controller
public class MemberDetailController {
	@Autowired
	private MemberDetailService memberDetailService;
	
	@RequestMapping("/myPage")
	public String memberMyPage(HttpSession session, Model model) {
		memberDetailService.memberMypage(session, model);
		return "member/member_mypage";
	}
	
	@RequestMapping("/member/detail")
	public String memberDetail(@RequestParam("num") String m_num, Model model) {
		memberDetailService.memberDetail(m_num, model);
		return "member/member_detail";
	}
}
