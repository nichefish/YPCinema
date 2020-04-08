package controller.payment;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import command.payment.PaymentCommand;
import command.showtime.ShowReserveCommand;
import service.payment.OrderListService;
import service.payment.PaymentDetailService;
import service.payment.PaymentInsertService;
import service.showReserve.ShowReserveListService;
import service.showReserve.ShowReserveRegisterService;

@Controller
public class PaymentController {
	@Autowired
	private OrderListService orderListService;
	@Autowired
	private PaymentInsertService paymentInsertService;
	@Autowired
	private PaymentDetailService paymentDetailService;
	@Autowired
	private ShowReserveRegisterService showReserveRegisterService;
	@Autowired
	private ShowReserveListService showReserveListService;
	
	@RequestMapping("/orderList")
	public String orderList(HttpSession session, Model model) {
//		orderListService.getReserveSessionInfo(session, model);
		return "payment/order_list";
	}
	
	@RequestMapping("/kakaoPay")
	public String kakaoPay(@RequestParam(value="payment_email") String payment_email, @RequestParam(value="payment_ph") String payment_ph, PaymentCommand paymentCommand, Model model) {
		model.addAttribute("payment_email", payment_email);
		model.addAttribute("payment_ph", payment_ph);
		return "payment/kakao_pay";
	}
	
	@RequestMapping(value="/payment_success", method=RequestMethod.POST)
	public String paymentSuccess(PaymentCommand paymentCommand, Model model, HttpSession session) {
		paymentInsertService.insertPayment(paymentCommand);
		String payment_num = paymentDetailService.selectLastPayment(paymentCommand, model);
		paymentCommand.setPayment_num(payment_num);
		showReserveRegisterService.insertReserve(session, payment_num);
		showReserveListService.selectShowReserveListByPayInfo(paymentCommand, model);
		return "payment/payment_detail";
	}
}