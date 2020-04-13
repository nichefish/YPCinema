package service.member;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.validation.Errors;

import org.springframework.web.multipart.MultipartFile;
import command.member.MemberCommand;
import model.DTO.AuthInfo;
import model.DTO.MemberDTO;
import repository.member.MemberRepository;

@Service
public class MemberModifyService {
	@Autowired
	private MemberRepository memberRepository;
	@Autowired
	private BCryptPasswordEncoder bcryptPasswordEncoder;

	public String modifyMyInfo(MemberCommand memberCommand, HttpSession session, Errors errors, HttpServletRequest request) {
		MemberDTO member = new MemberDTO();
		member.setM_id(((AuthInfo)(session.getAttribute("authInfo"))).getM_id());
		member = memberRepository.selectByUserInfo(member);
		if (bcryptPasswordEncoder.matches(memberCommand.getM_pass(), member.getM_pass())) {
			member.setM_pass(memberCommand.getM_pass());
			member.setM_name(memberCommand.getM_name());
			member.setM_gen(memberCommand.getM_gen());
			member.setM_birth(memberCommand.getM_birth());
			member.setM_ph(memberCommand.getM_ph());
			member.setM_email(memberCommand.getM_email());
			member.setM_zip(memberCommand.getM_zip());
			member.setM_addr1(memberCommand.getM_addr1());
			member.setM_addr2(memberCommand.getM_addr2());
			
			if (memberCommand.getM_picture_file() != null) {
				System.out.println("!#!#:" + memberCommand.getM_picture_file());
				MultipartFile mf = memberCommand.getM_picture_file();
				String original = mf.getOriginalFilename();
				String originalFileExtension = original.substring(original.lastIndexOf("."));		// 마지막에 나오는 점 포함 기준으로 뒤쪽으로 자른 거...
				// UUID.. 랜덤으로 고유한 아이디를 부여할 때 쓰는 거라고...
				String store = UUID.randomUUID().toString().replace("-", "") + originalFileExtension;	// 랜덤생성한 유니크한 아이디에 확장자를 붙여줘서 새 파일명으로...
				String path = request.getServletContext().getRealPath("/");
				path += "WEB-INF\\view\\update";
				String storePath = "/YPCinema/update/" + store;
				File file = new File(path + "\\" + store);		// 파일 객체 생성- 아직 파일이 저장된 건 아님...
				try {
					mf.transferTo(file);
				} catch (IllegalStateException | IOException e) {	// 저장이 안 되는 경우는 용량초과인 경우... 에러 만들어주면 됨...
					e.printStackTrace();
				}
				System.out.println("store" + store);
				member.setM_picture(storePath);
			}
			Integer result = memberRepository.modifyMember(member);
			if (result == null) {	// 중복아이디..
				errors.rejectValue("userId", "duplicate");
				return "redirect:/myPage";
			}
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
