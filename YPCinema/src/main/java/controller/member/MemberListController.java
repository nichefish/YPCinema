package controller.member;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import service.member.MemberListService;

@Controller
public class MemberListController {
	@Autowired
	private MemberListService memberListService;
	
	@RequestMapping("/member/list")
	public String memberList(Model model) {
		memberListService.selectMemberAll(model);
		return "member/member_list";
	}
}
