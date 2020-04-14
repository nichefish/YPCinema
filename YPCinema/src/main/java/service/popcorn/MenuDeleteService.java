package service.popcorn;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import repository.popcorn.GoodsRepository;
import repository.popcorn.MenuRepository;

@Service
public class MenuDeleteService {
@Autowired
MenuRepository menuRepository;
@Autowired
GoodsRepository goodsRepository;
	public void deleteMenu(String menuNum) {
		menuRepository.menuDelete(menuNum);
		
	}
	public void deleteGoods(String goodsNum) {
		goodsRepository.goodsDelete(goodsNum);
		
	}

}
