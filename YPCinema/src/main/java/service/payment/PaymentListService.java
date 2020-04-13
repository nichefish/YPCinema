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
		model.addAttribute("paymentLists", lists);
	}

	public PaymentDTO selectPaymentByInfo(String payment_num, Model model) {
		PaymentCommand paymentCommand = new PaymentCommand();
		paymentCommand.setPayment_num(payment_num);
		PaymentDTO paymentDTO = paymentRepository.selectPaymentByInfo(paymentCommand);
		model.addAttribute("payment", paymentDTO);
		return paymentDTO;
	}
}
