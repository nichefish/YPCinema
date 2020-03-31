package controller.cheyong;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import command.cheyong.CheyongApplyCommand;
import service.cheyong.CheyongApplyService;

@Controller
public class CheyongApplyController {
	@Autowired
	CheyongApplyService cheyongApplyService;
	@RequestMapping(value="/staff_apply", method=RequestMethod.GET )
	public String staffApply(HttpSession session, Model model,@RequestParam(value="che_num")String che_num) {
		cheyongApplyService.memberInfo(session, model,che_num);
		return "cheyong/staff_apply";
	}
	@RequestMapping(value="/staff_apply", method=RequestMethod.POST )
	public String staffApplyP(CheyongApplyCommand cheyongApplyCommand) {
		cheyongApplyService.staffApply(cheyongApplyCommand);
		return "redirect:member_myApply";
	}
	@RequestMapping("/member_myApply")
	public String myApply(Model model,HttpSession session) {
		cheyongApplyService.selectJiwonList_M(model,session);
		return "cheyong/member_myApply";
	}
	@RequestMapping("/staff_applyDetail")
	public String applyDetail(@RequestParam(value="r_num")String r_num,Model model) {
		cheyongApplyService.myApplyInfo(r_num,model);
		return "cheyong/staff_applyDetail";
	}
}
