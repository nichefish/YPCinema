package controller.popcorn;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import service.popcorn.MenuDeleteService;


@Controller
public class MenuDeleteController {
	@Autowired
	MenuDeleteService menuDeleteService;
	@RequestMapping("/menuDelete")
	public String menuDelete(@RequestParam(value = "num") String menuNum) {
		menuDeleteService.deleteMenu(menuNum);
		return "redirect:menuList";
	}
	@RequestMapping("/goodsDelete")
	public String goodsDelete(@RequestParam(value = "num") String goodsNum ) {
		menuDeleteService.deleteGoods(goodsNum);
		return "redirect:goodsList";
	}

}
