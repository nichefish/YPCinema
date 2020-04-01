package service.popcorn;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import repository.popcorn.MenuRepository;

@Service
public class MenuDeleteService {
@Autowired
MenuRepository menuRepository;
	public void deleteMenu(String menuNum) {
		menuRepository.menuDelete(menuNum);
		
	}

}
