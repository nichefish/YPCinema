package controller.company;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import service.company.CompanyListService;

@Controller
public class CompanyListController {
	@Autowired
	private CompanyListService companyListService;
	
	@RequestMapping("/company/list")
	public String memberList(Model model) {
		companyListService.selectCompanyAll(model);
		return "company/company_list";
	}
}
