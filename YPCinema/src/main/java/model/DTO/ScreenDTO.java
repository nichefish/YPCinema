package model.DTO;

import java.io.Serializable;

@SuppressWarnings("serial")
public class ScreenDTO implements Serializable {
	private String screen_num;
	private String screen_name;
	private String theater_num;
	private String theater_name;
	private Integer screen_max_seat;
	private String screen_row;
	private String [] screen_row_array;
	private String screen_col;
	private String screen_rating;
	
	public String getScreen_num() {
		return screen_num;
	}
	public void setScreen_num(String screen_num) {
		this.screen_num = screen_num;
	}
	public String getScreen_name() {
		return screen_name;
	}
	public void setScreen_name(String screen_name) {
		this.screen_name = screen_name;
	}
	public void setScreen_row_array(String[] screen_row_array) {
		this.screen_row_array = screen_row_array;
	}
	public String getTheater_num() {
		return theater_num;
	}
	public void setTheater_num(String theater_num) {
		this.theater_num = theater_num;
	}
	public String getTheater_name() {
		return theater_name;
	}
	public void setTheater_name(String theater_name) {
		this.theater_name = theater_name;
	}
	public Integer getScreen_max_seat() {
		return screen_max_seat;
	}
	public void setScreen_max_seat(Integer screen_max_seat) {
		this.screen_max_seat = screen_max_seat;
	}
	public String getScreen_row() {
		return screen_row;
	}
	public void setScreen_row(String screen_row) {
		this.screen_row = screen_row;
	}
	public String[] getScreen_row_array() {
		return screen_row_array;
	}
	public void setScreen_row_array(String screen_row) {
		this.screen_row_array = this.getScreen_row().split("-");
	}
	public String getScreen_col() {
		return screen_col;
	}
	public void setScreen_col(String screen_col) {
		this.screen_col = screen_col;
	}
	public String getScreen_rating() {
		return screen_rating;
	}
	public void setScreen_rating(String screen_rating) {
		this.screen_rating = screen_rating;
	}
}
