package service.cheyong;


import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import model.DTO.AuthInfo;
import model.DTO.CheyongAddDTO;
import repository.cheyong.CheyongRepository;

@Service
public class CheyongService {
	@Autowired
	CheyongRepository cheyongRepository;
	public void selectList(Model model,HttpSession session) {
		String admin = ((AuthInfo)session.getAttribute("authInfo")).getM_admin();
		System.out.println("지금 나의 admin숫자는 = " + admin);
		List<CheyongAddDTO> lists = cheyongRepository.selectLists();

		model.addAttribute("cheyongLists",lists);
		model.addAttribute("admin",admin);
	}
	public void selectOneList(Model model, String num,HttpSession session) {
		String admin = ((AuthInfo)session.getAttribute("authInfo")).getM_admin();
		CheyongAddDTO dto = cheyongRepository.selectOneList(num);
		model.addAttribute("cheyongOneList",dto);
		model.addAttribute("admin",admin);
	}
}
