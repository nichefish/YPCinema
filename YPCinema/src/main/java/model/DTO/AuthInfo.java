package model.DTO;

import java.io.Serializable;

@SuppressWarnings("serial")
public class AuthInfo implements Serializable {
	private String m_id;			// id..
	private String m_num;		// 회원번호...
	private String m_name;		// 이름...
	private String m_picture;
	private String m_admin;		// 회원유형...
	private String mode;			// 직원 또는 관리자일 때. 이용자모드/관리자모드...
	private String staff_num;
	private String theater;
	private ScheduleDTO schedule;
	private GngijunDTO gnmu;
	
	public String getM_id() {
		return m_id;
	}
	public void setM_id(String m_id) {
		this.m_id = m_id;
	}
	public String getM_num() {
		return m_num;
	}
	public void setM_num(String m_num) {
		this.m_num = m_num;
	}
	public String getM_name() {
		return m_name;
	}
	public void setM_name(String m_name) {
		this.m_name = m_name;
	}
	public String getM_picture() {
		return m_picture;
	}
	public void setM_picture(String m_picture) {
		this.m_picture = m_picture;
	}
	public String getM_admin() {
		return m_admin;
	}
	public void setM_admin(String m_admin) {
		this.m_admin = m_admin;
	}
	public String getMode() {
		return mode;
	}
	public void setMode(String mode) {
		this.mode = mode;
	}
	public String getStaff_num() {
		return staff_num;
	}
	public void setStaff_num(String staff_num) {
		this.staff_num = staff_num;
	}
	public String getTheater() {
		return theater;
	}
	public void setTheater(String theater) {
		this.theater = theater;
	}
	public ScheduleDTO getSchedule() {
		return schedule;
	}
	public void setSchedule(ScheduleDTO schedule) {
		this.schedule = schedule;
	}
	public GngijunDTO getGnmu() {
		return gnmu;
	}
	public void setGnmu(GngijunDTO gnmu) {
		this.gnmu = gnmu;
	}
}
