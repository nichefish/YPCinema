package controller.showtime;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import command.showtime.ShowtimeCommand;
import command.showtime.ShowtimeListCommand;
import service.admin.JicmuListService;
import service.showtime.ShowtimeListService;

@Controller
public class ShowtimeListController {
	@Autowired
	private JicmuListService jicmuListService;
	@Autowired
	private ShowtimeListService showtimeListService;
	
	@RequestMapping("/showtime/list")
	public String showtimeList(@RequestParam(value="theater", required=false) String theater_num, @RequestParam(value="movie", required=false) String movie_num, @RequestParam(value="date", required=false) String show_date, ShowtimeListCommand showtimeListCommand, Model model) {
		jicmuListService.showList(model);
		System.out.println("show date : " + show_date);
		if (show_date != null) {
			SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
			Date date;
			try {
				date = format.parse(show_date);
				showtimeListCommand.setShow_date(date);
				showtimeListCommand.setShow_date_string(date);
			} catch (ParseException e) {
				e.printStackTrace();
			}
		}
		if (theater_num != null) {
			showtimeListCommand.setTheater_num(theater_num);
		}
		if (movie_num != null) {
			showtimeListCommand.setMovie_num(movie_num);
		}
		showtimeListService.selectShowByInfo(showtimeListCommand, model);
		return "movie/showtime_list";
	}
}