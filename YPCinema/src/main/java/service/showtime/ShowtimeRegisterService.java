package service.showtime;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import command.showtime.ShowtimeCommand;
import model.DTO.ShowtimeDTO;
import repository.showtime.ShowtimeRepository;

@Service
public class ShowtimeRegisterService {
	@Autowired
	private ShowtimeRepository SshowtimeRepository;

	public void insertShowtime(ShowtimeCommand showtimeCommand) {
		ShowtimeDTO show = new ShowtimeDTO();
		show.setShow_num(showtimeCommand.getShow_num());
		show.setTheater_num(showtimeCommand.getTheater_num());
		show.setScreen_num(showtimeCommand.getScreen_num());
		show.setMovie_num(showtimeCommand.getMovie_num());
		show.setShow_date(showtimeCommand.getShow_date());
		SimpleDateFormat dt = new SimpleDateFormat("HH:mm");
		try {
			show.setShow_start(dt.parse(showtimeCommand.getShow_start()));
			show.setShow_end(dt.parse(showtimeCommand.getShow_end()));
		} catch (ParseException e) {
			e.printStackTrace();
		}
		SshowtimeRepository.insertShowtime(show);
	}
}
