package controller.screen;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import command.screen.ScreenCommand;
import service.admin.TheaterAddService;
import service.screen.ScreenDetailService;
import service.screen.ScreenModifyService;

@Controller
public class ScreenModifyController {
	@Autowired
	private ScreenDetailService screenDetailService;
	@Autowired
	private ScreenModifyService screenModifyService;
	@Autowired
	private TheaterAddService theaterAddService;
	
	@RequestMapping(value="/theater/modifyScreen", method=RequestMethod.GET)
	public String screenModify(@RequestParam("num") String screen_num, Model model, ScreenCommand screenCommand) {
		screenDetailService.getScreenByInfo(screen_num, model);
		return "movie/screen_modify";
	}
	
	@RequestMapping(value="/theater/modifyScreen", method=RequestMethod.POST)
	public String screenModifyAction(ScreenCommand screenCommand) {
		screenModifyService.modifyScreen(screenCommand);
		System.out.println("da123: " + screenCommand.getTheater_num());
		theaterAddService.modifyRating(screenCommand.getTheater_num());
		return "redirect:/theater/detailScreen?num=" + screenCommand.getScreen_num();
	}
}