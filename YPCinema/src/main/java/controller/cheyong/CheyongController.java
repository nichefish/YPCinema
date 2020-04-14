package controller.cheyong;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import service.cheyong.CheyongService;

@Controller
public class CheyongController {
	@Autowired
	CheyongService cheyongService;
	
	@RequestMapping("/staff_postList")
	public String sPostList(Model model,HttpSession session) {
		cheyongService.selectList(model,session);
		return "cheyong/staff_postList";
	}
	
	@RequestMapping("/staff_postDetail")
	public String postDetail(Model model, @RequestParam(value="che_num")String num,HttpSession session) {
		cheyongService.selectOneList(model, num,session);
		return "cheyong/staff_postDetail";
	}

}
