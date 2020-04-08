package service.showReserve;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import command.payment.PaymentCommand;
import command.showtime.ShowtimeCommand;
import model.DTO.AuthInfo;
import model.DTO.ScreenDTO;
import model.DTO.ShowReserveDTO;
import model.DTO.ShowtimeDTO;
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

	public List<ShowReserveDTO> selectShowReserveListByPaymentNum(String payment_num, Model model) {
		PaymentCommand paymentCommand = new PaymentCommand();
		paymentCommand.setPayment_num(payment_num);
		List<ShowReserveDTO> lists = showReserveRepository.selectShowReserveListByPayInfo(paymentCommand);
		model.addAttribute("showReserveList", lists);
		return lists;
	}

	public void selectShowReserveListByMemberInfo(HttpSession session, Model model) {
		List<ShowReserveDTO> lists = showReserveRepository.selectShowReserveListByMemberInfo(((AuthInfo) session.getAttribute("authInfo")).getM_num());
		model.addAttribute("showReserveList", lists);
	}
	
	
}
