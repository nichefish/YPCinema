package service.cheyong;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import command.cheyong.CheyongApplyCommand;
import model.DTO.AuthInfo;
import model.DTO.CheyongApplyDTO;
import model.DTO.MemberDTO;
import repository.cheyong.CheyongRepository;
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
		model.addAttribute("selectMyApply",list);	
	}
	public void myApplyInfo(String r_num, Model model) {
		CheyongApplyDTO dto = cheyongRepository.selectApplyOne(r_num);
		MemberDTO mdto = memberRepository.selectUseNum(dto.getM_num());
		model.addAttribute("mdto",mdto);
		model.addAttribute("selectApplyOne",dto);
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
}
