package controller.company;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import command.company.CompanyCommand;
import service.company.CompanyJoinService;

@Controller

public class CompanyJoinController {
	@Autowired
	private CompanyJoinService companyJoinService;
	
	@RequestMapping(value="/companyRegister", method=RequestMethod.GET)
	public String companyJoinAgree() {
		return "company/company_yacgan";
	}
	
	@RequestMapping(value="/companyRegister", method=RequestMethod.POST)
	public String companyJoinForm(CompanyCommand companyCommand) {
		return "company/company_join";
	}
	
	@RequestMapping(value="/companyJoinAction", method=RequestMethod.POST)
	public String companyJoinAction(CompanyCommand companyCommand, Errors errors) {
		companyJoinService.companyJoin(companyCommand, errors);
		return "company/company_welcome";
	}
	
}
