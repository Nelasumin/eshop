package cn.edu.neu.model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class Category {
	private int cateId;
	private String cateName;
	private String catePic;
	private String cateDesc;
	private int childCateId;
    private String childCateName;
    private List<Map<String,String>> childlist;
    private List<Goods> goodslist;
	
	public Category() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Category(int cateId, String cateName, String catePic,String cateDesc) {
		super();
		this.cateId = cateId;
		this.cateName = cateName;
		this.catePic = catePic;
		this.cateDesc=cateDesc;
	}
	public int getCateId() {
		return cateId;
	}
	public void setCateId(int cateId) {
		this.cateId = cateId;
	}
	public String getCateName() {
		return cateName;
	}
	public void setCateName(String cateName) {
		this.cateName = cateName;
	}
	public String getCatePic() {
		return catePic;
	}
	public void setCatePic(String catePic) {
		this.catePic = catePic;
	}

	public String getCateDesc() {
		return cateDesc;
	}
	public void setCateDesc(String cateDesc) {
		this.cateDesc = cateDesc;
	}
	
	
	public int getChildCateId() {
		return childCateId;
	}
	public void setChildCateId(int childCateId) {
		this.childCateId = childCateId;
	}
	public String getChildCateName() {
		return childCateName;
	}
	public void setChildCateName(String childCateName) {
		this.childCateName = childCateName;
	}
	
	public List<Map<String, String>> getChildlist() {
		return childlist;
	}
	public void setChildlist(List<Map<String, String>> childlist) {
		this.childlist = childlist;
	}	
	public List<Goods> getGoodslist() {
		return goodslist;
	}
	public void setGoodslist(List<Goods> goodslist) {
		this.goodslist = goodslist;
	}
	@Override
	public String toString() {
		return "Category [cateId=" + cateId + ", cateName=" + cateName + ", catePic=" + catePic + ", cateDesc=" + cateDesc+"]";
	}
	
	
}
