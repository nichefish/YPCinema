package controller.admin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import command.admin.CouponCommand;
import service.admin.CouponAddService;
import service.admin.CouponIssueService;

@Controller
public class CouponIssueController {
	@Autowired
	CouponIssueService couponIssueService;
	@Autowired
	CouponAddService couponAddService;
	@RequestMapping("/coupon_issue")
	public String issuedCoupon() {
		return "admin/coupon_issue";
	}
	@RequestMapping("/find_user")
	public String findUser(Model model, @RequestParam(value="findUserText")String text) {
		couponIssueService.findUser(model,text);
		couponAddService.goods_type(model);
		return "admin/coupon_issue";
	}
	@RequestMapping("/coupon_issue2")
	public String issueAjax(Model model,@RequestParam(value="couponType")String type,@RequestParam(value="userNum")String userNum) {
		couponIssueService.selectCoupons(model,type,userNum);
		return "admin/coupon_issue2";
	}
	public String couponIssue(@RequestParam(value="hiddenUserNum")String mNum,
							  @RequestParam(value="cNum")String cNum,
							  @RequestParam(value="manryo")String manryo) {
		couponIssueService.couponIssue(mNum,cNum,manryo);
		return "redirect:coupon_addList";
	}
}
