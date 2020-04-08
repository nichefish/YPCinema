package command.PartnerGoods;

import org.springframework.web.multipart.MultipartFile;

public class PartnerGoodsMenuCommand {
	String partnerGoodsMenuNum ;
	String partnerGoodsMenuType;
	String theaterNum;
	String partnerGoodsMenuName ;
	String partnerGoodsMenuContent ;
	Long partnerGoodsMenuPrice;
	MultipartFile [] partnerGoodsMenuImage;
	
	public String getPartnerGoodsMenuNum() {
		return partnerGoodsMenuNum;
	}
	public void setPartnerGoodsMenuNum(String partnerGoodsMenuNum) {
		this.partnerGoodsMenuNum = partnerGoodsMenuNum;
	}
	public String getPartnerGoodsMenuType() {
		return partnerGoodsMenuType;
	}
	public void setPartnerGoodsMenuType(String partnerGoodsMenuType) {
		this.partnerGoodsMenuType = partnerGoodsMenuType;
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
	public MultipartFile[] getPartnerGoodsMenuImage() {
		return partnerGoodsMenuImage;
	}
	public void setPartnerGoodsMenuImage(MultipartFile[] partnerGoodsMenuImage) {
		this.partnerGoodsMenuImage = partnerGoodsMenuImage;
	}
	
	
}
