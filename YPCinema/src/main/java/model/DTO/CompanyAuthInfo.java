package model.DTO;

import java.io.Serializable;

@SuppressWarnings("serial")
public class CompanyAuthInfo implements Serializable {
	private String c_id;			// id..
	private String c_num;		// 회원번호...
	private String c_name;		// 이름...
	private String c_picture;
	private String c_admin;		// 회원유형...
	private String mode;	// 직원 또는 관리자일 때. 이용자모드/관리자모드...
	
	
	public String getC_id() {
		return c_id;
	}
	public void setC_id(String c_id) {
		this.c_id = c_id;
	}
	public String getC_num() {
		return c_num;
	}
	public void setC_num(String c_num) {
		this.c_num = c_num;
	}
	public String getC_name() {
		return c_name;
	}
	public void setC_name(String c_name) {
		this.c_name = c_name;
	}
	public String getC_picture() {
		return c_picture;
	}
	public void setC_picture(String c_picture) {
		this.c_picture = c_picture;
	}
	public String getC_admin() {
		return c_admin;
	}
	public void setC_admin(String c_admin) {
		this.c_admin = c_admin;
	}
	public String getMode() {
		return mode;
	}
	public void setMode(String mode) {
		this.mode = mode;
	}
	
}
