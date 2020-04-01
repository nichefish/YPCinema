package controller.popcorn;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import service.popcorn.GoodsDetailService;

@Controller
public class GoodsDetailController {
	@Autowired
	GoodsDetailService goodsDetailService;
	@RequestMapping("/goodsDetail")
	public String goodsDetail(@RequestParam(value = "num") String goodsNum, Model model) {
		goodsDetailService.goodsDetail(model, goodsNum);
		return "popcorn/goods_detail";
	}
	@RequestMapping("/menuDetail")
	public String menuDetail(@RequestParam(value = "num") String menuNum, Model model) {
		goodsDetailService.menuDetail(model, menuNum);
		return "popcorn/menu_detail";
	}
}
