package controller.showReserve;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import command.showtime.ShowReserveCommand;
import model.DTO.ScreenDTO;
import model.DTO.ShowtimeDTO;
import service.screen.ScreenDetailService;
import service.showReserve.ShowReserveRegisterService;
import service.showtime.ShowtimeDetailService;

@Controller
public class ShowReserveRegisterController {
	@Autowired
	private ShowtimeDetailService showtimeDetailService;
	@Autowired
	private ScreenDetailService screenDetailService;
	@Autowired
	private ShowReserveRegisterService showReserveRegisterService;
	
//	@Autowired
//	private ShowtimeReservationService showtimeReservationService;
	
	@RequestMapping(value="/showtime/reservation")
	public String showReserve(@RequestParam("num") String show_num, ShowReserveCommand showReserveCommand, Model model) {
		ShowtimeDTO showtime = showtimeDetailService.selectByShowId(show_num, model);
		ScreenDTO screen = screenDetailService.getScreenByInfo(showtime.getScreen_num(), model);
		showReserveRegisterService.setReserveInfo(showReserveCommand, show_num, screen.getTheater_num(), screen.getScreen_num(), model);
		return "movie/show_reserve_seatview";
	}
	
	@RequestMapping(value="/showtime/orderList", method=RequestMethod.POST)
	public String showReservePayment(ShowReserveCommand showReserveCommand, HttpSession session, Model model) {
		showReserveRegisterService.holdReserveInSession(showReserveCommand, session);
		return "payment/order_list";
	}
}