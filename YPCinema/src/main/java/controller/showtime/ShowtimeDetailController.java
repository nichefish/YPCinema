package controller.showtime;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import service.showtime.ShowtimeDetailService;

@Controller
public class ShowtimeDetailController {
	@Autowired
	private ShowtimeDetailService showtimeDetailService;
	
	@RequestMapping(value="/showtime/detail", method=RequestMethod.POST)
	public String showDetail(@RequestParam("num") String show_num, Model model) {
		showtimeDetailService.selectByShowId(show_num, model);
		return "movie/movie_reserve_seatview";
	}
}
