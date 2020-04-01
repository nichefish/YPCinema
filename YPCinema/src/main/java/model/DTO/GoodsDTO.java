package model.DTO;

import java.io.Serializable;

import org.springframework.web.multipart.MultipartFile;

@SuppressWarnings("serial")
public class GoodsDTO implements Serializable {

	String goodsNum;
	String goodsName;
	String goodsType;
	String goodsContent;
	Long goodsPrice;
	String goodsImage;
	
	public GoodsDTO(){}
	public GoodsDTO(String goodsNum, String goodsName, String goodsType, String goodsContent, Long goodsPrice,
			String goodsImage) {
		this.goodsNum = goodsNum;
		this.goodsName = goodsName;
		this.goodsType = goodsType;
		this.goodsContent = goodsContent;
		this.goodsPrice = goodsPrice;
		this.goodsImage = goodsImage;
	}

	public String getGoodsNum() {
		return goodsNum;
	}

	public void setGoodsNum(String goodsNum) {
		this.goodsNum = goodsNum;
	}

	public String getGoodsName() {
		return goodsName;
	}

	public void setGoodsName(String goodsName) {
		this.goodsName = goodsName;
	}

	public String getGoodsType() {
		return goodsType;
	}

	public void setGoodsType(String goodsType) {
		this.goodsType = goodsType;
	}

	public String getGoodsContent() {
		return goodsContent;
	}

	public void setGoodsContent(String goodsContent) {
		this.goodsContent = goodsContent;
	}

	public Long getGoodsPrice() {
		return goodsPrice;
	}

	public void setGoodsPrice(Long goodsPrice) {
		this.goodsPrice = goodsPrice;
	}

	public String getGoodsImage() {
		return goodsImage;
	}

	public void setGoodsImage(String goodsImage) {
		this.goodsImage = goodsImage;
	}
}
