package service.cheyong;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import command.cheyong.GonggoCommand;
import model.DTO.CheyongAddDTO;
import model.DTO.TheaterAddDTO;
import repository.cheyong.CheyongRepository;

@Service
public class CheyongAddService {
	@Autowired
	CheyongRepository cheyongRepository;
	public void execute(Model model) {
		SimpleDateFormat format1 = new SimpleDateFormat("yyyy-MM-dd");
		Date time = new Date();
		String sysdate = format1.format(time);
		
		model.addAttribute("sysdate",sysdate);
	}
	
	public void insert(GonggoCommand g) {
		CheyongAddDTO dto = new CheyongAddDTO();
		dto.setChe_subject(g.getChe_subject());
		dto.setChe_jijom(g.getChe_jijom());
		dto.setChe_person(g.getChe_person());
		dto.setChe_jogun(g.getChe_jogun());
		dto.setChe_bocri(g.getChe_bocri());
		dto.setChe_jagyuc(g.getChe_jagyuc());
		dto.setChe_gita(g.getChe_gita());
		dto.setChe_sijac_string(g.getChe_sijac_string());
		dto.setChe_magam_string(g.getChe_magam_string());
		cheyongRepository.insertCheyong(dto);
	}
	
	public void jijomgumsec(Model model,String jj) {
		List<TheaterAddDTO> list = cheyongRepository.jijomgumsec(jj);
		model.addAttribute("jijomgumsec",list);
	}
}
