package model.DTO;

import java.io.Serializable;

@SuppressWarnings("serial")
public class ShowReserveDTO implements Serializable {
	private String seat_reserve_num;
	private String show_num;
	public String m_num;
	private Integer seat_num;
	private String seat_name;
	private Integer [] seat_num_array;
	private String [] seat_name_array;
	private Integer seat_price;
	private Integer [] seat_price_array;
	private Integer seat_total_price;
	private String payment_num;
	private String seat_issue;
	
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
	public Integer[] getSeat_num_array() {
		return seat_num_array;
	}
	public void setSeat_num_array(Integer[] seat_num_array) {
		this.seat_num_array = seat_num_array;
	}
	public String[] getSeat_name_array() {
		return seat_name_array;
	}
	public void setSeat_name_array(String[] seat_name_array) {
		this.seat_name_array = seat_name_array;
	}
	public Integer getSeat_price() {
		return seat_price;
	}
	public void setSeat_price(Integer seat_price) {
		this.seat_price = seat_price;
	}
	public Integer[] getSeat_price_array() {
		return seat_price_array;
	}
	public void setSeat_price_array(Integer[] seat_price_array) {
		this.seat_price_array = seat_price_array;
	}
	public Integer getSeat_total_price() {
		return seat_total_price;
	}
	public void setSeat_total_price(Integer seat_total_price) {
		this.seat_total_price = seat_total_price;
	}
	public String getPayment_num() {
		return payment_num;
	}
	public void setPayment_num(String payment_num) {
		this.payment_num = payment_num;
	}
	public String getSeat_issue() {
		return seat_issue;
	}
	public void setSeat_issue(String seat_issue) {
		this.seat_issue = seat_issue;
	}
}
