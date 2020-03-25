package service.payment;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import command.payment.PaymentCommand;
import model.DTO.PaymentDTO;
import repository.payment.PaymentRepository;

@Service
public class PaymentDetailService {
	@Autowired
	private PaymentRepository paymentRepository;
	
	public void selectPaymentByInfo(PaymentCommand paymentCommand, Model model) {
		PaymentDTO payment = paymentRepository.selectPaymentByInfo(paymentCommand);
		model.addAttribute("payment", payment);
	}

	public void selectLastPayment(PaymentCommand paymentCommand, Model model) {
		PaymentDTO payment = paymentRepository.selectLastPayment(paymentCommand);
		model.addAttribute("payment", payment);
	}

}
