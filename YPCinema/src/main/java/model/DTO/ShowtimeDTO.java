package model.DTO;

import java.io.Serializable;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.format.annotation.DateTimeFormat.ISO;

@SuppressWarnings("serial")
public class ShowtimeDTO implements Serializable {
	private String show_num;
	private String theater_num;
	private String screen_num;
	private String movie_num;
	@DateTimeFormat(pattern="yyyy-MM-dd")		// 요런식으로.. 간단하게 포맷 설정..
	private Date show_date;
	private String show_date_string;
	private Date show_start;
	private Date show_end;
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
	public String getShow_date_string() {
		return show_date_string;
	}
	public void setShow_date_string(Date show_date) {
		SimpleDateFormat dt = new SimpleDateFormat("yyyy-MM-dd");
		this.show_date_string = dt.format(show_date);
	}
	public void setShow_date_string(String show_date) {
		this.show_date_string = show_date;
	}
	public Date getShow_start() {
		return show_start;
	}
	public void setShow_start(Date show_start) {
		this.show_start = show_start;
	}
	public Date getShow_end() {
		return show_end;
	}
	public void setShow_end(Date show_end) {
		this.show_end = show_end;
	}
}
