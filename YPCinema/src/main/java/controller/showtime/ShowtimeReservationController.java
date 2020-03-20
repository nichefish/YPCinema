package controller.showtime;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import service.showtime.ShowtimeDetailService;
import service.showtime.ShowtimeListService;
import service.showtime.ShowtimeReservationService;

@Controller
public class ShowtimeReservationController {
	@Autowired
	private ShowtimeDetailService showtimeDetailService;
	
//	@Autowired
//	private ShowtimeReservationService showtimeReservationService;
	
	@RequestMapping(value="/showtime/reservation", method=RequestMethod.POST)
	public String showReserveAction(@RequestParam("num") String show_num, Model model) {
		showtimeDetailService.selectByShowId(show_num, model);
		return "movie/movie_reserve_seatview";
	}
}