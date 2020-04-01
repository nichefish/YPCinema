package controller.popcorn;



import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import command.popcorn.GoodsCommand;
import service.popcorn.GoodsModifyService;

@Controller
public class GoodsModifyController {
	@Autowired
	GoodsModifyService goodsModifyService;
	@RequestMapping(value = "/goodsModify", method=RequestMethod.GET)
	public String goodsModify(@RequestParam(value = "num") String goodsNum, Model model) {
		goodsModifyService.goodsModify(goodsNum, model);
		return "popcorn/goods_modify";
	}
	@RequestMapping(value = "/goodsModifyPro", method = RequestMethod.POST)
	public String goodsModifyPro(GoodsCommand goodsCommand, HttpSession session, HttpServletRequest request) {
		goodsModifyService.goodsModifyPro(goodsCommand, session, request);
		return "redirect:goodsList";
	}
}
