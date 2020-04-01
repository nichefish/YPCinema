package service.popcorn;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import model.DTO.MenuDTO;
import repository.popcorn.MenuRepository;

@Service
public class MenuListService {
@Autowired
MenuRepository menuRepository;
	public void menuList(Model model) {
		List<MenuDTO> list = menuRepository.menuList();
		model.addAttribute("menuList", list);
	}
	
	public void menuType(String menuType, Model model){
		List<MenuDTO> list = menuRepository.menuType(menuType);
		model.addAttribute("menuType", list);
	}
	

}
