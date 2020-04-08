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
	@RequestMapping(value="/staff_applyModify", method=RequestMethod.GET)
	public String applyModify(@RequestParam(value="hiddenRNum")String rNum, @RequestParam(value="hiddenIdNum")String mNum, Model model) {
		cheyongApplyService.myApplyModify(rNum, mNum, model);
		return "cheyong/staff_applyModify";
	}
	@RequestMapping(value="/staff_applyModify", method=RequestMethod.POST)
	public String applyModifyPost(CheyongApplyCommand cheyongApplyCommand) {
		cheyongApplyService.modifyApply(cheyongApplyCommand);
		return "redirect:staff_applyDetail?r_num="+cheyongApplyCommand.getR_num();
	}
	// Apply 삭제
	@RequestMapping("/staff_applyDelete")
	public String applyDelete(@RequestParam(value="hiddenRNum")String r_num) {
		cheyongApplyService.deleteApply(r_num);
		return "redirect:member_myApply";
	}
	// 관리자 (공고지원현황목록)
	@RequestMapping("/staff_applyList")
	public String applyLists(Model model) {
		cheyongApplyService.selectApplyLists(model);
		return "admin/staff_applyList";
	}
	// 관리자(지원서 '열람함'으로 바꾸기)
	public String readApply(@RequestParam(value="r_num")String r_num) {
		cheyongApplyService.readBtn(r_num);
		return "redirect:staff_readApply?r_num="+ r_num;
	}
}
