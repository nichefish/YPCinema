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
}
