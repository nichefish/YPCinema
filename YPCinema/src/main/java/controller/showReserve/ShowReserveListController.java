package controller.showReserve;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import command.showtime.ShowtimeCommand;
import service.showReserve.ShowReserveListService;

@Controller
public class ShowReserveListController {
	@Autowired
	private ShowReserveListService showReserveListService;
	
	@RequestMapping("/showReserve/check")
	public String showReserveCheck(ShowtimeCommand showtimeCommand, Model model) {
		showReserveListService.selectShowReserveListByShowInfo(showtimeCommand, model);
		return "movie/show_reserve_list";
	}
}
