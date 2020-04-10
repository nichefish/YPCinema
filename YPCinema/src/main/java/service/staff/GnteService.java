package service.staff;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import model.DTO.AuthInfo;
import model.DTO.GngijunDTO;
import model.DTO.ScheduleDTO;
import repository.schedule.ScheduleRepository;
import service.admin.GnmuTimeService;

@Service
public class GnteService {
	@Autowired
	private ScheduleRepository scheduleRepository;
	@Autowired
	private GnmuTimeService gnmuTimeService;
	
	public void chulTime(String chulgnTime, Model model) {
		model.addAttribute("chulgnTime",chulgnTime);
	}

	public void getScheduleToday(HttpSession session, Model model) {
		ScheduleDTO schedule = new ScheduleDTO();
		schedule.setStaff_num(((AuthInfo) (session.getAttribute("authInfo"))).getStaff_num());
		schedule = scheduleRepository.selectTodayScheduleByStaffNum(schedule);
		if (schedule != null) {
			model.addAttribute("schedule", schedule);
			GngijunDTO gnmu = gnmuTimeService.gnmuDetail(model, schedule.getGbun_num());
			model.addAttribute("gnmu", gnmu);
		}
	}

	public void gnteGnte(HttpSession session, String gnte_mode) {
		ScheduleDTO schedule = new ScheduleDTO();
		schedule.setStaff_num(((AuthInfo) (session.getAttribute("authInfo"))).getStaff_num());
		schedule = scheduleRepository.selectTodayScheduleByStaffNum(schedule);
		if (gnte_mode.equals("0")) {
			scheduleRepository.setGnteChulgn(schedule);
		} else if (gnte_mode.equals("1")) {
			scheduleRepository.setGnteTuegn(schedule);
		}
	}
}
