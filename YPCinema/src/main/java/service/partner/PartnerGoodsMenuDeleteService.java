package service.partner;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import repository.partner.PartnerGoodsMenuRepository;

@Service
public class PartnerGoodsMenuDeleteService {
@Autowired
PartnerGoodsMenuRepository partnerGoodsMenuRepository;
	public void partnerGoodsMenuDelete(String partnerGoodsMenuNum) {
		partnerGoodsMenuRepository.partnerGoodsMenuDelete(partnerGoodsMenuNum);
		
	}

}
