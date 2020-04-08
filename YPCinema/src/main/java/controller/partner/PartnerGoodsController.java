package controller.partner;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import service.partner.PartnerGoodsListService;


@Controller
public class PartnerGoodsController {
	@Autowired
	PartnerGoodsListService partnerGoodsListService;
	@RequestMapping("/partner")
	public String partner() {
		return "partner/partner";
	}
	
	@RequestMapping("/partnerGoodsUp")
	public String partnerGoodsUp() {
		return "partner/partnerGoods_up";
	}
	@RequestMapping("/partnerGoodsList")
	public String partnerGoodsList(Model model) {
		partnerGoodsListService.partnerGoodsList(model);
		return "partner/partnerGoods_list";
	}

}
