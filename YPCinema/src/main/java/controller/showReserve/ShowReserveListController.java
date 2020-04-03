package controller.showReserve;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import command.showtime.ShowReserveCommand;
import command.showtime.ShowtimeCommand;
import model.DTO.ScreenDTO;
import model.DTO.ShowReserveDTO;
import model.DTO.ShowtimeDTO;
import service.screen.ScreenDetailService;
import service.showReserve.ShowReserveListService;
import service.showReserve.ShowReserveModifyService;
import service.showReserve.ShowReserveRegisterService;
import service.showtime.ShowtimeDetailService;

@Controller
public class ShowReserveListController {
	@Autowired
	private ShowReserveListService showReserveListService;
	@Autowired
	private ShowtimeDetailService showtimeDetailService;
	@Autowired
	private ScreenDetailService screenDetailService;
	@Autowired
	private ShowReserveRegisterService showReserveRegisterService;
	@Autowired
	private ShowReserveModifyService showReserveModifyService;
	
	@RequestMapping("/showReserve/check")
	public String showReserveCheck(ShowtimeCommand showtimeCommand, Model model) {
		showReserveListService.selectShowReserveListByShowInfo(showtimeCommand, model);
		return "movie/show_reserve_list";
	}
	
	@RequestMapping(value="/showReserve/detail", method=RequestMethod.GET)
	public String showReserveCheckDetail(@RequestParam("payment") String payment_num, ShowReserveCommand showReserveCommand, Model model) {
		List<ShowReserveDTO> lists = showReserveListService.selectShowReserveListByPaymentNum(payment_num, model);
		ShowtimeDTO showtime = showtimeDetailService.selectByShowId(lists.get(0).getShow_num(), model);
		ScreenDTO screen = screenDetailService.getScreenByInfo(showtime.getScreen_num(), model);
		showReserveRegisterService.setReserveInfo(showReserveCommand, lists.get(0).getShow_num(), screen.getTheater_num(), screen.getScreen_num(), model);
		return "movie/show_reserve_detail_seatview";
	}
	
	@RequestMapping(value="/showReserve/detail", method=RequestMethod.POST)
	public String showReserveCheckChange(@RequestParam("payment") String payment_num, ShowReserveCommand showReserveCommand, Model model) {
		showReserveModifyService.setShowReserveStatus();
		return "redirect:/showReserve/detail";
	}
	
}
