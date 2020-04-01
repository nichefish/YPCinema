package model.DTO;

import java.io.Serializable;
import java.util.Date;

@SuppressWarnings("serial")
public class CouponDTO implements Serializable{
	private String c_num;
	private String c_spe;
	private String c_name;
	private String c_content;
	private String c_score;
	private String c_symbol;
	private String menu_name;
	private String menu_type;
	
	private String balcuNum;
	private String mNum;
	private Date cDate;
	private Date cEDate;
	private String cUsed;
	
	public String getBalcuNum() {
		return balcuNum;
	}
	public void setBalcuNum(String balcuNum) {
		this.balcuNum = balcuNum;
	}

	public String getmNum() {
		return mNum;
	}
	public void setmNum(String mNum) {
		this.mNum = mNum;
	}
	public Date getcDate() {
		return cDate;
	}
	public void setcDate(Date cDate) {
		this.cDate = cDate;
	}
	public Date getcEDate() {
		return cEDate;
	}
	public void setcEDate(Date cEDate) {
		this.cEDate = cEDate;
	}
	public String getcUsed() {
		return cUsed;
	}
	public void setcUsed(String cUsed) {
		this.cUsed = cUsed;
	}

	// 끝
	public String getC_num() {
		return c_num;
	}
	public void setC_num(String c_num) {
		this.c_num = c_num;
	}
	public String getC_spe() {
		return c_spe;
	}
	public void setC_spe(String c_spe) {
		this.c_spe = c_spe;
	}
	public String getC_name() {
		return c_name;
	}
	public void setC_name(String c_name) {
		this.c_name = c_name;
	}
	public String getC_content() {
		return c_content;
	}
	public void setC_content(String c_content) {
		this.c_content = c_content;
	}
	public String getC_score() {
		return c_score;
	}
	public void setC_score(String c_score) {
		this.c_score = c_score;
	}
	public String getC_symbol() {
		return c_symbol;
	}
	public void setC_symbol(String c_symbol) {
		this.c_symbol = c_symbol;
	}
	public String getMenu_name() {
		return menu_name;
	}
	public void setMenu_name(String menu_name) {
		this.menu_name = menu_name;
	}
	public String getMenu_type() {
		return menu_type;
	}
	public void setMenu_type(String menu_type) {
		this.menu_type = menu_type;
	}
	
	
}
