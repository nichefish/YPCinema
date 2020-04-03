package controller.payment;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import command.payment.PaymentCommand;
import service.payment.PaymentListService;

@Controller
public class PaymentListController {
	@Autowired
	private PaymentListService paymentListService;
	
	@RequestMapping("/payment/list")
	public String paymentList(PaymentCommand paymentCommand, Model model) {
//		paymentListService.selectPaymentListByInfo(paymentCommand, model);
		return "payment/payment_list";
	}
}