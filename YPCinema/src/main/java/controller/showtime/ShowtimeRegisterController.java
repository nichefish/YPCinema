package controller.showtime;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import command.showtime.ShowtimeCommand;
import service.showtime.ShowtimeRegisterService;

@Controller
public class ShowtimeRegisterController {
	@Autowired
	private ShowtimeRegisterService showtimeRegisterService;
	
	@RequestMapping(value="/showtime/register", method=RequestMethod.GET)
	public String showtimeRegisterForm(ShowtimeCommand showtimeCommand) {
		return "movie/showtime_add";
	}
	
	@RequestMapping(value="/showtime/register", method=RequestMethod.POST)
	public String showtimeRegisterAction(ShowtimeCommand showtimeCommand) {
		showtimeRegisterService.insertShowtime(showtimeCommand);
		return "movie/showtime_add";
	}
}
