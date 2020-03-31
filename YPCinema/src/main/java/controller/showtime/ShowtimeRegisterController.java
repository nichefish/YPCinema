package controller.showtime;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import command.showtime.ShowtimeCommand;
import service.admin.JicmuListService;
import service.movie.MovieDetailService;
import service.screen.ScreenListService;
import service.showtime.ShowtimeRegisterService;

@Controller
public class ShowtimeRegisterController {
	@Autowired
	private JicmuListService jicmuListService;
	@Autowired
	private ScreenListService screenListService;
	@Autowired
	private MovieDetailService movieDetailService;
	@Autowired
	private ShowtimeRegisterService showtimeRegisterService;
	
	@RequestMapping(value="/showtime/register", method=RequestMethod.GET)
	public String showtimeRegisterForm(@RequestParam(value="theater", required=false) String theater_num, @RequestParam(value="screen", required=false) String screen_num, @RequestParam(value="movie", required=false) String movie_num, ShowtimeCommand showtimeCommand, Model model) {
		jicmuListService.showList(model);
//		if (theater_num != null) {
//			screenListService.listScreen(theater_num, model);
//		}
		showtimeCommand.setTheater_num(theater_num);
		showtimeCommand.setScreen_num(screen_num);
		showtimeCommand.setMovie_num(movie_num);
		return "movie/showtime_add";
	}
	
	@RequestMapping("/showtime/registerB")
	public String showtimeRegisterB(@RequestParam(value="theater", required=false) String theater_num, ShowtimeCommand showtimeCommand, Model model) {
		if (theater_num != null) {
			screenListService.listScreen(theater_num, model);
		}
		return "movie/showtime_addB";
	}
	
	@RequestMapping(value="/showtime/register", method=RequestMethod.POST)
	public String showtimeRegisterAction(ShowtimeCommand showtimeCommand, Model model) {
		movieDetailService.selectByMovieNum(showtimeCommand.getMovie_num(), model);
		showtimeRegisterService.insertShowtime(showtimeCommand);
		return "redirect:/showtime/list";
	}
}
