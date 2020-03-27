package service.screen;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import command.screen.ScreenCommand;
import model.DTO.ScreenDTO;
import repository.screen.ScreenRepository;

@Service
public class ScreenAddService {
	@Autowired
	private ScreenRepository screenRepository;
	
	public void insertScreen(ScreenCommand screenCommand) {
		ScreenDTO screen = new ScreenDTO();
		screen.setScreen_name(screenCommand.getScreen_name());
		screen.setTheater_num(screenCommand.getTheater_num());
		screen.setTheater_name(screenCommand.getTheater_name());
		screen.setScreen_max_seat(screenCommand.getScreen_max_seat());
		screen.setScreen_row(screenCommand.getScreen_row());
		screen.setScreen_rating(screenCommand.getScreen_rating());
		screenRepository.insertScreen(screen);
	}
}
