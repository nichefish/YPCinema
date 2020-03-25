package command.showtime;

import java.util.Date;
import java.util.List;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.format.annotation.DateTimeFormat.ISO;

import model.DTO.TheaterAddDTO;

public class ShowtimeCommand {
	private String show_num;
	private String theater_num;
	private String screen_num;
	private String movie_num;
	@DateTimeFormat(pattern="yyyy-MM-dd")		// 요런식으로.. 간단하게 포맷 설정..
	private Date show_date;
	private String show_start;
	private String show_end;
	private List<TheaterAddDTO> theater_list;
	
	public String getShow_num() {
		return show_num;
	}
	public void setShow_num(String show_num) {
		this.show_num = show_num;
	}
	public String getTheater_num() {
		return theater_num;
	}
	public void setTheater_num(String theater_num) {
		this.theater_num = theater_num;
	}
	public String getScreen_num() {
		return screen_num;
	}
	public void setScreen_num(String screen_num) {
		this.screen_num = screen_num;
	}
	public String getMovie_num() {
		return movie_num;
	}
	public void setMovie_num(String movie_num) {
		this.movie_num = movie_num;
	}
	public Date getShow_date() {
		return show_date;
	}
	public void setShow_date(Date show_date) {
		this.show_date = show_date;
	}
	public String getShow_start() {
		return show_start;
	}
	public void setShow_start(String show_start) {
		this.show_start = show_start;
	}
	public String getShow_end() {
		return show_end;
	}
	public void setShow_end(String show_end) {
		this.show_end = show_end;
	}
	public List<TheaterAddDTO> getTheater_list() {
		return theater_list;
	}
	public void setTheater_list(List<TheaterAddDTO> theater_list) {
		this.theater_list = theater_list;
	}
}
