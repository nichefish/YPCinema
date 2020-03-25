package controller.cheyong;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class CheyongApplyController {
	@RequestMapping("/staff_apply")
	public String staffApply() {
		return "cheyong/staff_apply";
	}
}
