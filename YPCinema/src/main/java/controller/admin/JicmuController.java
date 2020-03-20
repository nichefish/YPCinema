package controller.admin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.bind.annotation.RequestParam;
import service.admin.JicmuListService;

@Controller
public class JicmuController {
	@Autowired
	JicmuListService jicmuListService;
	@RequestMapping("/jobList")
	public String jobList(Model model) {
		jicmuListService.showList(model);
		jicmuListService.showJicmuList(model);
		return "admin/theater_jobList";
	}
	@RequestMapping("/jicmu_add")
	public String jicmuAdd(@RequestParam(value="job_plus") String jicmu) {
		jicmuListService.jicmuAdd(jicmu);
		return "redirect:jobList";
	}
	
}
