package command.payment;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class PaymentCommand {
	private String payment_num;
	private String m_num;
	private String payment_email;
	private String payment_ph;
	private Integer payment_price;
	@DateTimeFormat(pattern="yyyy-MM-dd")		// 요런식으로.. 간단하게 포맷 설정..
	private Date payment_date;
	
	public String getPayment_num() {
		return payment_num;
	}
	public void setPayment_num(String payment_num) {
		this.payment_num = payment_num;
	}
	public String getM_num() {
		return m_num;
	}
	public void setM_num(String m_num) {
		this.m_num = m_num;
	}
	public String getPayment_email() {
		return payment_email;
	}
	public void setPayment_email(String payment_email) {
		this.payment_email = payment_email;
	}
	public String getPayment_ph() {
		return payment_ph;
	}
	public void setPayment_ph(String payment_ph) {
		this.payment_ph = payment_ph;
	}
	public Integer getPayment_price() {
		return payment_price;
	}
	public void setPayment_price(Integer payment_price) {
		this.payment_price = payment_price;
	}
	public Date getPayment_date() {
		return payment_date;
	}
	public void setPayment_date(Date payment_date) {
		this.payment_date = payment_date;
	}
}
