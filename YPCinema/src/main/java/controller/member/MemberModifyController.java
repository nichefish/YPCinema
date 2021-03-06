package controller.member;

import javax.servlet.http.HttpServletRequest;
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
import validator.MemberCommandValidator;

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
	public String myModifyAction(MemberCommand memberCommand, HttpSession session, Errors errors, HttpServletRequest request) {
		new MemberCommandValidator().validate(memberCommand, errors);
		if (errors.hasErrors()) {
			System.out.println("@$%@#$@%#$%@#$%");
			return "member/member_mymodify";
		}
		System.out.println("modymody");
		memberModifyService.modifyMyInfo(memberCommand, session, errors, request);
		return "redirect:/myPage";
	}
	
	@RequestMapping(value="/memberModify", method=RequestMethod.GET)
	public String memberModifyForm(@RequestParam(value="num") String m_num, MemberCommand memberCommand, Model model) {
		memberDetailService.memberDetail(m_num, model);
		return "member/member_modify";
	}
	
	@RequestMapping(value="/memberModify", method=RequestMethod.POST)
	public String memberModifyAction(MemberCommand memberCommand, Errors errors) {
		memberModifyService.modifyMemberInfo(memberCommand, errors);
		return "redirect:/memberDetail?m_num=" + memberCommand.getM_num();
	}
	
}
