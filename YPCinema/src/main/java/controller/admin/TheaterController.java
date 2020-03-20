package controller.admin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import command.admin.TheaterAddCommand;
import service.admin.TheaterAddService;

@Controller
public class TheaterController {
	@Autowired
	TheaterAddService theaterAddService;
	@RequestMapping(value="/theater_add", method=RequestMethod.GET)
	public String TheaterAdd() {
		return "admin/theater_add";
	}
	@RequestMapping(value="/theater_add", method=RequestMethod.POST)
	public String TheaterAddP(TheaterAddCommand theaterAddCommand) {
		theaterAddService.addPost(theaterAddCommand);
		return "redirect:jobList";
	}
	//극장 정보 수정
	@RequestMapping(value="/theater_addM", method=RequestMethod.GET)
	public String theaterModify(@RequestParam(value="num")String num, Model model) {
		theaterAddService.execute(num, model);
		return "admin/theater_addM";
	}
	@RequestMapping(value="/theater_addM", method=RequestMethod.POST)
	public String theaterModifyPro(TheaterAddCommand theaterAddCommand) {
		theaterAddService.Modify(theaterAddCommand);
		return "redirect:jobList";
	}
	@RequestMapping(value="/theater_detail", method=RequestMethod.GET)
	public String theaterDetail(@RequestParam(value="num")String num, Model model) {
		theaterAddService.execute(num, model);
		return "admin/theater_detail";
	}
}
