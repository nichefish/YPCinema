package model.DTO;

import java.io.Serializable;

	@SuppressWarnings("serial")
	public class MenuDTO implements Serializable {
		String menuNum ;
		String theaterNum;
		String menuName ;
		String menuContent ;
		Long menuPrice;
		String menuImage;
		String menuType;
		
		public MenuDTO() {}
		public MenuDTO(String menuNum, String theaterNum, String menuName, String menuContent, Long menuPrice,
				String menuImage, String menuType) {

			this.menuNum = menuNum;
			this.theaterNum = theaterNum;
			this.menuName = menuName;
			this.menuContent = menuContent;
			this.menuPrice = menuPrice;
			this.menuImage = menuImage;
			this.menuType = menuType;
			
		}
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
		public String getMenuImage() {
			return menuImage;
		}
		public void setMenuImage(String menuImage) {
			this.menuImage = menuImage;
		}
		public String getMenuType() {
			return menuType;
		}
		public void setMenuType(String menuType) {
			this.menuType = menuType;
		}
}
