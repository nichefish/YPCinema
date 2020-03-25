package service.screen;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import command.screen.ScreenCommand;
import model.DTO.ScreenDTO;
import repository.screen.ScreenRepository;

@Service
public class ScreenDetailService {
	@Autowired
	private ScreenRepository screenRepository;
	
	public ScreenDTO getScreenByInfo(String screen_num, Model model) {
		ScreenDTO screen = screenRepository.getScreenByInfo(screen_num);
		screen.setScreen_row_array(screen.getScreen_row());
		model.addAttribute("screenCommand", screen);
		return screen;
	}
}