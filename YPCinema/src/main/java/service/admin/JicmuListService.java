package service.admin;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import model.DTO.AuthInfo;
import model.DTO.JicmuDTO;
import model.DTO.MemberDTO;
import model.DTO.TheaterAddDTO;
import repository.admin.JicmuRepository;
import repository.member.MemberRepository;


@Service
public class JicmuListService {
	@Autowired
	JicmuRepository jicmuRepository;
	@Autowired
	MemberRepository memberReository;
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
	public void admin(HttpSession session, Model model) {
		String m_num = ((AuthInfo)session.getAttribute("authInfo")).getM_num();
		MemberDTO dto = memberReository.findePhoneNum(m_num);
		model.addAttribute("mdto",dto);
	}
}
