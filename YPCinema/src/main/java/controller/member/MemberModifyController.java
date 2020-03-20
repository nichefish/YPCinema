package controller.member;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import command.member.MemberCommand;
import service.member.MemberDetailService;
import service.member.MemberModifyService;

@Controller
public class MemberModifyController {
	@Autowired
	private MemberDetailService memberDetailService;
	@Autowired
	private MemberModifyService memberModifyService;
	
	@RequestMapping(value="/myPage/modify", method=RequestMethod.GET)
	public String myModifyForm(MemberCommand memberCommand, HttpSession session, Model model) {
		memberDetailService.memberMypage(session, model);
		return "member/member_mymodify";
	}
	
	@RequestMapping(value="/myPage/modify", method=RequestMethod.POST)
	public String myModifyAction(MemberCommand memberCommand, HttpSession session, Errors errors) {
		memberModifyService.modifyMyInfo(memberCommand, session, errors);
		return "redirect:/myPage";
	}
	
	@RequestMapping(value="/member/modify", method=RequestMethod.GET)
	public String memberModifyForm(@RequestParam(value="num") String m_num, MemberCommand memberCommand, Model model) {
		memberDetailService.memberDetail(m_num, model);
		return "member/member_modify";
	}
	
	@RequestMapping(value="/member/modify", method=RequestMethod.POST)
	public String memberModifyAction(MemberCommand memberCommand, Errors errors) {
		memberModifyService.modifyMemberInfo(memberCommand, errors);
		return "redirect:/member/detail?m_num=" + memberCommand.getM_num();
	}
	
}
