package service.popcorn;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import model.DTO.AuthInfo;
import model.DTO.CartDTO;
import model.DTO.MenuDTO;
import repository.popcorn.MenuRepository;

@Service
public class MenuCartService {
	@Autowired
	MenuRepository menuRepository;

	public void cartRemove(String[] menuNums, HttpSession session) {
		String userId = ((AuthInfo)session.getAttribute("authInfo")).getM_id();
		CartDTO cart = new CartDTO();
		for (int i = 0; i < menuNums.length; i++) {
			cart.setUserId(userId);
			cart.setMenuNum(menuNums[i]);
			System.out.println(cart.getMenuNum());
			menuRepository.removeCart(cart);
		}
		
		
		
//		List<String> cs = new ArrayList<String>();
//		for(String menuNum : menuNums) {
//			cs.add(menuNum);
//		}
//		Map<String, Object> condition = new HashMap<String, Object>();
//		condition.put("nums", cs);
//		menuRepository.menuCartRemove(condition);
	}

	public void cartAdd(String menuNum, Model model, HttpSession session) {
		MenuDTO dto = menuRepository.menuDetail(menuNum);
		CartDTO cart = new CartDTO();
		cart.setMenuImage(dto.getMenuImage());
		cart.setMenuName(dto.getMenuName());
		cart.setMenuPrice(dto.getMenuPrice());
		cart.setMenuNum(dto.getMenuNum());
		cart.setMenuQty(1L);
		cart.setUserId(((AuthInfo)session.getAttribute("authInfo")).getM_id());
		cart.setMenuImage(dto.getMenuImage());
		menuRepository.cartAdd(cart);
	}

	public void menuCartList(HttpSession session, Model model) {
		String userId = ((AuthInfo)session.getAttribute("authInfo")).getM_id();
		List<CartDTO> list = menuRepository.cartList(userId);
		model.addAttribute("cartList", list);
		
	}

	public void wishAdd(String menuNum, Model model, HttpSession session) {
		String userId = ((AuthInfo)session.getAttribute("authInfo")).getM_id();
		Integer i = menuRepository.wishAdd(menuNum,userId);
		model.addAttribute("num",i);		
		
	}

	public void wishList(Model model, HttpSession session) {
		String userId = ((AuthInfo)session.getAttribute("authInfo")).getM_id();
		List<MenuDTO> list = menuRepository.wishList(userId);
		model.addAttribute("wishList", list);
	
		
	}
}
