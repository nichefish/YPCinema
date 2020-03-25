package controller.showtime;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import command.showtime.ShowtimeReserveCommand;
import model.DTO.ScreenDTO;
import model.DTO.ShowtimeDTO;
import service.screen.ScreenDetailService;
import service.showtime.ShowtimeReserveService;
import service.showtime.ShowtimeDetailService;

@Controller
public class ShowtimeReserveController {
	@Autowired
	private ShowtimeDetailService showtimeDetailService;
	@Autowired
	private ScreenDetailService screenDetailService;
	@Autowired
	private ShowtimeReserveService showtimeReserveService;
	
//	@Autowired
//	private ShowtimeReservationService showtimeReservationService;
	
	@RequestMapping(value="/showtime/reservation")
	public String showReserve(@RequestParam("num") String show_num, ShowtimeReserveCommand showtimeReserveCommand, Model model) {
		ShowtimeDTO showtime = showtimeDetailService.selectByShowId(show_num, model);
		ScreenDTO screen = screenDetailService.getScreenByInfo(showtime.getScreen_num(), model);
		showtimeReserveService.setReserveInfo(showtimeReserveCommand, show_num, screen.getTheater_num(), screen.getScreen_num(), model);
		return "movie/movie_reserve_seatview";
	}
	
	@RequestMapping(value="/showtime/orderList", method=RequestMethod.POST)
	public String showReservePayment(ShowtimeReserveCommand showtimeReserveCommand, HttpSession session, Model model) {
		showtimeReserveService.holdReserveInSession(showtimeReserveCommand, session);
//		showtimeReserveService.insertReserve(showtimeReserveCommand, session);
		return "payment/order_list";
	}
}