package controller.admin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import service.admin.GnmuTimeService;
import service.admin.ScheduleService;

@Controller
public class ScheduleController {
	@Autowired
	GnmuTimeService gnmuTimeService;
	@Autowired
	ScheduleService scheduleService;
	@RequestMapping("/sch_list")
	public String sch_list(Model model) {
		gnmuTimeService.gnmuLists(model);
		scheduleService.scheduleView(model);
		return "admin/sch_list";
	}
}
