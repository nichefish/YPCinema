package service.screen;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import model.DTO.ScreenDTO;
import repository.screen.ScreenRepository;

@Service
public class ScreenListService {
	@Autowired
	private ScreenRepository screenRepository;

	public void listScreen(String theater_num, Model model) {
		List<ScreenDTO> lists = screenRepository.selectScreenByTheaterNum(theater_num);
		model.addAttribute("lists", lists);
	}
}
