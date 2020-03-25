package controller.theater;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import service.admin.JicmuListService;

@Controller
public class TheaterListController {
	@Autowired
	private JicmuListService jicmuListService;
	
	@RequestMapping("/theater/list")
	public String theaterList(Model model) {
		jicmuListService.showList(model);
		return "movie/theater_list";
	}
}