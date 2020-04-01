package controller.popcorn;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import command.popcorn.GoodsCommand;
import service.popcorn.GoodsListService;

@Controller
public class GoodsController {
	@Autowired
	GoodsListService goodsListService;
	
	@RequestMapping("/popcorn")
	public String popcorn() {
		return "popcorn/popcorn";
	}
	
	@RequestMapping("/goodsUp")
	public String goodsUp() {
		return "popcorn/goods_up";
	}
	@RequestMapping("/goodsList")
	public String goodsList(Model model) {
		goodsListService.goodsList(model);
		return "popcorn/goods_list";
	}

}
