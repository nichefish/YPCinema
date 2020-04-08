package model.DTO;

import java.io.Serializable;

import org.springframework.web.multipart.MultipartFile;

@SuppressWarnings("serial")
public class PartnerGoodsDTO implements Serializable {

	String partnerGoodsNum;
	String partnerGoodsName;
	String partnerGoodsType;
	String partnerGoodsContent;
	Long partnerGoodsPrice;
	String partnerGoodsImage;
	
	public PartnerGoodsDTO(){}
	public PartnerGoodsDTO(String partnerGoodsNum, String partnerGoodsName, String partnerGoodsType, String partnerGoodsContent, Long partnerGoodsPrice,
			String partnerGoodsImage) {
		this.partnerGoodsNum = partnerGoodsNum;
		this.partnerGoodsName = partnerGoodsName;
		this.partnerGoodsType = partnerGoodsType;
		this.partnerGoodsContent = partnerGoodsContent;
		this.partnerGoodsPrice = partnerGoodsPrice;
		this.partnerGoodsImage = partnerGoodsImage;
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
	public String getPartnerGoodsType() {
		return partnerGoodsType;
	}
	public void setPartnerGoodsType(String partnerGoodsType) {
		this.partnerGoodsType = partnerGoodsType;
	}
	public String getPartnerGoodsContent() {
		return partnerGoodsContent;
	}
	public void setPartnerGoodsContent(String partnerGoodsContent) {
		this.partnerGoodsContent = partnerGoodsContent;
	}
	public Long getPartnerGoodsPrice() {
		return partnerGoodsPrice;
	}
	public void setPartnerGoodsPrice(Long partnerGoodsPrice) {
		this.partnerGoodsPrice = partnerGoodsPrice;
	}
	public String getPartnerGoodsImage() {
		return partnerGoodsImage;
	}
	public void setPartnerGoodsImage(String partnerGoodsImage) {
		this.partnerGoodsImage = partnerGoodsImage;
	}

	
}
