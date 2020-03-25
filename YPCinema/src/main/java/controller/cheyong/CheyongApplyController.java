package controller.cheyong;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import service.cheyong.CheyongApplyService;

@Controller
public class CheyongApplyController {
	@Autowired
	CheyongApplyService cheyongApplyService;
	@RequestMapping(value="/staff_apply", method=RequestMethod.GET )
	public String staffApply(HttpSession session, Model model ) {
		cheyongApplyService.memberInfo(session, model);
		return "cheyong/staff_apply";
	}
}
