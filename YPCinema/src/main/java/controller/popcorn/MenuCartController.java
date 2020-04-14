package controller.popcorn;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import command.member.MemberCommand;
import service.member.MemberDetailService;
import service.popcorn.MenuCartService;

@Controller
public class MenuCartController {
	@Autowired
	private MenuCartService menuCartService;
	@Autowired
	private MemberDetailService memberDetailService;
//	@RequestMapping("/cartRemove")
//	public String goodsCartRemove(@RequestParam(value = "delete") String [] menuNums) {
//		menuCartService.cartRemove(menuNums);
//		return "redirect:cartList";
//	}
	@RequestMapping("/cartAdd")
	public String cartAdd(@RequestParam(value = "num") String menuNum, Model model, HttpServletRequest request) {
		HttpSession session = request.getSession();
		menuCartService.cartAdd(menuNum,model,session);
		return "redirect:/cartList";
	}
	@RequestMapping("/cartList")
	public String cartList(Model model, HttpSession session) {
		menuCartService.menuCartList(session, model);
		return "popcorn/cart";
	}
	@RequestMapping("/cartCart")
	public String cartCart(@RequestParam("select") String menuNums, MemberCommand memberCommand, HttpServletRequest request, Model model) {
		HttpSession session = request.getSession();
		memberDetailService.memberMypage(session, model);
		menuCartService.cartPayList(menuNums, session, model);
		return "popcorn/buy_list";
	}
	@RequestMapping(value = "/cartQtyDown")
	public String cartQtyDown(@RequestParam(value = "num") String menuNum, 
			Model model,HttpSession session) {
		menuCartService.cartQtyDown(menuNum,model,session);
		return "redirect:/cartList";
	}
	@RequestMapping(value = "/cartQtyUp")
	public String cartQtyUp(@RequestParam(value = "num") String menuNum, Model model, HttpSession session) {
		System.out.println("aaaaa");
		menuCartService.cartAdd(menuNum,model,session);
		return "redirect:/cartList";
	}
}
