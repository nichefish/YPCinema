package service.company;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.validation.Errors;

import command.company.CompanyCommand;
import model.DTO.CompanyDTO;
import model.DTO.CompanyAuthInfo;
import repository.company.CompanyRepository;

@Service
public class CompanyModifyService {
	@Autowired
	private CompanyRepository companyRepository;

	public String modifyMyInfo(CompanyCommand companyCommand, HttpSession session, Errors errors) {
		CompanyDTO company = new CompanyDTO();
		company.setC_id(((CompanyAuthInfo)(session.getAttribute("companyAuthInfo"))).getC_id());
		// 비밀번호 비교...
		company.setC_companynum(companyCommand.getC_companynum());
		company.setC_name(companyCommand.getC_name());
		company.setC_ceoname(companyCommand.getC_ceoname());
		company.setC_comname(companyCommand.getC_comname());
		company.setC_gen(companyCommand.getC_gen());
		company.setC_birth(companyCommand.getC_birth());
		company.setC_ceoph(companyCommand.getC_ceoph());
		company.setC_comph(companyCommand.getC_comph());
		company.setC_email(companyCommand.getC_email());
		company.setC_zip(companyCommand.getC_zip());
		company.setC_zip1(companyCommand.getC_zip1());
		company.setC_ceoaddr(companyCommand.getC_ceoaddr());
		company.setC_ceoaddr2(companyCommand.getC_ceoaddr2());
		company.setC_comaddr(companyCommand.getC_comaddr());
		company.setC_comaddr2(companyCommand.getC_comaddr2());
		
		// 사진..
		Integer result = companyRepository.modifyCompany(company);
		if (result == null) {	// 중복아이디..
			errors.rejectValue("userId", "duplicate");
			return "redirect:/companyMyPage";
		}
		return "redirect:/companyMyPage";
	}

	public void modifyCompanyInfo(CompanyCommand companyCommand, Errors errors) {
		CompanyDTO company = new CompanyDTO();
		company.setC_id(companyCommand.getC_id());
		// 비밀번호 비교...
		company.setC_companynum(companyCommand.getC_companynum());
		company.setC_name(companyCommand.getC_name());
		company.setC_ceoname(companyCommand.getC_ceoname());
		company.setC_comname(companyCommand.getC_comname());
		company.setC_gen(companyCommand.getC_gen());
		company.setC_birth(companyCommand.getC_birth());
		company.setC_ceoph(companyCommand.getC_ceoph());
		company.setC_comph(companyCommand.getC_comph());
		company.setC_email(companyCommand.getC_email());
		company.setC_zip(companyCommand.getC_zip());
		company.setC_zip1(companyCommand.getC_zip1());
		company.setC_ceoaddr(companyCommand.getC_ceoaddr());
		company.setC_ceoaddr2(companyCommand.getC_ceoaddr2());
		company.setC_comaddr(companyCommand.getC_comaddr());
		company.setC_comaddr2(companyCommand.getC_comaddr2());
		// 사진..
		Integer result = companyRepository.modifyCompany(company);
		if (result == null) {	// 중복아이디..
			errors.rejectValue("userId", "duplicate");
			
		}
	}
}
