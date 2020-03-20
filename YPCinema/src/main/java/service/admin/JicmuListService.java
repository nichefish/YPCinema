package service.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import model.DTO.JicmuDTO;
import model.DTO.TheaterAddDTO;
import repository.admin.JicmuRepository;


@Service
public class JicmuListService {
	@Autowired
	JicmuRepository jicmuRepository;
	public void showList(Model model) {
		List<TheaterAddDTO> lists= jicmuRepository.selectList();
		model.addAttribute("theaters", lists);
	}
	public void showJicmuList(Model model) {
		List<JicmuDTO> list= jicmuRepository.selectJicmu();
		model.addAttribute("jicmuList", list);
	}
	public void jicmuAdd(String jicmu) {
		jicmuRepository.insertJicmu(jicmu);
	}
}
