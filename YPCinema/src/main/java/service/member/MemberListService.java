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

	public void searchMember(Model model, String searchType, String searchValue) {
		MemberDTO member = new MemberDTO();
		if (searchType.equals("m_id")) {
			member.setM_id(searchValue);
			List<MemberDTO> lists = memberRepository.searchMemberId(member);
			model.addAttribute("lists", lists);
		} else if (searchType.equals("m_name")) {
			member.setM_name(searchValue);
			List<MemberDTO> lists = memberRepository.searchMemberName(member);
			model.addAttribute("lists", lists);
		}
		
	}
}
