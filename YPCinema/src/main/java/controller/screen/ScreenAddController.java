package controller.screen;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import command.screen.ScreenCommand;
import service.admin.JicmuListService;
import service.admin.TheaterAddService;
import service.screen.ScreenAddService;

@Controller
public class ScreenAddController {
	@Autowired
	private TheaterAddService theaterAddService;
	@Autowired
	private ScreenAddService screenAddService;
	
	@RequestMapping(value="theater/addScreen", method=RequestMethod.GET)
	public String screenAddForm(@RequestParam("num") String theater_num, ScreenCommand screenCommand, Model model) {
		theaterAddService.execute(theater_num, model);
		return "movie/screen_add";
	}
	
	@RequestMapping(value="theater/addScreen", method=RequestMethod.POST)
	public String screenAddAction(ScreenCommand screenCommand) {
		screenAddService.insertScreen(screenCommand);
		return "redirect:/theater/detail?num=" + screenCommand.getTheater_num();
	}
}
