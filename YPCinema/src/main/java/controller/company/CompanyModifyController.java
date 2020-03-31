package controller.company;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import command.company.CompanyCommand;
import service.company.CompanyDetailService;
import service.company.CompanyModifyService;


@Controller
public class CompanyModifyController {
	@Autowired
	private CompanyDetailService companyDetailService;
	@Autowired
	private CompanyModifyService companyModifyService;
	
	@RequestMapping(value="/companyMyPage/modify", method=RequestMethod.GET)
	public String myModifyForm(CompanyCommand companyCommand, HttpSession session, Model model) {
		companyDetailService.companyMypage(session, model);
		return "company/company_mymodify";
	}
	
	@RequestMapping(value="/companyMyPage/modify", method=RequestMethod.POST)
	public String myModifyAction(CompanyCommand companyCommand, HttpSession session, Errors errors) {
		companyModifyService.modifyMyInfo(companyCommand, session, errors);
		return "redirect:/company_myPage";
	}
	
	@RequestMapping(value="/company/modify", method=RequestMethod.GET)
	public String companyModifyForm(@RequestParam(value="c_num") String c_num, CompanyCommand comapanyCommand, Model model) {
		companyDetailService.companyDetail(c_num, model);
		return "company/company_modify";
	}
	
	@RequestMapping(value="/company/modify", method=RequestMethod.POST)
	public String companyModifyAction(CompanyCommand companyCommand, Errors errors) {
		companyModifyService.modifyCompanyInfo(companyCommand, errors);
		return "redirect:/company/detail?c_num=" + companyCommand.getC_num();
	}
	
}
