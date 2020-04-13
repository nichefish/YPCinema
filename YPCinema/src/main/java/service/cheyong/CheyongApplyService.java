package service.cheyong;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import command.cheyong.CheyongApplyCommand;
import command.cheyong.StaffCommand;
import model.DTO.AuthInfo;
import model.DTO.CheyongApplyDTO;
import model.DTO.MemberDTO;
import model.DTO.StaffDTO;
import repository.cheyong.CheyongRepository;
import repository.cheyong.ContractRepository;
import repository.member.MemberRepository;

@Service
public class CheyongApplyService {
	@Autowired
	MemberRepository memberRepository;
	@Autowired
	CheyongRepository cheyongRepository;
	
	public void memberInfo(HttpSession session, Model model,String che_num) {
		String num = ((AuthInfo)session.getAttribute("authInfo")).getM_num();
		MemberDTO dto = memberRepository.selectUseNum(num);
		model.addAttribute("userInfo",dto);
		model.addAttribute("che_num",che_num);
		model.addAttribute("m_num",num);
	}
	public void staffApply(CheyongApplyCommand cheyongApplyCommand) {
		CheyongApplyDTO dto = new CheyongApplyDTO();
		dto.setR_num(cheyongApplyCommand.getR_num());
		dto.setChe_num(cheyongApplyCommand.getChe_num());
		dto.setM_num(cheyongApplyCommand.getM_num());
		dto.setR_hijijom(cheyongApplyCommand.getR_hijijom());
		dto.setR_gadate(cheyongApplyCommand.getR_gadate());
		dto.setR_time(cheyongApplyCommand.getR_time());
		dto.setR_dis(cheyongApplyCommand.getR_dis());
		dto.setR_price(cheyongApplyCommand.getR_price());
		dto.setR_career(cheyongApplyCommand.getR_career());
		dto.setR_per(cheyongApplyCommand.getR_per());
		dto.setR_jiwon(cheyongApplyCommand.getR_jiwon());
		cheyongRepository.insertJiwon(dto);
	}
	public void selectJiwonList_M(Model model,HttpSession session) {
		String num = ((AuthInfo)session.getAttribute("authInfo")).getM_num();
		List<CheyongApplyDTO> list = cheyongRepository.selectJiwonList_M(num);
		AuthInfo authInfo = (AuthInfo)session.getAttribute("authInfo");
		authInfo.setCheyongApply(list);
		model.addAttribute("selectMyApply",list);	
	}
	public void myApplyInfo(String r_num, Model model, HttpSession session) {
		String num = ((AuthInfo)session.getAttribute("authInfo")).getM_admin();
		CheyongApplyDTO dto = cheyongRepository.selectApplyOne(r_num);
		MemberDTO mdto = memberRepository.selectUseNum(dto.getM_num());
		model.addAttribute("mdto",mdto);
		model.addAttribute("selectApplyOne",dto);
		model.addAttribute("m_admin", num);
	}
	//apply 수정페이지열기
	public void myApplyModify(String rNum, String mNum, Model model) {
		CheyongApplyDTO dto = cheyongRepository.selectApplyOne(rNum);
		MemberDTO mdto = memberRepository.selectUseNum(mNum);
		model.addAttribute("userInfo",mdto);
		model.addAttribute("modi",dto);
	}
	//apply 수정 update
	public void modifyApply(CheyongApplyCommand cheyongApplyCommand) {
		CheyongApplyDTO dto = new CheyongApplyDTO();
		dto.setR_num(cheyongApplyCommand.getR_num());
		dto.setR_gadate(cheyongApplyCommand.getR_gadate());
		dto.setR_time(cheyongApplyCommand.getR_time());
		dto.setR_dis(cheyongApplyCommand.getR_dis());
		dto.setR_price(cheyongApplyCommand.getR_price());
		dto.setR_career(cheyongApplyCommand.getR_career());
		dto.setR_per(cheyongApplyCommand.getR_per());
		dto.setR_jiwon(cheyongApplyCommand.getR_jiwon());
		cheyongRepository.updateApply(dto);
	}
	//apply 삭제
	public void deleteApply(String r_num) {
		cheyongRepository.deleteApply(r_num);
	}
	// 관리자(전체 이력서목록)
	public void selectApplyLists(Model model) {
		List<CheyongApplyDTO> dto = cheyongRepository.selectAllApply();
		model.addAttribute("allApplyLists",dto);
	}
	//관리자 (apply 열람으로 변경)
	public void readBtn(String r_num) {
		cheyongRepository.readBtn(r_num);
	}
	//관리자 (진행상황 변경)
	public void changeJinhyeng(String r_num,String r_jin,String m_num,String jic_num,String theater_name) {
		String theater_num = cheyongRepository.findTheaterNum(theater_name);
		System.out.println("theater_num ="+ theater_num);
		StaffDTO sto = new StaffDTO();
		sto.setM_num(m_num);
		sto.setTheater_num(theater_num);
		sto.setJic_num(jic_num);
		
		CheyongApplyDTO dto = new CheyongApplyDTO();
		if(r_jin.equals("합격목걸이")) {
			System.out.println("합격목걸이 들어옴");
			dto.setR_num(r_num);
			dto.setR_jin(r_jin);
			cheyongRepository.changeJinhyengStaff(dto);
			cheyongRepository.youStaffInfo(sto);
		}else {
			System.out.println("아닌것이 들어옴");
			dto.setR_num(r_num);
			dto.setR_jin(r_jin);
			cheyongRepository.changeJinhyeng(dto);
			cheyongRepository.checkStaff(m_num);
		}
	}
}
