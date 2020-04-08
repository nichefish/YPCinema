package command.PartnerGoods;

import org.springframework.web.multipart.MultipartFile;

public class PartnerGoodsCommand {
	String partnerGoodsType;
	String partnerGoodsNum;
	String partnerGoodsName;
	Long partnerGoodsPrice;
	MultipartFile [] partnerGoodsImage;
	public String getPartnerGoodsType() {
		return partnerGoodsType;
	}
	public void setPartnerGoodsType(String partnerGoodsType) {
		this.partnerGoodsType = partnerGoodsType;
	}
	public String getPartnerGoodsNum() {
		return partnerGoodsNum;
	}
	public void setPartnerGoodsNum(String partnerGoodsNum) {
		this.partnerGoodsNum = partnerGoodsNum;
	}
	public String getPartnerGoodsName() {
		return partnerGoodsName;
	}
	public void setPartnerGoodsName(String partnerGoodsName) {
		this.partnerGoodsName = partnerGoodsName;
	}
	public Long getPartnerGoodsPrice() {
		return partnerGoodsPrice;
	}
	public void setPartnerGoodsPrice(Long partnerGoodsPrice) {
		this.partnerGoodsPrice = partnerGoodsPrice;
	}
	public MultipartFile[] getPartnerGoodsImage() {
		return partnerGoodsImage;
	}
	public void setPartnerGoodsImage(MultipartFile[] partnerGoodsImage) {
		this.partnerGoodsImage = partnerGoodsImage;
	}
	
	
}
