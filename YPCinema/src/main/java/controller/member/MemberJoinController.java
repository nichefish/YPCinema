package controller.member;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import command.member.MemberCommand;
import command.member.YakganCommand;
import service.member.MemberJoinService;
import validator.MemberCommandValidator;
import validator.YakganValidator;

@Controller

public class MemberJoinController {
	@Autowired
	private MemberJoinService memberJoinService;
	
	@RequestMapping(value="/register", method=RequestMethod.GET)
	public String memberJoinAgree(YakganCommand yakganCommand, Errors errors) {
		return "member/member_yacgan";
	}
	
	@RequestMapping(value="/register", method=RequestMethod.POST)
	public String memberJoinForm(YakganCommand yakganCommand, Errors errors, MemberCommand memberCommand) {
		new YakganValidator().validate(yakganCommand, errors);
		if (errors.hasErrors()) {
			return "member/member_yacgan";
		}
		return "member/member_join";
	}
	
	@RequestMapping(value="/memberJoinAction", method=RequestMethod.POST)
	public String memberJoinAction(MemberCommand memberCommand, Errors errors) {
		new MemberCommandValidator().validate(memberCommand, errors);
		if (errors.hasErrors()) {
			return "member/member_join";
		}
		memberJoinService.memberJoin(memberCommand, errors);
		return "member/member_welcome";
	}
	
	
	
	
	
}
