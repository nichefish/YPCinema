package service.showReserve;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import command.showtime.ShowReserveCommand;
import model.DTO.AuthInfo;
import repository.showReserve.ShowReserveRepository;
import model.DTO.ShowReserveDTO;

@Service
public class ShowReserveRegisterService {
	@Autowired
	private ShowReserveRepository showReserveRepository;
	
	public void setReserveInfo(ShowReserveCommand showReserveCommand, String show_num, String theater_num, String screen_num, Model model) {
		showReserveCommand.setShow_num(show_num);
		showReserveCommand.setTheater_num(theater_num);
		showReserveCommand.setScreen_num(screen_num);
		model.addAttribute("showReserveCommand", showReserveCommand);
	}

	public void holdReserveInSession(ShowReserveCommand showReserveCommand, HttpSession session) {
		ShowReserveDTO showReserve = new ShowReserveDTO();
		showReserve.setM_num(((AuthInfo) session.getAttribute("authInfo")).getM_num());
		showReserve.setShow_num(showReserveCommand.getShow_num());
		showReserve.setSeat_num(showReserveCommand.getSeat_num());
		showReserve.setSeat_name(showReserveCommand.getSeat_name());
		showReserve.setSeat_price(showReserveCommand.getSeat_price());
		session.setAttribute("showReserveStored", showReserve);
	}
	
	public void insertReserve(HttpSession session, String payment_num) {
		ShowReserveDTO showReserve = (ShowReserveDTO) session.getAttribute("showReserveStored");
		showReserve.setPayment_num(payment_num);
		Integer result = showReserveRepository.insertReserve(showReserve);
	}

	
}