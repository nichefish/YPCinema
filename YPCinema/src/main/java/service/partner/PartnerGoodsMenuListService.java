package service.partner;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import model.DTO.PartnerGoodsMenuDTO;
import repository.partner.PartnerGoodsMenuRepository;


@Service
public class PartnerGoodsMenuListService {
@Autowired
PartnerGoodsMenuRepository partnerGoodsMenuRepository;
	public void partnerGoodsMenuList(Model model) {
		List<PartnerGoodsMenuDTO> list = partnerGoodsMenuRepository.partnerGoodsMenuList();
		model.addAttribute("partnerGoodsMenuList", list);
	}
	
	public void partnerGoodsMenuType(String partnerGoodsMenuType, Model model){
		List<PartnerGoodsMenuDTO> list = partnerGoodsMenuRepository.partnerGoodsMenuType(partnerGoodsMenuType);
		model.addAttribute("partnerGoodsMenuType", list);
	}
	

}
