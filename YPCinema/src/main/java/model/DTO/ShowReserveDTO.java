package model.DTO;

import java.io.Serializable;

@SuppressWarnings("serial")
public class ShowReserveDTO implements Serializable {
	private String seat_reserve_num;
	private String show_num;
	public String m_num;
	private Integer seat_num;
	private String seat_name;
	private Integer seat_price;
	private String payment_num;
	private String seat_issued;
	private String seat_entered;
	
	public String getSeat_reserve_num() {
		return seat_reserve_num;
	}
	public void setSeat_reserve_num(String seat_reserve_num) {
		this.seat_reserve_num = seat_reserve_num;
	}
	public String getShow_num() {
		return show_num;
	}
	public void setShow_num(String show_num) {
		this.show_num = show_num;
	}
	public String getM_num() {
		return m_num;
	}
	public void setM_num(String m_num) {
		this.m_num = m_num;
	}
	public Integer getSeat_num() {
		return seat_num;
	}
	public void setSeat_num(Integer seat_num) {
		this.seat_num = seat_num;
	}
	public String getSeat_name() {
		return seat_name;
	}
	public void setSeat_name(String seat_name) {
		this.seat_name = seat_name;
	}
	public Integer getSeat_price() {
		return seat_price;
	}
	public void setSeat_price(Integer seat_price) {
		this.seat_price = seat_price;
	}
	public String getPayment_num() {
		return payment_num;
	}
	public void setPayment_num(String payment_num) {
		this.payment_num = payment_num;
	}
	public String getSeat_issued() {
		return seat_issued;
	}
	public void setSeat_issued(String seat_issued) {
		this.seat_issued = seat_issued;
	}
	public String getSeat_entered() {
		return seat_entered;
	}
	public void setSeat_entered(String seat_entered) {
		this.seat_entered = seat_entered;
	}
}
