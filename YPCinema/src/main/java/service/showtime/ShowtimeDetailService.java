package service.showtime;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import model.DTO.ShowtimeDTO;
import repository.showtime.ShowtimeRepository;

@Service
public class ShowtimeDetailService {
	@Autowired
	private ShowtimeRepository showtimeRepository;
	
	public ShowtimeDTO selectByShowId(String show_num, Model model) {
		ShowtimeDTO show = new ShowtimeDTO();
		show.setShow_num(show_num);
		show = showtimeRepository.selectByShowId(show);
		model.addAttribute("show", show);
		return show;
	}

	public void selectEarliestShowByDate(ShowtimeDTO show, Model model) {

	}

	public void selectEarliestShowByDate(String screen_num, String date, Model model) {
		ShowtimeDTO show = new ShowtimeDTO();
		show.setScreen_num(screen_num);
		show.setShow_date_string(date);
		ShowtimeDTO showtime = showtimeRepository.selectEarliestShowByDate(show);
		if (showtime == null) {
			showtime = new ShowtimeDTO();
			String str = "08:00:00";
			SimpleDateFormat dt = new SimpleDateFormat("HH:mm:ss");
			Date show_date;
			try {
				show_date = dt.parse(str);
				showtime.setShow_end(show_date);
			} catch (ParseException e) {
				e.printStackTrace();
			}
		}
		System.out.println("showEnds..." + showtime.getShow_end());
		model.addAttribute("show", showtime);
	}
}
