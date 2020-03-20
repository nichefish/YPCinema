package model.DTO;

import java.io.Serializable;
import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

@SuppressWarnings("serial")
public class MovieDTO implements Serializable {
	private String movie_num;
	private String movie_title;
	private String movie_director;
	private String movie_nation;
	@DateTimeFormat(pattern="yyyy-MM-dd")		// 요런식으로.. 간단하게 포맷 설정..
	private Date movie_date;
	private String movie_genre;
	private String movie_plot;
	private String movie_age;
	private Integer movie_runtime;
	private String movie_poster_url;
	private String movie_still_url;
	private Integer movie_aud_acc;
	private Integer movie_sales_acc;
	private Integer movie_score;
	private Double movie_rating;
	
	public String getMovie_num() {
		return movie_num;
	}
	public void setMovie_num(String movie_num) {
		this.movie_num = movie_num;
	}
	public String getMovie_title() {
		return movie_title;
	}
	public void setMovie_title(String movie_title) {
		this.movie_title = movie_title;
	}
	public String getMovie_director() {
		return movie_director;
	}
	public void setMovie_director(String movie_director) {
		this.movie_director = movie_director;
	}
	public String getMovie_nation() {
		return movie_nation;
	}
	public void setMovie_nation(String movie_nation) {
		this.movie_nation = movie_nation;
	}
	public Date getMovie_date() {
		return movie_date;
	}
	public void setMovie_date(Date movie_date) {
		this.movie_date = movie_date;
	}
	public String getMovie_genre() {
		return movie_genre;
	}
	public void setMovie_genre(String movie_genre) {
		this.movie_genre = movie_genre;
	}
	public String getMovie_plot() {
		return movie_plot;
	}
	public void setMovie_plot(String movie_plot) {
		this.movie_plot = movie_plot;
	}
	public String getMovie_age() {
		return movie_age;
	}
	public void setMovie_age(String movie_age) {
		this.movie_age = movie_age;
	}
	public Integer getMovie_runtime() {
		return movie_runtime;
	}
	public void setMovie_runtime(Integer movie_runtime) {
		this.movie_runtime = movie_runtime;
	}
	public String getMovie_poster_url() {
		return movie_poster_url;
	}
	public void setMovie_poster_url(String movie_poster_url) {
		this.movie_poster_url = movie_poster_url;
	}
	public String getMovie_still_url() {
		return movie_still_url;
	}
	public void setMovie_still_url(String movie_still_url) {
		this.movie_still_url = movie_still_url;
	}
	public Integer getMovie_aud_acc() {
		return movie_aud_acc;
	}
	public void setMovie_aud_acc(Integer movie_aud_acc) {
		this.movie_aud_acc = movie_aud_acc;
	}
	public Integer getMovie_sales_acc() {
		return movie_sales_acc;
	}
	public void setMovie_sales_acc(Integer movie_sales_acc) {
		this.movie_sales_acc = movie_sales_acc;
	}
	public Integer getMovie_score() {
		return movie_score;
	}
	public void setMovie_score(Integer movie_score) {
		this.movie_score = movie_score;
	}
	public Double getMovie_rating() {
		return movie_rating;
	}
	public void setMovie_rating(Double movie_rating) {
		this.movie_rating = movie_rating;
	}
}
