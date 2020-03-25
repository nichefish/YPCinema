package service.payment;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import command.payment.PaymentCommand;
import model.DTO.PaymentDTO;
import repository.payment.PaymentRepository;

@Service
public class PaymentListService {
	@Autowired
	private PaymentRepository paymentRepository;

	public void selectPaymentAll(Model model) {
		List<PaymentDTO> lists = paymentRepository.selectPaymentAll();
		model.addAttribute("lists", lists);
	}

	public void selectPaymentListByInfo(PaymentCommand paymentCommand, Model model) {
		List<PaymentDTO> lists = paymentRepository.selectPaymentListByInfo(paymentCommand);
		model.addAttribute("lists", lists);
	}
}
