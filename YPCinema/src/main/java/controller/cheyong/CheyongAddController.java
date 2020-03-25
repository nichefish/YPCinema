package controller.cheyong;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import command.cheyong.GonggoCommand;
import service.cheyong.CheyongAddService;

@Controller
public class CheyongAddController {
	@Autowired
	CheyongAddService cheyongAddService;
	
	@RequestMapping(value="/staff_add", method=RequestMethod.GET)
	public String cheyongAddG(Model model) {
		cheyongAddService.execute(model);
		return "cheyong/staff_add";
	}
	
	@RequestMapping(value="/staff_add", method=RequestMethod.POST)
	public String cheyongAddP(GonggoCommand gonggoCommand) {
		cheyongAddService.insert(gonggoCommand);
		return "redirect:staff_postList";
	}

	@RequestMapping("/jijom_gumsec")
	public String jijomGumsec(Model model) {
		return "cheyong/jijom_gumsec";
	}
	@RequestMapping(value="/jijomgumsechangs", method=RequestMethod.POST)
	public String jijomgumsechangs(Model model,@RequestParam(value="jijomgumsechang")String jjc) {
		cheyongAddService.jijomgumsec(model,jjc);
		return "cheyong/jijom_gumsec";
	}
	

}
