package cn.edu.neu.model;

import java.util.List;

public class GoodsDetailType {

	private int typeId;
	private String typeName;
	private List<GoodsDetail> detail;
	
	public int getTypeId() {
		return typeId;
	}

	public void setTypeId(int typeId) {
		this.typeId = typeId;
	}

	public String getTypeName() {
		return typeName;
	}

	public void setTypeName(String typeName) {
		this.typeName = typeName;
	}

	public List<GoodsDetail> getDetail() {
		return detail;
	}

	public void setDetail(List<GoodsDetail> detail) {
		this.detail = detail;
	}

	
	public GoodsDetailType() {
		// TODO Auto-generated constructor stub
	}

}
