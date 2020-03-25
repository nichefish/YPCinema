package controller.showtime;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import command.showtime.ShowtimeCommand;
import service.showtime.ShowtimeListService;

@Controller
public class ShowtimeListController {
//	@Autowired
//	private TheaterListService theaeterListService;
//	@Autowired
//	private ScreenListService screenListService;
	@Autowired
	private ShowtimeListService showtimeListService;
	
	@RequestMapping("/showtime/list")
	public String showtimeList(ShowtimeCommand showtimeCommand, Model model) {
//		showtimeListService.selectAllShowtime(model);
//		showtimeListService.selectAllShowtime(model);
		if (showtimeCommand.getShow_date() != null) {
			System.out.println("날짜: " + showtimeCommand.getShow_date());
			showtimeListService.selectShowByInfo(showtimeCommand, model);
		}
		return "movie/showtime_list";
	}
}