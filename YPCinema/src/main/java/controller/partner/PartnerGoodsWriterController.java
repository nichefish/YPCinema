package controller.partner;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import command.PartnerGoods.PartnerGoodsCommand;
import command.PartnerGoods.PartnerGoodsMenuCommand;
import service.partner.PartnerGoodsMenuWriterService;
import service.partner.PartnerGoodsWriteService;


@Controller
public class PartnerGoodsWriterController {
	@Autowired
	PartnerGoodsMenuWriterService partnerGoodsMenuWriterService;
	@Autowired
	PartnerGoodsWriteService partnerGoodsWriteService;
	
	
	@RequestMapping(value = "/partnerGoodsMenuPro",method = RequestMethod.POST)
	public String partnerGoodsMenuWritePro(PartnerGoodsMenuCommand partnerGoodsMenuCommand, HttpSession session, HttpServletRequest request) {
		partnerGoodsMenuWriterService.partnerGoodsMenuWrite(partnerGoodsMenuCommand,session,request);
		return "redirect:/partnerGoodsMenuList";
	}
	
	@RequestMapping(value = "/partnerGoodsPro",method = RequestMethod.POST)
	public String partnerGoodsWritePro(PartnerGoodsCommand partnerGoodsCommand, HttpSession session, HttpServletRequest request) {
		partnerGoodsWriteService.partnerGoodsWrite(partnerGoodsCommand,session,request);
		return "redirect:/partnerGoodsList";
	}
}
