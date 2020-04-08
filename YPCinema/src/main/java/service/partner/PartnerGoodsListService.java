package service.partner;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import model.DTO.PartnerGoodsDTO;
import repository.partner.PartnerGoodsRepository;

@Service
public class PartnerGoodsListService {
	@Autowired
	PartnerGoodsRepository partnerGoodsRepository;

	public void partnerGoodsList(Model model) {
		List<PartnerGoodsDTO> list = partnerGoodsRepository.partnerGoodsList();
		model.addAttribute("partnerGoodsList", list);
	}
}
