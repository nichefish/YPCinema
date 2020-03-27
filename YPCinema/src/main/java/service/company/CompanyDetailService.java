package service.company;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.sun.xml.internal.bind.v2.model.core.ID;

import model.DTO.CompanyAuthInfo;
import model.DTO.CompanyDTO;
import repository.company.CompanyRepository;



@Service
public class CompanyDetailService {
	@Autowired
	private CompanyRepository companyRepository;
	
	public void companyMypage(HttpSession session, Model model) {
		CompanyDTO company = new CompanyDTO();
		company.setC_id(((CompanyAuthInfo)(session.getAttribute("companyAuthInfo"))).getC_id());
		model.addAttribute("companyCommand", companyRepository.selectByUserInfo(company));
	}

	public void companyDetail(String c_num, Model model) {
		CompanyDTO company = new CompanyDTO();
		company.setC_num(c_num);
		model.addAttribute("companyCommand", companyRepository.selectByUserInfo(company));
	}
}
