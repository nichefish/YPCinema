package service.showtime;

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
}
