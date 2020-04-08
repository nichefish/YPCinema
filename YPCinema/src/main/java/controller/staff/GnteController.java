package controller.staff;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import service.staff.GnteService;

@Controller
public class GnteController {
	@Autowired
	GnteService gnteService;
	
	@RequestMapping("/staff_se")
	public String staffGnte() {
		return "staff/staff_se";
	}
	@RequestMapping("/staff_se2")
	public String staffGnteAjax(@RequestParam(value="chulgnTime")String chulgnTime, Model model) {
		System.out.println("cul =====ajax2================"+ chulgnTime);
		gnteService.chulTime(chulgnTime,model);
		return "staff/staff_se2";
	}
	@RequestMapping("/staff_se3")
	public String chulgnTuegnTime(@RequestParam(value="chulgnTime")String chulgnTime,@RequestParam(value="tuegnTime")String tuegnTime) {
		System.out.println("cul ====="+ chulgnTime);
		System.out.println("tue ====="+ tuegnTime);
		return "staff/staff_se3";
	}
}
