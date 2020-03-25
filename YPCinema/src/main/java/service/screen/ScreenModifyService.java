package service.screen;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import command.screen.ScreenCommand;
import repository.screen.ScreenRepository;

@Service
public class ScreenModifyService {
	@Autowired
	private ScreenRepository screenRepository;

	public void modifyScreen(ScreenCommand screenCommand) {
		screenRepository.modifyScreen(screenCommand);
	}
}