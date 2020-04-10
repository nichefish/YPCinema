package model.DTO;

import java.io.Serializable;

@SuppressWarnings("serial")
public class CartDTO implements Serializable {
	Long cartNum;
	String menuNum ;
	String menuName ;
	String userId;
	Long menuPrice;
	String menuImage;
	Long menuQty;
	
	public Long getCartNum() {
		return cartNum;
	}
	public void setCartNum(Long cartNum) {
		this.cartNum = cartNum;
	}
	public String getMenuNum() {
		return menuNum;
	}
	public void setMenuNum(String menuNum) {
		this.menuNum = menuNum;
	}
	public String getMenuName() {
		return menuName;
	}
	public void setMenuName(String menuName) {
		this.menuName = menuName;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public Long getMenuPrice() {
		return menuPrice;
	}
	public void setMenuPrice(Long menuPrice) {
		this.menuPrice = menuPrice;
	}
	public String getMenuImage() {
		return menuImage;
	}
	public void setMenuImage(String menuImage) {
		this.menuImage = menuImage;
	}
	public Long getMenuQty() {
		return menuQty;
	}
	public void setMenuQty(Long menuQty) {
		this.menuQty = menuQty;
	}
	

}
