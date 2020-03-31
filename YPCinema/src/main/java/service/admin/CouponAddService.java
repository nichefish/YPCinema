package service.admin;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import command.admin.CouponCommand;
import model.DTO.CouponDTO;
import repository.admin.CouponRepository;

@Service
public class CouponAddService {
	@Autowired
	CouponRepository couponRepository;
	public void selectLists(Model model) {
		List<CouponDTO> lists = couponRepository.selectLists();
		model.addAttribute("selectLists",lists);
	}
	public void goods_type(Model model) {
		List<CouponDTO> menuType = couponRepository.menuType();
		model.addAttribute("menuTypes", menuType);
	}
	public void goodsName(Model model,String menuType) {
		List<CouponDTO> menuName = couponRepository.menuName(menuType);
		model.addAttribute("menuNames", menuName);
		model.addAttribute("menuType",menuType);
	}
	public void couponAdd(CouponCommand couponCommand) {
		CouponDTO dto = new CouponDTO();
		dto.setC_spe(couponCommand.getC_spe());
		dto.setC_name(couponCommand.getC_name());
		dto.setC_content(couponCommand.getC_content());
		dto.setC_score(couponCommand.getC_score());
		dto.setC_symbol(couponCommand.getC_symbol());
		couponRepository.couponAdd(dto);
	}
	public void deleteCoupon(String[] nums) {
		List<String> str = new ArrayList<String>();
		for(String seq : nums) {
			str.add(seq);
		}
		Map<String,Object> numms = new HashMap<String,Object>();
		numms.put("seqs", str);
		couponRepository.deleteCoupon(numms);
	}
}
