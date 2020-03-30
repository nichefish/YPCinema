package service.screen;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import repository.screen.ScreenRepository;

@Service
public class ScreenDeleteService {
	@Autowired
	private ScreenRepository screenRepository;
	
	public void deleteScreen(String screen_num) {
		screenRepository.deleteScreen(screen_num);
	}

}
