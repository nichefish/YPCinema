package command.popcorn;

import org.springframework.web.multipart.MultipartFile;

public class GoodsCommand {
	String goodsType;
	String goodsNum;
	String goodsName;
	Long goodsPrice;
	MultipartFile goodsImage;
	
	public String getGoodsType() {
		return goodsType;
	}
	public void setGoodsType(String goodsType) {
		this.goodsType = goodsType;
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
	public Long getGoodsPrice() {
		return goodsPrice;
	}
	public void setGoodsPrice(Long goodsPrice) {
		this.goodsPrice = goodsPrice;
	}
	public MultipartFile getGoodsImage() {
		return goodsImage;
	}
	public void setGoodsImage(MultipartFile goodsImage) {
		this.goodsImage = goodsImage;
	}
}
