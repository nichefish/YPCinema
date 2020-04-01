package controller.admin;


import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import command.admin.CouponCommand;
import service.admin.CouponAddService;

@Controller
public class CouponController {
	@Autowired
	CouponAddService couponAddService;
	@RequestMapping("/coupon_addList")
	public String couponAddList(Model model) {
		couponAddService.selectLists(model);
		return "admin/coupon_addList";
	}
	@RequestMapping(value="/coupon_add",method=RequestMethod.GET)
	public String couponAdd(Model model) {
		couponAddService.goods_type(model);
		return "admin/coupon_add";
	}
	@RequestMapping(value="/coupon_add",method=RequestMethod.POST)
	public String couponAddPost(CouponCommand couponCommand) {
		couponAddService.couponAdd(couponCommand);
		return "redirect:coupon_addList";
	}
	@RequestMapping("/coupon_add2")
	public String couponAddAjax(Model model,@RequestParam(value="menuType")String menuType) {
		couponAddService.goodsName(model,menuType);
		return "admin/coupon_add2";
	}
	@RequestMapping("/couponDelete")
	public String deleteCoupon(@RequestParam(value="nums")String [] nums) {
		couponAddService.deleteCoupon(nums);
		return "redirect:coupon_addList";
	}
	//member_couponList
	@RequestMapping("/memeber_couponList")
	public String memeberCoupon(HttpSession session, Model model) {
		couponAddService.selectListsM(session, model);
		return "admin/memeber_couponList";
	}
	@RequestMapping("/memeber_couponList2")
	public String memberCoupon2(HttpSession session, Model model,@RequestParam(value="type")String type) {
		couponAddService.selectListsForMember(session,model,type);
		return "admin/memeber_couponList2";
	}
}
