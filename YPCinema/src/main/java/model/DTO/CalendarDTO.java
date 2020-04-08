package model.DTO;

import java.io.Serializable;

@SuppressWarnings("serial")
public class CalendarDTO implements Serializable{
	private String yoil;
	private String nalzza;
	public String getYoil() {
		return yoil;
	}
	public void setYoil(String yoil) {
		this.yoil = yoil;
	}
	public String getNalzza() {
		return nalzza;
	}
	public void setNalzza(String nalzza) {
		this.nalzza = nalzza;
	}
	
	
}
