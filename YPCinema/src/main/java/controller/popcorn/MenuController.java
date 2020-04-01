package controller.popcorn;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import service.popcorn.MenuListService;

@Controller
public class MenuController {
	@Autowired
	MenuListService menuListService;
	//메뉸 상품등록
	@RequestMapping("/menu")
	public String menuWriteForm() {
		return "popcorn/menu";
	}
	@RequestMapping("/menuList")
	public String menuList(Model model) {
	menuListService.menuList(model);
	return "popcorn/menu_list";
	}
	@RequestMapping("/menutype")
	public String menutype(@RequestParam(value = "type") String menuType, Model model) {
		menuListService.menuType(menuType, model);
		return "popcorn/category";
	}
}
