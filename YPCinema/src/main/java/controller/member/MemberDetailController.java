package controller.member;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import command.showtime.ShowtimeCommand;
import model.DTO.AuthInfo;
import model.DTO.MemberDTO;
import service.member.MemberDetailService;
import service.showReserve.ShowReserveListService;

@Controller
public class MemberDetailController {
	@Autowired
	private MemberDetailService memberDetailService;
	@Autowired
	private ShowReserveListService showReserveListService;
	
	@RequestMapping("/myPage")
	public String memberMyPage(HttpSession session, Model model) {
		if (session.getAttribute("authInfo") == null) {
			return "redirect:/login";
		}
		memberDetailService.memberMypage(session, model);
		return "member/member_mypage";
	}
	
	@RequestMapping("/myStatistic")
	public String memberStatistic(HttpSession session, Model model) {
		if (session.getAttribute("authInfo") == null) {
			return "redirect:/login";
		}
		showReserveListService.selectShowReserveListByMemberInfo(session, model);
		return "member/member_statistic";
	}
	
	@RequestMapping("/memberDetail")
	public String memberDetail(@RequestParam("num") String m_num, Model model) {
		memberDetailService.memberDetail(m_num, model);
		return "member/member_detail";
	}
	

}
