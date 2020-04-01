package model.DTO;

import java.io.Serializable;
import java.util.Date;

@SuppressWarnings("serial")
public class BalcuDTO implements Serializable{
	private String balcuNum;
	private String cNum;
	private String mNum;
	private Date cDate;
	private Date cEDate;
	private String cUsed;
	private String manryo;
	
	public String getManryo() {
		return manryo;
	}
	public void setManryo(String manryo) {
		this.manryo = manryo;
	}
	public String getBalcuNum() {
		return balcuNum;
	}
	public void setBalcuNum(String balcuNum) {
		this.balcuNum = balcuNum;
	}
	public String getcNum() {
		return cNum;
	}
	public void setcNum(String cNum) {
		this.cNum = cNum;
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
	
	

}
