package model.DTO;

import java.io.Serializable;

@SuppressWarnings("serial")
public class MenuGoodsDTO implements Serializable{
	String menuNum;
	String theaterNum;
	String goodsNum;
	String goodsQty;
	
	public String getMenuNum() {
		return menuNum;
	}
	public void setMenuNum(String menuNum) {
		this.menuNum = menuNum;
	}
	public String getTheaterNum() {
		return theaterNum;
	}
	public void setTheaterNum(String theaterNum) {
		this.theaterNum = theaterNum;
	}
	public String getGoodsNum() {
		return goodsNum;
	}
	public void setGoodsNum(String goodsNum) {
		this.goodsNum = goodsNum;
	}
	public String getGoodsQty() {
		return goodsQty;
	}
	public void setGoodsQty(String goodsQty) {
		this.goodsQty = goodsQty;
	}
}
