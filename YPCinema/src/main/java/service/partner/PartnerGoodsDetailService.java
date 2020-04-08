package service.partner;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import model.DTO.PartnerGoodsDTO;
import model.DTO.PartnerGoodsMenuDTO;
import repository.partner.PartnerGoodsMenuRepository;
import repository.partner.PartnerGoodsRepository;



@Service
public class PartnerGoodsDetailService {
	@Autowired	
	PartnerGoodsRepository partnerGoodsRepository;
	@Autowired
	PartnerGoodsMenuRepository partnerGoodsMenuRepository;

	
	public void partnerGoodsDetail(Model model, String partnerGoodsNum) {
		PartnerGoodsDTO dto = partnerGoodsRepository.partnerGoodsDetail(partnerGoodsNum);
		model.addAttribute("partnerGoods",dto);
	}
	public void partnerGoodsMenuDetail(Model model, String partnerGoodsMenuNum) {
		PartnerGoodsMenuDTO dto = partnerGoodsMenuRepository.partnerGoodsMenuDetail(partnerGoodsMenuNum);
		model.addAttribute("partnerGoodsMenu",dto);
	}
	
}
