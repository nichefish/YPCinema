package service.admin;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import command.admin.GngijunCommand;
import model.DTO.GngijunDTO;
import repository.admin.GnmuRepository;

@Service
public class GnmuTimeService {
	@Autowired
	GnmuRepository gnmuRepository;
	
	public GngijunDTO gnmuDetail(Model model, String gbun_num) {
		GngijunDTO dto = gnmuRepository.gnmuDetail(gbun_num);
		model.addAttribute("gnmuLists",dto);
		return dto;
	}
	//근무분류 리스트
	public void gnmuLists(Model model) {
		List<GngijunDTO> dto = gnmuRepository.gnmuLists();
		model.addAttribute("gnmuLists",dto);
	}
	//총 시간 ajax
	public void addAjax(Model model, String sTime, String eTime) {
		SimpleDateFormat format1 = new SimpleDateFormat("yyyy-MM-dd" +" "+ sTime);
		SimpleDateFormat format2 = new SimpleDateFormat("yyyy-MM-dd" +" "+ eTime);
		Date time = new Date();
		String time1 = format1.format(time);
		String time2 = format2.format(time);
		GngijunDTO dto = new GngijunDTO();
		dto.setGbunSTime(time1);
		dto.setGbunETime(time2);
		
		int a = gnmuRepository.totalTime(dto);

		if(a < 0) {
			GngijunDTO otd = new GngijunDTO();
			otd.setGbunSTime(time1);
			otd.setGbunETime(time2);
			String b = gnmuRepository.totalTime2(otd);
			model.addAttribute("totalTime",b);
		}else {
			GngijunDTO otd = new GngijunDTO();
			otd.setGbunSTime(time1);
			otd.setGbunETime(time2);
			String c = gnmuRepository.totalTime3(otd);
			model.addAttribute("totalTime", c);
		}
	}
	//근무분류 추가
	public void addGnmuTime(GngijunCommand gngijunCommand) {
		GngijunDTO dto = new GngijunDTO();
		dto.setGbunName(gngijunCommand.getGbunName());
		dto.setGbunSTime(gngijunCommand.getGbunSTime());
		dto.setGbunETime(gngijunCommand.getGbunETime());
		dto.setGbunTotal(gngijunCommand.getGbunTotal());
		gnmuRepository.addGnmuTime(dto);
	}
	//근무분류 삭제
	public void deleteTime(String gbunNum) {
		gnmuRepository.deleteGnmuTime(gbunNum);
	}
}
