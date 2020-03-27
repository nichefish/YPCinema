package service.company;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import model.DTO.CompanyDTO;
import repository.company.CompanyRepository;

@Service
public class CompanyListService {
	@Autowired
	private CompanyRepository companyRepository;

	public void selectCompanyAll(Model model) {
		List<CompanyDTO> lists = companyRepository.selectCompanyAll();
		model.addAttribute("lists", lists);
	}

}
