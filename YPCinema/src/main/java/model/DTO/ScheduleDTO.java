package model.DTO;

import java.io.Serializable;
import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

@SuppressWarnings("serial")
public class ScheduleDTO implements Serializable {
	private String gnmu_num;
	private String gbun_num;
	private String staff_num;
	@DateTimeFormat(pattern="yyyy-MM-dd")		// 요런식으로.. 간단하게 포맷 설정..
	private Date gnmu_date;
	private String gnmu_stime;
	private String gnmu_etime;
	private String gnmu_bigo;
	private String gnmu_yunt;
	private String gnmu_yat;
	private String gnmu_time;
	
	public String getGnmu_num() {
		return gnmu_num;
	}
	public void setGnmu_num(String gnmu_num) {
		this.gnmu_num = gnmu_num;
	}
	public String getGbun_num() {
		return gbun_num;
	}
	public void setGbun_num(String gbun_num) {
		this.gbun_num = gbun_num;
	}
	public String getStaff_num() {
		return staff_num;
	}
	public void setStaff_num(String staff_num) {
		this.staff_num = staff_num;
	}
	public Date getGnmu_date() {
		return gnmu_date;
	}
	public void setGnmu_date(Date gnmu_date) {
		this.gnmu_date = gnmu_date;
	}
	public String getGnmu_stime() {
		return gnmu_stime;
	}
	public void setGnmu_stime(String gnmu_stime) {
		this.gnmu_stime = gnmu_stime;
	}
	public String getGnmu_etime() {
		return gnmu_etime;
	}
	public void setGnmu_etime(String gnmu_etime) {
		this.gnmu_etime = gnmu_etime;
	}
	public String getGnmu_bigo() {
		return gnmu_bigo;
	}
	public void setGnmu_bigo(String gnmu_bigo) {
		this.gnmu_bigo = gnmu_bigo;
	}
	public String getGnmu_yunt() {
		return gnmu_yunt;
	}
	public void setGnmu_yunt(String gnmu_yunt) {
		this.gnmu_yunt = gnmu_yunt;
	}
	public String getGnmu_yat() {
		return gnmu_yat;
	}
	public void setGnmu_yat(String gnmu_yat) {
		this.gnmu_yat = gnmu_yat;
	}
	public String getGnmu_time() {
		return gnmu_time;
	}
	public void setGnmu_time(String gnmu_time) {
		this.gnmu_time = gnmu_time;
	}
}