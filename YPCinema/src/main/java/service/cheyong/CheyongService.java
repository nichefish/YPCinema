package service.cheyong;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import model.DTO.CheyongAddDTO;
import repository.cheyong.CheyongRepository;

@Service
public class CheyongService {
	@Autowired
	CheyongRepository cheyongRepository;
	public void selectList(Model model) {
		List<CheyongAddDTO> lists = cheyongRepository.selectLists();
		model.addAttribute("cheyongLists",lists);
	}
	public void selectOneList(Model model, String num) {
		CheyongAddDTO dto = cheyongRepository.selectOneList(num);
		model.addAttribute("cheyongOneList",dto);
	}
}
