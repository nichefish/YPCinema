package controller.payment;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import command.payment.PaymentCommand;
import command.showtime.ShowtimeReserveCommand;
import service.payment.OrderListService;
import service.payment.PaymentDetailService;
import service.payment.PaymentInsertService;

@Controller
public class PaymentController {
	@Autowired
	private OrderListService orderListService;
	@Autowired
	private PaymentInsertService paymentInsertService;
	@Autowired
	private PaymentDetailService paymentDetailService;
	
	@RequestMapping("/orderList")
	public String orderList(HttpSession session, Model model) {
		orderListService.getReserveSessionInfo(session, model);
		return "payment/order_list";
	}
	
	@RequestMapping("/kakaoPay")
	public String kakaoPay(@RequestParam(value="payment_email") String payment_email, @RequestParam(value="payment_ph") String payment_ph, PaymentCommand paymentCommand, Model model) {
		model.addAttribute("payment_email", payment_email);
		model.addAttribute("payment_ph", payment_ph);
		return "payment/kakao_pay";
	}
	
	@RequestMapping("/payment_success")
	public String paymentSuccess(PaymentCommand paymentCommand, Model model) {
		paymentInsertService.insertPayment(paymentCommand);
		paymentDetailService.selectLastPayment(paymentCommand, model);
		
		
//		paymentDetailService.selectPaymentByInfo(paymentCommand, model);
		return "payment/payment_success";
	}
}