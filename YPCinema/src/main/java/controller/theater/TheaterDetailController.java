package controller.theater;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import service.admin.TheaterAddService;
import service.screen.ScreenListService;

@Controller
public class TheaterDetailController {
	@Autowired
	private TheaterAddService theaterAddService;
	@Autowired
	private ScreenListService screenListService;
	
	@RequestMapping(value="/theater/detail", method=RequestMethod.GET)
	public String theaterDetail(@RequestParam("num") String theater_num, Model model) {
		theaterAddService.execute(theater_num, model);
		screenListService.listScreen(theater_num, model);
		return "movie/theater_detail";
	}
	
	@RequestMapping(value="/theater/detail", method=RequestMethod.POST)
	public String theaterModifySpecial(@RequestParam("theater_num") String theater_num, @RequestParam("theater_special") String theater_special, Model model) {
		theaterAddService.modifySpecial(theater_special);
		theaterAddService.execute(theater_num, model);
		screenListService.listScreen(theater_num, model);
		return "movie/theater_detail";
	}
}
