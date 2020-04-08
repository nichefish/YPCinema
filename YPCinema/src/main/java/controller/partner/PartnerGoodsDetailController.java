package controller.partner;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import service.partner.PartnerGoodsDetailService;


@Controller
public class PartnerGoodsDetailController {
	@Autowired
	PartnerGoodsDetailService partnerGoodsDetailService;
	@RequestMapping("/partnerGoodsDetail")
	public String partnerGoodsDetail(@RequestParam(value = "num") String partnerGoodsNum, Model model) {
		partnerGoodsDetailService.partnerGoodsDetail(model, partnerGoodsNum);
		return "partner/partnerGoods_detail";
	}
	@RequestMapping("/partnerGoodsMenuDetail")
	public String partnerGoodsMenuDetail(@RequestParam(value = "num") String partnerGoodsMenuNum, Model model) {
		partnerGoodsDetailService.partnerGoodsMenuDetail(model, partnerGoodsMenuNum);
		return "partner/partnerGoodsMenu_detail";
	}
}
