package controller.partner;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import service.partner.PartnerGoodsMenuListService;
import service.popcorn.MenuListService;

@Controller
public class PartnerGoodsMenuController {
	@Autowired
	PartnerGoodsMenuListService partnerGoodsMenuListService;

	// 메뉸 상품등록
	@RequestMapping("/partnerGoodsMenu")
	public String partnerGoodsMenuWriteForm() {
		return "partner/partnerGoodsMenu";
	}

	@RequestMapping("/partnerGoodsMenuList")
	public String partnerGoodsMenuList(Model model) {
		partnerGoodsMenuListService.partnerGoodsMenuList(model);
		return "partner/partnerGoodsMenu_list";
	}

	@RequestMapping("/partnerGoodsMenuType")
	public String partnerGoodsMenuType(@RequestParam(value = "type") String partnerGoodsMenuType, Model model) {
		partnerGoodsMenuListService.partnerGoodsMenuType(partnerGoodsMenuType, model);
		return "partner/partnerGoodsCategory";
	}
}
