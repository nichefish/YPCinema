package controller.payment;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import command.payment.PaymentCommand;
import model.DTO.AuthInfo;
import service.payment.PaymentListService;

@Controller
public class PaymentListController {
	@Autowired
	private PaymentListService paymentListService;
	
	@RequestMapping("/myMovies")
	public String paymentList(PaymentCommand paymentCommand, HttpSession session, Model model) {
		if (((AuthInfo)session.getAttribute("authInfo")) == null) {
			return "redirect:/login";
		}
		paymentCommand.setM_num(((AuthInfo)session.getAttribute("authInfo")).getM_num());
		paymentListService.selectPaymentListByInfo(paymentCommand, model);
		return "member/member_my_payment_list";
	}
}