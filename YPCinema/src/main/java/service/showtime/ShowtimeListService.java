package service.showtime;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import command.showtime.ShowtimeCommand;
import command.showtime.ShowtimeListCommand;
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
	
	public void selectShowByInfo(ShowtimeListCommand showtimeListCommand, Model model) {
		List<ShowtimeDTO> lists = showtimeRepository.selectByShowInfo(showtimeListCommand);
		model.addAttribute("showLists", lists);
	}
}