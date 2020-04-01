package controller.popcorn;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import command.popcorn.GoodsCommand;
import command.popcorn.MenuCommand;
import service.popcorn.GoodsWriteService;
import service.popcorn.MenuWriterService;

@Controller
public class GoodsWriterController {
	@Autowired
	MenuWriterService menuWriterService;
	@Autowired
	GoodsWriteService goodsWriteService;
	
	
	@RequestMapping(value = "/menuPro",method = RequestMethod.POST)
	public String menuWritePro(MenuCommand menuCommand, HttpSession session, HttpServletRequest request) {
		menuWriterService.menuWrite(menuCommand,session,request);
		return "redirect:/menuList";
	}
	
	@RequestMapping(value = "/goodsPro",method = RequestMethod.POST)
	public String goodsWritePro(GoodsCommand goodsCommand, HttpSession session, HttpServletRequest request) {
		goodsWriteService.goodsWrite(goodsCommand,session,request);
		return "redirect:/goodsList";
	}
}
