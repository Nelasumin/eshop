package cn.edu.neu.model;

public class Pic {
	private int picId;
	private int goodsId;
	private String picUrl;
	private int picType;
	
	public Pic() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Pic(int picId, int goodsId, String picUrl, int picType) {
		super();
		this.picId = picId;
		this.goodsId = goodsId;
		this.picUrl = picUrl;
		this.picType = picType;
	}
	public int getPicId() {
		return picId;
	}
	public void setPicId(int picId) {
		this.picId = picId;
	}
	public int getGoodsId() {
		return goodsId;
	}
	public void setGoodsId(int goodsId) {
		this.goodsId = goodsId;
	}
	public String getPicUrl() {
		return picUrl;
	}
	public void setPicUrl(String picUrl) {
		this.picUrl = picUrl;
	}
	public int getPicType() {
		return picType;
	}
	public void setPicType(int picType) {
		this.picType = picType;
	}

	@Override
	public String toString() {
		return "Pic [picId=" + picId + ", goodsId=" + goodsId + ", picUrl=" + picUrl + ", picType=" + picType + "]";
	}
	
	
}
