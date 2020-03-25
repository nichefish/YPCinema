package command.showtime;

public class ShowReserveCommand {
	private String seat_reserve_num;
	private String show_num;
	private String m_num;
	private String theater_num;
	private String screen_num;
	private Integer seat_num;
	private String seat_name;
	private Integer seat_price;
	private String payment_num;
	
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
	public String getTheater_num() {
		return theater_num;
	}
	public void setTheater_num(String theater_num) {
		this.theater_num = theater_num;
	}
	public String getScreen_num() {
		return screen_num;
	}
	public void setScreen_num(String screen_num) {
		this.screen_num = screen_num;
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
}
