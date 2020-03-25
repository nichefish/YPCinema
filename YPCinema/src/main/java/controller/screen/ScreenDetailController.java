package controller.screen;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import service.screen.ScreenDetailService;

@Controller
public class ScreenDetailController {
	@Autowired
	private ScreenDetailService screenDetailService;
	
	@RequestMapping("/theater/detailScreen")
	public String screenDetail(@RequestParam("num") String screen_num, Model model) {
		screenDetailService.getScreenByInfo(screen_num, model);
		return "movie/screen_detail";
	}
}