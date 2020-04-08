package controller.admin;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import command.admin.GngijunCommand;
import service.admin.GnmuTimeService;

@Controller
public class GnmuController {
	@Autowired
	GnmuTimeService gnmuTimeService;
	
	@RequestMapping("/work_class")
	public String gnmuLists(Model model) {
		gnmuTimeService.gnmuLists(model);
		return "admin/work_class";
	}
	@RequestMapping(value="/work_addClass",method=RequestMethod.GET)
	public String gnmuTimeAdd() {
		return "admin/work_addClass";
	}
	@RequestMapping("/work_addClass2")
	public String gnmuTimeAddAjax(Model model, @RequestParam(value="sTime")String sTime, @RequestParam(value="eTime")String eTime) {
		gnmuTimeService.addAjax(model, sTime,eTime);
		return "admin/work_addClass2";
	}
	@RequestMapping(value="/work_addClass",method=RequestMethod.POST)
	public String gnmuTimeAddPost(GngijunCommand gngijunCommand) {
		gnmuTimeService.addGnmuTime(gngijunCommand);
		return "redirect:work_class";
	}
	//근무분류 삭제
	@RequestMapping("/work_deleteClass")
	public String gnmuTimeDelete(@RequestParam(value="gnmuTime")String gbunNum) {
		gnmuTimeService.deleteTime(gbunNum);
		return "redirect:work_class";
	}
}
