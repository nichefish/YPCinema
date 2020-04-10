package controller.cheyong;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import service.cheyong.ContractService;

@Controller
public class ContractController {
	@Autowired
	ContractService contractService;
	@RequestMapping("/staff_writeContract")
	public String contract(@RequestParam(value="m_num")String m_num,@RequestParam(value="r_num")String r_num,Model model) {
		contractService.selectCont(m_num,r_num,model);
		return "cheyong/staff_writeContract";
	}
	@RequestMapping(value="/submitContract",method=RequestMethod.POST)
	public String submitContract(@RequestParam(value="hiddenM_num")String m_num,
								 @RequestParam(value="hiddenR_num")String r_num,
								 @RequestParam(value="please")String canvas) {
		contractService.insertContract(m_num,r_num,canvas);
		return "redirect:staff_myContracts";
	}
	@RequestMapping("/staff_myContracts")
	public String myContents(Model model, HttpSession session) {
		contractService.selectContractLists(model,session);
		return "staff/staff_myContracts";
	}
}
