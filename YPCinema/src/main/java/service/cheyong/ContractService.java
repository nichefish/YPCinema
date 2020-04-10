package service.cheyong;

import java.io.ByteArrayInputStream;
import java.nio.file.Path;
import java.util.Base64;
import java.util.List;

import javax.servlet.http.HttpSession;
import javax.xml.bind.DatatypeConverter;

import org.apache.tomcat.jni.File;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import model.DTO.AuthInfo;
import model.DTO.CheyongApplyDTO;
import model.DTO.ContractDTO;
import model.DTO.MemberDTO;
import model.DTO.StaffDTO;
import repository.cheyong.CheyongRepository;
import repository.cheyong.ContractRepository;
import repository.member.MemberRepository;

@Service
public class ContractService {
	@Autowired
	CheyongRepository cheyongRepository;
	@Autowired
	MemberRepository memberRepository;
	@Autowired
	ContractRepository contractRepository;
	public void selectCont(String m_num, String r_num,Model model) {
		MemberDTO dto = memberRepository.selectUseNum(m_num);
		CheyongApplyDTO cdto = cheyongRepository.selectApplyOne(r_num);
		model.addAttribute("userInfo",dto);
		model.addAttribute("resume",cdto);
	}
	public void insertContract(String m_num, String r_num, String canvas) {
		//staff num 구하기
		StaffDTO dto = contractRepository.findStaff(m_num);
		// 앞에 값으로 나오는 data:image/png;base64,를 자르고 디코드한 후 그 값을 바로 db에 넣는다. (canvas가 input type="hidden"으로 가져온 값)
		String Base64Prifix = "data:image/png;base64,";
		byte[] imgBytes = Base64.getDecoder().decode(canvas.substring(Base64Prifix.length()));
		ContractDTO cto = new ContractDTO();
		cto.setStaff_num(dto.getStaff_num());
		cto.setCon_sign(imgBytes.toString());
		cto.setR_num(r_num);
		contractRepository.insertContract(cto);

	}
	public void selectContractLists(Model model,HttpSession session) {
		String num = ((AuthInfo)session.getAttribute("authInfo")).getM_num();
		StaffDTO dto = contractRepository.findStaff(num);
		String staff_num = dto.getStaff_num();
		List<ContractDTO> lists = contractRepository.selectContractLists(staff_num);
		model.addAttribute("lists",lists);
	}


}
