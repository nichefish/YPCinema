package command.popcorn;

import org.springframework.web.multipart.MultipartFile;

public class MenuCommand {
	String menuNum ;
	String menuType;
	String theaterNum;
	String menuName ;
	String menuContent;
	Long menuPrice;
	MultipartFile menuImage;
	String goodsNum;
	
	public String getMenuNum() {
		return menuNum;
	}
	public void setMenuNum(String menuNum) {
		this.menuNum = menuNum;
	}
	public String getMenuType() {
		return menuType;
	}
	public void setMenuType(String menuType) {
		this.menuType = menuType;
	}
	public String getTheaterNum() {
		return theaterNum;
	}
	public void setTheaterNum(String theaterNum) {
		this.theaterNum = theaterNum;
	}
	public String getMenuName() {
		return menuName;
	}
	public void setMenuName(String menuName) {
		this.menuName = menuName;
	}
	public String getMenuContent() {
		return menuContent;
	}
	public void setMenuContent(String menuContent) {
		this.menuContent = menuContent;
	}
	public Long getMenuPrice() {
		return menuPrice;
	}
	public void setMenuPrice(Long menuPrice) {
		this.menuPrice = menuPrice;
	}
	public MultipartFile getMenuImage() {
		return menuImage;
	}
	public void setMenuImage(MultipartFile menuImage) {
		this.menuImage = menuImage;
	}
	public String getGoodsNum() {
		return goodsNum;
	}
	public void setGoodsNum(String goodsNum) {
		this.goodsNum = goodsNum;
	}
}
