package service.admin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import command.admin.TheaterAddCommand;
import model.DTO.TheaterAddDTO;
import repository.admin.TheaterAddRepository;

@Service
public class TheaterAddService {
	@Autowired
	TheaterAddRepository theaterAddRepository;
	
	public void delete(String num) {
		theaterAddRepository.deleteTheater(num);
	}
	public void addPost(TheaterAddCommand theaterAddCommand) {
		TheaterAddDTO dto = new TheaterAddDTO();
		dto.setTheater_name(theaterAddCommand.getTheater_name());
		dto.setTheater_addr1(theaterAddCommand.getTheater_addr1());
		dto.setTheater_addr2(theaterAddCommand.getTheater_addr2());
		dto.setTheater_zip(theaterAddCommand.getTheater_zip());
		dto.setTheater_ph(theaterAddCommand.getTheater_ph());
		theaterAddRepository.insertTheaterAdd(dto);
	}
	public void execute(String num, Model model) {
		TheaterAddDTO dto = theaterAddRepository.selectTheater(num);
		model.addAttribute("numTheater",dto);
	}
	public void Modify(TheaterAddCommand theaterAddCommand) {
		TheaterAddDTO dto = new TheaterAddDTO();
		dto.setTheater_num(theaterAddCommand.getTheater_num());
		dto.setTheater_name(theaterAddCommand.getTheater_name());
		dto.setTheater_addr1(theaterAddCommand.getTheater_addr1());
		dto.setTheater_addr2(theaterAddCommand.getTheater_addr2());
		dto.setTheater_zip(theaterAddCommand.getTheater_zip());
		dto.setTheater_ph(theaterAddCommand.getTheater_ph());
		theaterAddRepository.updateTheater(dto);
	}
	public void modifySpecial(String theater_num, String theater_special) {
		TheaterAddDTO dto = new TheaterAddDTO();
		dto.setTheater_num(theater_num);
		dto.setTheater_special(theater_special);
		theaterAddRepository.modifySpecial(dto);
	}
	public void modifyRating(String theater_num) {
		TheaterAddDTO dto = new TheaterAddDTO();
		String theater_rating = "D";
		Integer countScreen = theaterAddRepository.countTheaterScreen(theater_num);
		Integer countMaxSeat = theaterAddRepository.countTheaterMaxSeat(theater_num);
		if (countScreen >= 6 && countMaxSeat >= 1200) {
			theater_rating = "A";
		} else if (countScreen >= 4 && countMaxSeat >= 800) {
			theater_rating = "B";
		} else if (countScreen >= 2 && countMaxSeat >= 400) {
			theater_rating = "C";
		}
		System.out.println("등급..." + theater_rating);
		dto.setTheater_num(theater_num);
		dto.setTheater_rating(theater_rating);
		theaterAddRepository.modifyRating(dto);
	}
}
