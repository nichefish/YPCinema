package service.member;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.validation.Errors;

import command.member.MemberCommand;
import model.DTO.MemberDTO;
import repository.member.MemberRepository;
import service.payment.SendSMS;

@Service
public class MemberJoinService {
	@Autowired
	private MemberRepository memberRepository;	
	@Autowired
	private BCryptPasswordEncoder bcryptPasswordEncoder;
	@Autowired
	private MemberRegMailService memberRegMailService;
	
	public String memberJoin(MemberCommand memberCommand, Errors errors, HttpServletRequest request) {
		MemberDTO dto = new MemberDTO();
		dto.setM_id(memberCommand.getM_id());
		dto.setM_pass(bcryptPasswordEncoder.encode(memberCommand.getM_pass()));
		dto.setM_name(memberCommand.getM_name());
		dto.setM_gen(memberCommand.getM_gen());
		dto.setM_birth(memberCommand.getM_birth());
		dto.setM_ph(memberCommand.getM_ph());
		dto.setM_email(memberCommand.getM_email());
		dto.setM_picture("/YPCinema/img/empty_person.png");
		dto.setM_zip(memberCommand.getM_zip());
		dto.setM_addr1(memberCommand.getM_addr1());
		dto.setM_addr2(memberCommand.getM_addr2());
		
		Integer result = memberRepository.insertMember(dto);
		if (result == null) {	// 중복아이디..
			errors.rejectValue("userId", "duplicate");
			return "member/member_join_form";
		}
		memberRegMailService.sendMemberJoinMail(dto);
		SendSMS sendSMS = new SendSMS();
		try {
			sendSMS.sendMemberJoinSMS(memberCommand, request);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "member/memberWelcome";
	}
	
	public Integer numUpdate(String num, String receiver, String userId) {
		MemberDTO memberDTO = new MemberDTO();
		memberDTO.setJoin_ok(num);
		memberDTO.setM_email(receiver);
		memberDTO.setM_id(userId);
		return memberRepository.joinOkUpdate(memberDTO);
	}
}
