package service.popcorn;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import model.DTO.GoodsDTO;
import model.DTO.MenuDTO;
import repository.popcorn.GoodsRepository;
import repository.popcorn.MenuRepository;

@Service
public class GoodsDetailService {
	@Autowired	
	GoodsRepository goodsRepository;
	@Autowired
	MenuRepository menuRepository;

	
	public void goodsDetail(Model model, String goodsNum) {
		GoodsDTO dto = goodsRepository.goodsDetail(goodsNum);
		model.addAttribute("goods",dto);
	}
	public void menuDetail(Model model, String menuNum) {
		MenuDTO dto = menuRepository.menuDetail(menuNum);
		model.addAttribute("menu",dto);
	}
	
}
