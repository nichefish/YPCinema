package controller.member;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import command.member.MemberCommand;
import service.member.MemberJoinService;

@Controller

public class MemberJoinController {
	@Autowired
	private MemberJoinService memberJoinService;
	
	@RequestMapping(value="/register", method=RequestMethod.GET)
	public String memberJoinAgree() {
		return "member/member_yacgan";
	}
	
	@RequestMapping(value="/register", method=RequestMethod.POST)
	public String memberJoinForm(MemberCommand memberCommand) {
		return "member/member_join";
	}
	
	@RequestMapping(value="/memberJoinAction", method=RequestMethod.POST)
	public String memberJoinAction(MemberCommand memberCommand, Errors errors) {
		memberJoinService.memberJoin(memberCommand, errors);
		return "member/member_welcome";
	}
	
	
	
	
	
}
