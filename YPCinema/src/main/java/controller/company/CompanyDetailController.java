package controller.company;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import service.company.CompanyDetailService;



@Controller
public class CompanyDetailController {
	@Autowired
	private CompanyDetailService companyDetailService;
	
	@RequestMapping("/companyMyPage")
	public String companyMyPage(HttpSession session, Model model) {
		companyDetailService.companyMypage(session, model);
		return "company/company_mypage";
	}
	
	@RequestMapping("/company/detail")
	public String companyDetail(@RequestParam("c_num") String c_num, Model model) {
		companyDetailService.companyDetail(c_num, model);
		return "company/company_detail";
	}
	
}
