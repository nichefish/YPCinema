package controller.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import command.admin.ScheduleCommand;
import model.DTO.StaffDTO;
import service.admin.GnmuTimeService;
import service.admin.JicmuListService;
import service.admin.ScheduleService;
import service.staff.StaffListService;

@Controller
public class ScheduleController {
	@Autowired
	GnmuTimeService gnmuTimeService;
	@Autowired
	ScheduleService scheduleService;
	@Autowired
	private JicmuListService jicmuListService;
	// 임시 서비스
	@Autowired
	private StaffListService staffListService;
	
	@RequestMapping(value="/sch_list", method=RequestMethod.GET)
	public String sch_list(@RequestParam(value="theater", required=false) String theater_num, @RequestParam(value="jicmu", required=false) String jicmu, Model model) {
		gnmuTimeService.gnmuLists(model);
		scheduleService.scheduleView(model);
		jicmuListService.showList(model);
		jicmuListService.showJicmuList(model);
		StaffDTO staff = new StaffDTO();
		List<StaffDTO> lists = staffListService.selectStaffByInfo(staff, model);
		
		
		scheduleService.selectAllSchedule(model);
		
		return "admin/sch_list";
	}
	
	@RequestMapping(value="/sch_list", method=RequestMethod.POST)
	public String sch_add(ScheduleCommand scheduleCommand) {
		scheduleService.addSchedule(scheduleCommand);
		return "redirect:/sch_list";
	}
	

	
	
}
