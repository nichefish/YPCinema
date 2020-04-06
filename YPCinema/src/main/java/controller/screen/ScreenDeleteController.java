package controller.screen;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import command.screen.ScreenCommand;
import model.DTO.ScreenDTO;
import service.admin.TheaterAddService;
import service.screen.ScreenDeleteService;
import service.screen.ScreenDetailService;

@Controller
public class ScreenDeleteController {
	@Autowired
	private TheaterAddService theaterAddService;
	@Autowired
	private ScreenDetailService screenDetailService;
	@Autowired
	private ScreenDeleteService screenDeleteService;
	
	@RequestMapping(value="/theater/deleteScreen", method=RequestMethod.GET)
	public String screenDelete(@RequestParam("num") String screen_num, ScreenCommand screenCommand, Model model) {
		ScreenDTO screen = screenDetailService.getScreenByInfo(screen_num, model);
		screenDeleteService.deleteScreen(screen_num);
		theaterAddService.modifyRating(screen.getTheater_num());
		return "redirect:/theater/detail?num=" + screen.getTheater_num();
	}
}
