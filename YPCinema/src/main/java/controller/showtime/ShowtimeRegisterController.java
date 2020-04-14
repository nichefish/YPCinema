package controller.showtime;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import command.showtime.ShowtimeCommand;
import model.DTO.MovieDTO;
import model.DTO.ScreenDTO;
import model.DTO.TheaterAddDTO;
import service.admin.JicmuListService;
import service.admin.TheaterAddService;
import service.movie.MovieDetailService;
import service.movie.MovieListService;
import service.screen.ScreenDetailService;
import service.screen.ScreenListService;
import service.showtime.ShowtimeDetailService;
import service.showtime.ShowtimeRegisterService;
import validator.MemberCommandValidator;
import validator.ShowtimeCommandValidator;

@Controller
public class ShowtimeRegisterController {
	@Autowired
	private JicmuListService jicmuListService;
	@Autowired
	private TheaterAddService theaterAddService;
	@Autowired
	private ScreenListService screenListService;
	@Autowired
	private ScreenDetailService screenDetailService;
	@Autowired
	private MovieDetailService movieDetailService;
	@Autowired
	private ShowtimeRegisterService showtimeRegisterService;
	@Autowired
	private MovieListService movieListService;
	@Autowired
	private ShowtimeDetailService showtimeDetailService;
	
	@RequestMapping(value="/showtime/register", method=RequestMethod.GET)
	public String showtimeRegisterForm(@RequestParam(value="theater", required=false) String theater_num, @RequestParam(value="screen", required=false) String screen_num, @RequestParam(value="movie", required=false) String movie_num, ShowtimeCommand showtimeCommand, Model model) {
		jicmuListService.showList(model);
		if (theater_num != null) {
			theaterAddService.execute(theater_num, model);
		}
		showtimeCommand.setTheater_num(theater_num);
		showtimeCommand.setScreen_num(screen_num);
		showtimeCommand.setMovie_num(movie_num);
		return "movie/showtime_add";
	}
	
	@RequestMapping("/showtime/registerB")
	public String showtimeRegisterB(@RequestParam(value="theater", required=false) String theater_num, ShowtimeCommand showtimeCommand, Model model) {
		screenListService.listScreen(theater_num, model);
		return "movie/showtime_addB";
	}
	
	@RequestMapping("/showtime/registerC")
	public String showtimeRegisterC(@RequestParam(value="theater", required=false) String theater_num, @RequestParam(value="screen", required=false) String screen_num, ShowtimeCommand showtimeCommand, Model model) {
		TheaterAddDTO theater = theaterAddService.execute(theater_num, model);
		ScreenDTO screen = screenDetailService.getScreenByInfo(screen_num, model);
		movieListService.selectMovieByRating(theater, screen, model);
		return "movie/showtime_addC";
	}
	
	@RequestMapping("/showtime/registerD")
	public String showtimeRegisterD(@RequestParam(value="theater", required=false) String theater_num, @RequestParam(value="screen", required=false) String screen_num, @RequestParam(value="movie", required=false) String movie_num, ShowtimeCommand showtimeCommand, Model model) {
		TheaterAddDTO theater = theaterAddService.execute(theater_num, model);
		ScreenDTO screen = screenDetailService.getScreenByInfo(screen_num, model);
		MovieDTO movie = movieDetailService.selectByMovieNum(movie_num, model);
		return "movie/showtime_addD";
	}
	
	@RequestMapping("/showtime/registerE")
	public String showtimeRegisterE(@RequestParam(value="theater", required=false) String theater_num, @RequestParam(value="screen", required=false) String screen_num, @RequestParam(value="movie", required=false) String movie_num, @RequestParam(value="date", required=false) String date, ShowtimeCommand showtimeCommand, Model model) {
		MovieDTO movie = movieDetailService.selectByMovieNum(movie_num, model);
		showtimeDetailService.selectEarliestShowByDate(screen_num, date, model);
		return "movie/showtime_addE";
	}
	
	@RequestMapping(value="/showtime/register", method=RequestMethod.POST)
	public String showtimeRegisterAction(ShowtimeCommand showtimeCommand, Model model, Errors errors) {
		new ShowtimeCommandValidator().validate(showtimeCommand, errors);
		if (errors.hasErrors()) {
			jicmuListService.showList(model);
			return "movie/showtime_add";
		}
		movieDetailService.selectByMovieNum(showtimeCommand.getMovie_num(), model);
		showtimeRegisterService.insertShowtime(showtimeCommand);
		return "redirect:/showtime/list";
	}
}
