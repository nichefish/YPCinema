package service.showtime;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import command.showtime.ShowtimeReserveCommand;
import model.DTO.AuthInfo;
import model.DTO.ScreenDTO;
import model.DTO.ShowtimeDTO;
import model.DTO.ShowtimeReserveDTO;
import repository.showtime.ShowtimeReserveRepository;

@Service
public class ShowtimeReserveService {
	@Autowired
	private ShowtimeReserveRepository showtimeReserveRepository;
	
	public void setReserveInfo(ShowtimeReserveCommand showtimeReserveCommand, String show_num, String theater_num, String screen_num, Model model) {
		showtimeReserveCommand.setShow_num(show_num);
		showtimeReserveCommand.setTheater_num(theater_num);
		showtimeReserveCommand.setScreen_num(screen_num);
		model.addAttribute("showtimeReserveCommand", showtimeReserveCommand);
	}

	public void insertReserve(ShowtimeReserveCommand showtimeReserveCommand, HttpSession session) {
		ShowtimeReserveDTO showReserve = new ShowtimeReserveDTO();
		showReserve.setM_num(((AuthInfo) session.getAttribute("authInfo")).getM_num());
		showReserve.setShow_num(showtimeReserveCommand.getShow_num());
		showReserve.setSeat_num(showtimeReserveCommand.getSeat_num());
		showReserve.setSeat_name(showtimeReserveCommand.getSeat_name());
		showReserve.setSeat_price(showtimeReserveCommand.getSeat_price());
		Integer result = showtimeReserveRepository.insertReserve(showReserve);
	}

	public void holdReserveInSession(ShowtimeReserveCommand showtimeReserveCommand, HttpSession session) {
		ShowtimeReserveDTO showtimeReserve = new ShowtimeReserveDTO();
		showtimeReserve.setM_num(((AuthInfo) session.getAttribute("authInfo")).getM_num());
		showtimeReserve.setShow_num(showtimeReserveCommand.getShow_num());
		showtimeReserve.setSeat_num(showtimeReserveCommand.getSeat_num());
		showtimeReserve.setSeat_name(showtimeReserveCommand.getSeat_name());
		showtimeReserve.setSeat_price(showtimeReserveCommand.getSeat_price());
		session.setAttribute("showtimeReserveStored", showtimeReserve);
	}
}