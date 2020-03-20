package model.DTO;

import java.io.Serializable;

@SuppressWarnings("serial")
public class JicmuDTO implements Serializable{
	private String jic_num;
	private String jic_name;
	
	public String getJic_num() {
		return jic_num;
	}
	public void setJic_num(String jic_num) {
		this.jic_num = jic_num;
	}
	public String getJic_name() {
		return jic_name;
	}
	public void setJic_name(String jic_name) {
		this.jic_name = jic_name;
	}
	
	
}
