package cn.edu.neu.model;

public class OrderDetail {
	private int odetailId;
	private int orderId;
	private int goodsId;
	private String odetailName;
	private String odetailSize;
	private String odetailColor;

	private float odetailPrice;
	private int odetailNum;
	private String odetailPic;
	public OrderDetail() {
		super();
		// TODO Auto-generated constructor stub
	}
	



	public OrderDetail(int odetailId, int orderId, int goodsId, String odetailName, String odetailSize,
			String odetailColor, float odetailPrice, int odetailNum,
			String odetailPic) {
		super();
		this.odetailId = odetailId;
		this.orderId = orderId;
		this.goodsId = goodsId;
		this.odetailName = odetailName;
		this.odetailSize = odetailSize;
		this.odetailColor = odetailColor;

		this.odetailPrice = odetailPrice;
		this.odetailNum = odetailNum;
		this.odetailPic = odetailPic;
	}




	public int getOdetailId() {
		return odetailId;
	}

	public void setOdetailId(int odetailId) {
		this.odetailId = odetailId;
	}

	public int getOrderId() {
		return orderId;
	}

	public void setOrderId(int orderId) {
		this.orderId = orderId;
	}

	public int getGoodsId() {
		return goodsId;
	}

	public void setGoodsId(int goodsId) {
		this.goodsId = goodsId;
	}



	public String getOdetailName() {
		return odetailName;
	}


	public void setOdetailName(String odetailName) {
		this.odetailName = odetailName;
	}


	public String getOdetailSize() {
		return odetailSize;
	}


	public void setOdetailSize(String odetailSize) {
		this.odetailSize = odetailSize;
	}


	public String getOdetailColor() {
		return odetailColor;
	}


	public void setOdetailColor(String odetailColor) {
		this.odetailColor = odetailColor;
	}


	public float getOdetailPrice() {
		return odetailPrice;
	}


	public void setOdetailPrice(float odetailPrice) {
		this.odetailPrice = odetailPrice;
	}


	public int getOdetailNum() {
		return odetailNum;
	}


	public void setOdetailNum(int odetailNum) {
		this.odetailNum = odetailNum;
	}


	public String getOdetailPic() {
		return odetailPic;
	}


	public void setOdetailPic(String odetailPic) {
		this.odetailPic = odetailPic;
	}


	@Override
	public String toString() {
		return "OrderDetail [odetailId=" + odetailId + ", orderId=" + orderId + ", goodsId=" + goodsId
				+ ", odetailName=" + odetailName + ", odetailSize=" + odetailSize + ", odetailColor=" + odetailColor
				+ ", odetailPrice="
				+ odetailPrice + ", odetailNum=" + odetailNum + ", odetailPic=" + odetailPic + "]";
	}


}
