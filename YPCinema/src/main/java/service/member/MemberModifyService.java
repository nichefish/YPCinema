package service.member;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.validation.Errors;

import command.member.MemberCommand;
import model.DTO.AuthInfo;
import model.DTO.MemberDTO;
import repository.member.MemberRepository;

@Service
public class MemberModifyService {
	@Autowired
	private MemberRepository memberRepository;

	public String modifyMyInfo(MemberCommand memberCommand, HttpSession session, Errors errors) {
		MemberDTO member = new MemberDTO();
		member.setM_id(((AuthInfo)(session.getAttribute("authInfo"))).getM_id());
		// 비밀번호 비교...
		member.setM_name(memberCommand.getM_name());
		member.setM_gen(memberCommand.getM_gen());
		member.setM_gen(memberCommand.getM_gen());
		member.setM_birth(memberCommand.getM_birth());
		member.setM_ph(memberCommand.getM_ph());
		member.setM_email(memberCommand.getM_email());
		member.setM_zip(memberCommand.getM_zip());
		member.setM_addr1(memberCommand.getM_addr1());
		member.setM_addr2(memberCommand.getM_addr2());
		// 사진..
		Integer result = memberRepository.modifyMember(member);
		if (result == null) {	// 중복아이디..
			errors.rejectValue("userId", "duplicate");
			return "redirect:/myPage";
		}
		return "redirect:/myPage";
	}

	public void modifyMemberInfo(MemberCommand memberCommand, Errors errors) {
		MemberDTO member = new MemberDTO();
		member.setM_id(memberCommand.getM_id());
		// 비밀번호 비교...
		member.setM_name(memberCommand.getM_name());
		member.setM_gen(memberCommand.getM_gen());
		member.setM_gen(memberCommand.getM_gen());
		member.setM_birth(memberCommand.getM_birth());
		member.setM_ph(memberCommand.getM_ph());
		member.setM_email(memberCommand.getM_email());
		member.setM_zip(memberCommand.getM_zip());
		member.setM_addr1(memberCommand.getM_addr1());
		member.setM_addr2(memberCommand.getM_addr2());
		// 사진..
		Integer result = memberRepository.modifyMember(member);
		if (result == null) {	// 중복아이디..
			errors.rejectValue("userId", "duplicate");
			
		}
	}
}
