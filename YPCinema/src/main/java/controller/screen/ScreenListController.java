package controller.screen;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import service.screen.ScreenListService;

@Controller
public class ScreenListController {
	@Autowired
	private ScreenListService screenListService;
	
	@RequestMapping(value="theater/listScreen", method=RequestMethod.GET)
	public String screenList(@RequestParam("num") String theater_num, Model model) {
		screenListService.listScreen(theater_num, model);
		return "movie/theater_detail";
	}
}
