package model.DTO;

import java.io.Serializable;

	@SuppressWarnings("serial")
	public class PartnerGoodsMenuDTO implements Serializable {
		String partnerGoodsMenuNum ;
		String theaterNum;
		String partnerGoodsMenuName ;
		String partnerGoodsMenuContent ;
		Long partnerGoodsMenuPrice;
		String partnerGoodsMenuImage;
		String partnerGoodsMenuType;
		
		public PartnerGoodsMenuDTO() {}
		public PartnerGoodsMenuDTO(String partnerGoodsMenuNum, String theaterNum, String partnerGoodsMenuName, String partnerGoodsMenuContent, Long partnerGoodsMenuPrice,
				String partnerGoodsMenuImage, String partnerGoodsM) {

			this.partnerGoodsMenuNum = partnerGoodsMenuNum;
			this.theaterNum = theaterNum;
			this.partnerGoodsMenuName = partnerGoodsMenuName;
			this.partnerGoodsMenuContent = partnerGoodsMenuContent;
			this.partnerGoodsMenuPrice = partnerGoodsMenuPrice;
			this.partnerGoodsMenuImage = partnerGoodsMenuImage;
			this.partnerGoodsMenuType = partnerGoodsMenuType;
			
		}
		public String getPartnerGoodsMenuNum() {
			return partnerGoodsMenuNum;
		}
		public void setPartnerGoodsMenuNum(String partnerGoodsMenuNum) {
			this.partnerGoodsMenuNum = partnerGoodsMenuNum;
		}
		public String getTheaterNum() {
			return theaterNum;
		}
		public void setTheaterNum(String theaterNum) {
			this.theaterNum = theaterNum;
		}
		public String getPartnerGoodsMenuName() {
			return partnerGoodsMenuName;
		}
		public void setPartnerGoodsMenuName(String partnerGoodsMenuName) {
			this.partnerGoodsMenuName = partnerGoodsMenuName;
		}
		public String getPartnerGoodsMenuContent() {
			return partnerGoodsMenuContent;
		}
		public void setPartnerGoodsMenuContent(String partnerGoodsMenuContent) {
			this.partnerGoodsMenuContent = partnerGoodsMenuContent;
		}
		public Long getPartnerGoodsMenuPrice() {
			return partnerGoodsMenuPrice;
		}
		public void setPartnerGoodsMenuPrice(Long partnerGoodsMenuPrice) {
			this.partnerGoodsMenuPrice = partnerGoodsMenuPrice;
		}
		public String getPartnerGoodsMenuImage() {
			return partnerGoodsMenuImage;
		}
		public void setPartnerGoodsMenuImage(String partnerGoodsMenuImage) {
			this.partnerGoodsMenuImage = partnerGoodsMenuImage;
		}
		public String getPartnerGoodsMenuType() {
			return partnerGoodsMenuType;
		}
		public void setPartnerGoodsMenuType(String partnerGoodsMenuType) {
			this.partnerGoodsMenuType = partnerGoodsMenuType;
		}
	
}
