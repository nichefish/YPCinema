package model.DTO;

import java.io.Serializable;

@SuppressWarnings("serial")
public class StaffDTO implements Serializable{
	private String staff_num;
	private String m_num;
	private String theater_num;
	private String jic_num;
	private String staff_date;
	private String staff_bank;
	private String staff_banknum;
	
	public String getStaff_num() {
		return staff_num;
	}
	public void setStaff_num(String staff_num) {
		this.staff_num = staff_num;
	}
	public String getM_num() {
		return m_num;
	}
	public void setM_num(String m_num) {
		this.m_num = m_num;
	}
	public String getTheater_num() {
		return theater_num;
	}
	public void setTheater_num(String theater_num) {
		this.theater_num = theater_num;
	}
	public String getJic_num() {
		return jic_num;
	}
	public void setJic_num(String jic_num) {
		this.jic_num = jic_num;
	}
	public String getStaff_date() {
		return staff_date;
	}
	public void setStaff_date(String staff_date) {
		this.staff_date = staff_date;
	}
	public String getStaff_bank() {
		return staff_bank;
	}
	public void setStaff_bank(String staff_bank) {
		this.staff_bank = staff_bank;
	}
	public String getStaff_banknum() {
		return staff_banknum;
	}
	public void setStaff_banknum(String staff_banknum) {
		this.staff_banknum = staff_banknum;
	}
	
	

}
