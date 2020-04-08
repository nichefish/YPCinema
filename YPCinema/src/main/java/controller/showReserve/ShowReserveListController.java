package controller.showReserve;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import command.payment.PaymentCommand;
import command.showtime.ShowReserveCommand;
import model.DTO.ScreenDTO;
import model.DTO.ShowReserveDTO;
import model.DTO.ShowtimeDTO;
import service.screen.ScreenDetailService;
import service.showReserve.ShowReserveListService;
import service.showReserve.ShowReserveModifyService;
import service.showReserve.ShowReserveRegisterService;
import service.showtime.ShowtimeDetailService;

@Controller
public class ShowReserveListController {
	@Autowired
	private ShowReserveListService showReserveListService;
	@Autowired
	private ShowtimeDetailService showtimeDetailService;
	@Autowired
	private ScreenDetailService screenDetailService;
	@Autowired
	private ShowReserveRegisterService showReserveRegisterService;
	@Autowired
	private ShowReserveModifyService showReserveModifyService;
	
	@RequestMapping(value="/showReserve/check", method=RequestMethod.GET)
	public String showReserveCheck(HttpSession session, PaymentCommand paymentCommand, @RequestParam(value="payment_num", required=false) String payment_num, Model model) {
		paymentCommand.setPayment_num(payment_num);
		showReserveListService.selectShowReserveListByPayInfo(paymentCommand, model);
		return "movie/show_reserve_list";
	}
	
	@RequestMapping(value="/showReserve/check", method=RequestMethod.POST)
	public String showReserveChange(PaymentCommand paymentCommand, @RequestParam("payment_num") String payment_num, @RequestParam("seat_issue") String seat_issue, @RequestParam("select") String [] select, Model model) {
		paymentCommand.setPayment_num(payment_num);
		showReserveListService.selectShowReserveListByPayInfo(paymentCommand, model);
		for(int i = 0; i < select.length; i++ ) {
			ShowReserveDTO showReserve = new ShowReserveDTO();
			showReserve.setPayment_num(payment_num);
			showReserve.setSeat_num(Integer.parseInt(select[i]));
			showReserve.setSeat_issue(seat_issue);
			showReserveModifyService.updateTicketIssue(showReserve);
		}
		showReserveListService.selectShowReserveListByPayInfo(paymentCommand, model);
		return "movie/show_reserve_list";
	}
	
	
	
	
//	@RequestMapping(value="/showReserve/detail", method=RequestMethod.GET)
//	public String showReserveCheckDetail(@RequestParam("payment") String payment_num, ShowReserveCommand showReserveCommand, Model model) {
//		List<ShowReserveDTO> lists = showReserveListService.selectShowReserveListByPaymentNum(payment_num, model);
//		ShowtimeDTO showtime = showtimeDetailService.selectByShowId(lists.get(0).getShow_num(), model);
//		ScreenDTO screen = screenDetailService.getScreenByInfo(showtime.getScreen_num(), model);
//		showReserveRegisterService.setReserveInfo(showReserveCommand, lists.get(0).getShow_num(), screen.getTheater_num(), screen.getScreen_num(), model);
//		return "movie/show_reserve_detail_seatview";
//	}
//	
	
}
