package controller.staff;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import service.staff.GnteService;

@Controller
public class GnteController {
	@Autowired
	private GnteService gnteService;
	
	@RequestMapping(value="/staff_se", method=RequestMethod.GET)
	public String staffGnte(HttpSession session, Model model) {
		if (session.getAttribute("authInfo") == null) {
			return "redirect:/login";
		}
		gnteService.getScheduleToday(session, model);
		return "staff/staff_se";
	}
	
	@RequestMapping(value="/staff_se", method=RequestMethod.POST)
	public String staffGnteChulgn(@RequestParam("gnte_mode") String gnte_mode, HttpSession session) {
		gnteService.gnteGnte(session, gnte_mode);
		return "redirect:/staff_se";
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
