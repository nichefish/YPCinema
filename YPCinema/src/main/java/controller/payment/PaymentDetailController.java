package controller.payment;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import command.payment.PaymentCommand;
import service.payment.PaymentDetailService;
import service.showReserve.ShowReserveListService;

@Controller
public class PaymentDetailController {
	@Autowired
	private PaymentDetailService paymentDetailService;
	@Autowired
	private ShowReserveListService showReserveListService;
	
	@RequestMapping("/payment/detail")
	public String paymentDetail(@RequestParam("num") String payment_num, PaymentCommand paymentCommand, Model model) {
		paymentDetailService.selectPaymentByInfo(payment_num, model);
		paymentCommand.setPayment_num(payment_num);
		showReserveListService.selectShowReserveListByPayInfo(paymentCommand, model);
		return "payment/payment_detail";
	}
}