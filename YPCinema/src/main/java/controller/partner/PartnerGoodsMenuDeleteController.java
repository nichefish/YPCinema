package controller.partner;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import service.partner.PartnerGoodsMenuDeleteService;

@Controller
public class PartnerGoodsMenuDeleteController {
	@Autowired
	PartnerGoodsMenuDeleteService partnerGoodsMenuDeleteService;
	@RequestMapping("/partnerGoodsMenuDelete")
	public String partnerGoodsMenuDelete(@RequestParam(value = "num") String partnerGoodsMenuNum) {
		partnerGoodsMenuDeleteService.partnerGoodsMenuDelete(partnerGoodsMenuNum);
		return "redirect:partnerGoodsMenuList";
	}

}
