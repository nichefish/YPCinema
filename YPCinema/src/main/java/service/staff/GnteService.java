package service.staff;

import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

@Service
public class GnteService {
	public void chulTime(String chulgnTime, Model model) {
		model.addAttribute("chulgnTime",chulgnTime);
	}
}
