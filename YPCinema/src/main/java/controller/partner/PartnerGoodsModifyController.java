package controller.partner;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import command.PartnerGoods.PartnerGoodsCommand;
import service.partner.PartnerGoodsModifyService;

@Controller
public class PartnerGoodsModifyController {
	@Autowired
	PartnerGoodsModifyService partnerGoodsModifyService;
	@RequestMapping(value = "/partnerGoodsModify", method=RequestMethod.GET)
	public String partnerGoodsModify(@RequestParam(value = "num") String partnerGoodsNum, Model model) {
		partnerGoodsModifyService.partnerGoodsModify(partnerGoodsNum, model);
		return "partner/partnerGoods_modify";
	}
	@RequestMapping(value = "/partnerGoodsModifyPro", method = RequestMethod.POST)
	public String partneGoodsModifyPro(PartnerGoodsCommand partnerGoodsCommand, HttpSession session, HttpServletRequest request) {
		partnerGoodsModifyService.partnerGoodsModifyPro(partnerGoodsCommand, session, request);
		return "redirect:partnerGoodsList";
	}
}
