package model.DTO;

import java.io.Serializable;

@SuppressWarnings("serial")
public class ContractDTO implements Serializable{
	private String con_num;
	private String staff_num;
	private String con_content;
	private String con_gbyu;
	private String con_gmtime;
	private String con_date;
	private String con_sign;
	private String r_num;
	public String getCon_num() {
		return con_num;
	}
	public void setCon_num(String con_num) {
		this.con_num = con_num;
	}
	public String getStaff_num() {
		return staff_num;
	}
	public void setStaff_num(String staff_num) {
		this.staff_num = staff_num;
	}
	public String getCon_content() {
		return con_content;
	}
	public void setCon_content(String con_content) {
		this.con_content = con_content;
	}
	public String getCon_gbyu() {
		return con_gbyu;
	}
	public void setCon_gbyu(String con_gbyu) {
		this.con_gbyu = con_gbyu;
	}
	public String getCon_gmtime() {
		return con_gmtime;
	}
	public void setCon_gmtime(String con_gmtime) {
		this.con_gmtime = con_gmtime;
	}
	public String getCon_date() {
		return con_date;
	}
	public void setCon_date(String con_date) {
		this.con_date = con_date;
	}
	public String getCon_sign() {
		return con_sign;
	}
	public void setCon_sign(String con_sign) {
		this.con_sign = con_sign;
	}
	public String getR_num() {
		return r_num;
	}
	public void setR_num(String r_num) {
		this.r_num = r_num;
	}
	
	
}
