package cn.edu.neu.model;

import java.util.Date;
import java.util.List;

public class Goods {
	private int goodsId;
	private int cateId;
	private String goodsName;
	private String goodsDisc;

	private float goodsPrice;

	private float goodsDiscount;
	private int goodsStock;
	private String goodsOrigin;
	private String goodsMaterial;
	private int goodsPostalfee;

	private Date goodsDate;
	private int goodsSales;
	private String goodsPic;


	private List<GoodsDetailType> typelist;
	private List<Pic> pics;

	
	public Goods() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
	public Goods(int goodsId, int cateId, String goodsName, String goodsDisc, float goodsPrice, float goodsDiscount,
			int goodsStock, String goodsOrigin, String goodsMaterial, int goodsPostalfee, Date goodsDate,
			int goodsSales, String goodsPic,  List<Pic> pics, 
			List<GoodsDetailType> typelist) {
		super();
		this.goodsId = goodsId;
		this.cateId = cateId;
		this.goodsName = goodsName;
		this.goodsDisc = goodsDisc;
		this.goodsPrice = goodsPrice;
		this.goodsDiscount = goodsDiscount;
		this.goodsStock = goodsStock;
		this.goodsOrigin = goodsOrigin;
		this.goodsMaterial = goodsMaterial;
		this.goodsPostalfee = goodsPostalfee;
		this.goodsDate = goodsDate;
		this.goodsSales = goodsSales;
		this.goodsPic = goodsPic;
		this.pics = pics;

		this.typelist=typelist;
	}

	public int getGoodsId() {
		return goodsId;
	}
	public void setGoodsId(int goodsId) {
		this.goodsId = goodsId;
	}
	public int getCateId() {
		return cateId;
	}
	public void setCateId(int cateId) {
		this.cateId = cateId;
	}
	public String getGoodsName() {
		return goodsName;
	}
	public void setGoodsName(String goodsName) {
		this.goodsName = goodsName;
	}
	public String getGoodsDisc() {
		return goodsDisc;
	}
	public void setGoodsDisc(String goodsDisc) {
		this.goodsDisc = goodsDisc;
	}
	public float getGoodsPrice() {
		return goodsPrice;
	}
	public void setGoodsPrice(float goodsPrice) {
		this.goodsPrice = goodsPrice;
	}
	public float getGoodsDiscount() {
		return goodsDiscount;
	}
	public void setGoodsDiscount(float goodsDiscount) {
		this.goodsDiscount = goodsDiscount;
	}
	public int getGoodsStock() {
		return goodsStock;
	}
	public void setGoodsStock(int goodsStock) {
		this.goodsStock = goodsStock;
	}
	public String getGoodsOrigin() {
		return goodsOrigin;
	}
	public void setGoodsOrigin(String goodsOrigin) {
		this.goodsOrigin = goodsOrigin;
	}
	public String getGoodsMaterial() {
		return goodsMaterial;
	}
	public void setGoodsMaterial(String goodsMaterial) {
		this.goodsMaterial = goodsMaterial;
	}
	public int getGoodsPostalfee() {
		return goodsPostalfee;
	}
	public void setGoodsPostalfee(int goodsPostalfee) {
		this.goodsPostalfee = goodsPostalfee;
	}
	public Date getGoodsDate() {
		return goodsDate;
	}
	public void setGoodsDate(Date goodsDate) {
		this.goodsDate = goodsDate;
	}
	public int getGoodsSales() {
		return goodsSales;
	}
	public void setGoodsSales(int goodsSales) {
		this.goodsSales = goodsSales;
	}
	
	public String getGoodsPic() {
		return goodsPic;
	}

	public void setGoodsPic(String goodsPic) {
		this.goodsPic = goodsPic;
	}

	public List<Pic> getPics() {
		return pics;
	}
	public void setPics(List<Pic> pics) {
		this.pics = pics;
	}
	

	public List<GoodsDetailType> getTypelist() {
		return typelist;
	}


	public void setTypelist(List<GoodsDetailType> typelist) {
		this.typelist = typelist;
	}


	@Override
	public String toString() {
		return "Goods [goodsId=" + goodsId + ", cateId=" + cateId + ", goodsName=" + goodsName + ", goodsDisc="
				+ goodsDisc + ", goodsPrice=" + goodsPrice + ", goodsDiscount=" + goodsDiscount + ", goodsStock="
				+ goodsStock + ", goodsOrigin=" + goodsOrigin + ", goodsMaterial=" + goodsMaterial + ", goodsPostalfee="
				+ goodsPostalfee + ", goodsDate=" + goodsDate + ", goodsSales=" + goodsSales + ", goodsPic=" + goodsPic
				+ ",  pics=" + pics + ", typelist=" + typelist + "]";
	}


	
}
