package service.member;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import model.DTO.MemberDTO;
import repository.member.MemberRepository;

@Service
public class MemberListService {
	@Autowired
	private MemberRepository memberRepository;

	public void selectMemberAll(Model model) {
		List<MemberDTO> lists = memberRepository.selectMemberAll();
		model.addAttribute("lists", lists);
	}

	public void searchMember(String search_type, String search_value, Model model) {
		MemberDTO member = new MemberDTO();
		if (search_type.equals("m_id")) {
			member.setM_id(search_value);
		} else if (search_type.equals("m_name")) {
			member.setM_name(search_value);
		}
		List<MemberDTO> lists = memberRepository.searchMember(member);
		model.addAttribute("lists", lists);
	}
}
