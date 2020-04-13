package model.DTO;

public class MovieRatingDTO {
	Integer ratingA;
	Integer ratingB;
	String theater_special;
	public Integer getRatingA() {
		return ratingA;
	}
	public void setRatingA(Integer ratingA) {
		this.ratingA = ratingA;
	}
	public Integer getRatingB() {
		return ratingB;
	}
	public void setRatingB(Integer ratingB) {
		this.ratingB = ratingB;
	}
	public String getTheater_special() {
		return theater_special;
	}
	public void setTheater_special(String theater_special) {
		this.theater_special = theater_special;
	}
}
