package service.payment;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import command.showtime.ShowReserveCommand;
import model.DTO.ShowReserveDTO;

@Service
public class OrderListService {
	public void getReserveSessionInfo(HttpSession session, Model model) {
		ShowReserveDTO showtimeReserve = (ShowReserveDTO) session.getAttribute("showtimeReserveStored");
		showtimeReserve.setShow_num(showtimeReserve.getShow_num());
		showtimeReserve.setM_num(showtimeReserve.getM_num());
		showtimeReserve.setSeat_num(showtimeReserve.getSeat_num());
		showtimeReserve.setSeat_price(showtimeReserve.getSeat_price());
		model.addAttribute("showtimeReserveStored", showtimeReserve);
	}
}