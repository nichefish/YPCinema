package service.payment;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestParam;

import command.payment.PaymentCommand;
import model.DTO.PaymentDTO;
import repository.payment.PaymentRepository;

@Service
public class PaymentDetailService {
	@Autowired
	private PaymentRepository paymentRepository;
	
	public void selectPaymentByInfo(String payment_num, Model model) {
		PaymentDTO payment = paymentRepository.selectPaymentByInfo(payment_num);
		model.addAttribute("payment", payment);
	}

	public String selectLastPayment(PaymentCommand paymentCommand, Model model) {
		PaymentDTO payment = paymentRepository.selectLastPayment(paymentCommand);
		model.addAttribute("payment", payment);
		return payment.getPayment_num();
	}

}
