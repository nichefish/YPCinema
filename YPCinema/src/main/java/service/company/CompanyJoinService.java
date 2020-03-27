package service.company;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.validation.Errors;

import command.company.CompanyCommand;
import model.DTO.CompanyDTO;
import repository.company.CompanyRepository;



@Service
public class CompanyJoinService {
	@Autowired
	private CompanyRepository companyRepository;	
	@Autowired
	private BCryptPasswordEncoder bcryptPasswordEncoder;
	@Autowired
	private CompanyRegMailService companyRegMailService;
	
	public String companyJoin(CompanyCommand companyCommand, Errors errors) {
		CompanyDTO dto = new CompanyDTO();
		dto.setC_id(companyCommand.getC_id());
		dto.setC_pass(bcryptPasswordEncoder.encode(companyCommand.getC_pass()));
		dto.setC_companynum(companyCommand.getC_companynum());
		dto.setC_name(companyCommand.getC_name());
		dto.setC_ceoname(companyCommand.getC_ceoname());
		dto.setC_comname(companyCommand.getC_comname());
		dto.setC_gen(companyCommand.getC_gen());
		dto.setC_birth(companyCommand.getC_birth());
		dto.setC_ceoph(companyCommand.getC_ceoph());
		dto.setC_comph(companyCommand.getC_comph());
		dto.setC_email(companyCommand.getC_email());
		dto.setC_zip(companyCommand.getC_zip());
		dto.setC_zip1(companyCommand.getC_zip1());
		dto.setC_addr1(companyCommand.getC_addr1());
		dto.setC_addr2(companyCommand.getC_addr2());
		dto.setC_ceoaddr(companyCommand.getC_ceoaddr());
		dto.setC_ceoaddr2(companyCommand.getC_ceoaddr2());
		dto.setC_comaddr(companyCommand.getC_comaddr());
		dto.setC_comaddr2(companyCommand.getC_comaddr2());
		
		Integer result = companyRepository.insertCompany(dto);
		if (result == null) {	// 중복아이디..
			errors.rejectValue("userId", "duplicate");
			return "company/company_join_form";
		}
//		memberRegMailService.sendMail(dto.getUserEmail(), dto.getUserId());
		return "compnay/companyWelcome";
	}


	
//	public Integer numUpdate(String num, String receiver, String userId) {
//		MemberDTO memberDTO = new MemberDTO();
//		memberDTO.setJoinOk(num);
//		memberDTO.setUserEmail(receiver);
//		memberDTO.setUserId(userId);
//		return memberRepository.joinOkUpdate(memberDTO);
//	}
}
