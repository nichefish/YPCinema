package service.showtime;

import java.text.SimpleDateFormat;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import command.showtime.ShowtimeCommand;
import model.DTO.ShowtimeDTO;
import repository.showtime.ShowtimeRepository;

@Service
public class ShowtimeListService {
	@Autowired
	private ShowtimeRepository showtimeRepository;
	
	public void selectAllShowtime(Model model) {
		List<ShowtimeDTO> lists = showtimeRepository.selectAllShowtime();
		model.addAttribute("lists", lists);
	}
	
	public void selectShowByInfo(ShowtimeCommand showtimeCommand, Model model) {
		ShowtimeDTO show = new ShowtimeDTO();
		show.setShow_num(showtimeCommand.getShow_num());
		show.setTheater_num(showtimeCommand.getTheater_num());
		show.setScreen_num(showtimeCommand.getScreen_num());
		show.setMovie_num(showtimeCommand.getMovie_num());
		show.setShow_date(showtimeCommand.getShow_date());
		show.setShow_date_string(showtimeCommand.getShow_date());
		System.out.println("날짜2: " + show.getShow_date());
		List<ShowtimeDTO> lists = showtimeRepository.selectByShowInfo(show);
		model.addAttribute("showLists", lists);
	}
}