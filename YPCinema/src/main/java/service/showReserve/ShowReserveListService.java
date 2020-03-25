package service.showReserve;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import command.payment.PaymentCommand;
import command.showtime.ShowtimeCommand;
import model.DTO.ShowReserveDTO;
import repository.showReserve.ShowReserveRepository;

@Service
public class ShowReserveListService {
	@Autowired
	private ShowReserveRepository showReserveRepository;

	public void selectShowReserveListByPayInfo(PaymentCommand paymentCommand, Model model) {
		List<ShowReserveDTO> lists = showReserveRepository.selectShowReserveListByPayInfo(paymentCommand);
		model.addAttribute("showReserveList", lists);
	}

	public void selectShowReserveListByShowInfo(ShowtimeCommand showtimeCommand, Model model) {
		List<ShowReserveDTO> lists = showReserveRepository.selectShowReserveListByShowInfo(showtimeCommand);
		model.addAttribute("showReserveList", lists);
	}
	
	
}
