package controller.member;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import service.member.MemberListService;

@Controller
public class MemberListController {
	@Autowired
	private MemberListService memberListService;
	
	@RequestMapping("/memberList")
	public String memberList(Model model) {
//		if (search_value != null && search_type != null) {
//			memberListService.searchMember(search_type, search_value, model);
//		} else {
			memberListService.selectMemberAll(model);
//		}
//			@RequestParam(value="search_value", required=false) String search_value, @RequestParam(value="search_type", required=false) String search_type, 
		return "member/member_list";
	}
	@RequestMapping("/searchUser")
	public String searchUser(Model model,@RequestParam(value="search_type")String searchType,@RequestParam(value="search_value")String searchValue) {
		memberListService.searchMember(model, searchType, searchValue);
		return "member/searchUser";
	}
}
