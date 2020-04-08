package command.showtime;

public class ShowReserveCommand {
	private String seat_reserve_num;
	private String show_num;
	private String m_num;
	private String theater_num;
	private String screen_num;
	private Integer [] seat_num_array;
	private String [] seat_name_array;
	private Integer [] seat_price_array;
	private Integer seat_total_price;
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
}
