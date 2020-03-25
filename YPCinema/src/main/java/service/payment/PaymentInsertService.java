package service.payment;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import command.payment.PaymentCommand;
import repository.payment.PaymentRepository;

@Service
public class PaymentInsertService {
	@Autowired
	private PaymentRepository paymentRepository;
	
	public void insertPayment(PaymentCommand paymentCommand) {
		paymentRepository.insertPayment(paymentCommand);
	}
}
