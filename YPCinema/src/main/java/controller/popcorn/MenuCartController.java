package controller.popcorn;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import service.popcorn.MenuCartService;

@Controller
public class MenuCartController {
	@Autowired
	MenuCartService menuCartService;
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
	public String cartCart(@RequestParam("select") String[] menuNums, @RequestParam("submit_mode") String submit_mode, HttpSession session) {
		System.out.println(submit_mode);
		if(submit_mode.equals("delete")) {
			System.out.println("!!!!");
			menuCartService.cartRemove(menuNums, session);
		}
		
		return "redirect:/cartList";
	}
	
	@RequestMapping("/wishAdd")
	public String goodsWishAdd(@RequestParam(value = "num") String menuNum,
			Model model,HttpSession session) {
		menuCartService.wishAdd(menuNum, model, session);
		return "popcorn/success";
	}
	@RequestMapping("/wishList")
	public String goodsWishList(Model model,HttpSession session) {
		menuCartService.wishList(model,session);
		return "popcorn/wishList";
	}
}
