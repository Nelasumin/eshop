package cn.edu.neu.model;

public class Address  {
	private int addrId;
	private int userId;
	private String addrProvince;
	private String addrCity;
	private String addrArea;
	private String addrContent;
	private String addrReceiver;
	private String addrTel;
	private int addrIsdefault;
	
	
	public Address() {
		super();
		// TODO Auto-generated constructor stub
	}
	


	public Address(int addrId, int userId, String addrProvince, String addrCity, String addrArea, String addrContent,
			String addrReceiver, String addrTel, int addrIsdefault) {
		super();
		this.addrId = addrId;
		this.userId = userId;
		this.addrProvince = addrProvince;
		this.addrCity = addrCity;
		this.addrArea = addrArea;
		this.addrContent = addrContent;
		this.addrReceiver = addrReceiver;
		this.addrTel = addrTel;
		this.addrIsdefault = addrIsdefault;
	}

	public int getAddrId() {
		return addrId;
	}
	public void setAddrId(int addrId) {
		this.addrId = addrId;
	}
	public String getAddrProvince() {
		return addrProvince;
	}
	public void setAddrProvince(String addrProvince) {
		this.addrProvince = addrProvince;
	}
	public String getAddrCity() {
		return addrCity;
	}
	public void setAddrCity(String addrCity) {
		this.addrCity = addrCity;
	}
	public String getAddrArea() {
		return addrArea;
	}
	public void setAddrArea(String addrArea) {
		this.addrArea = addrArea;
	}
	
	public String getAddrContent() {
		return addrContent;
	}

	public void setAddrContent(String addrContent) {
		this.addrContent = addrContent;
	}

	public String getAddrReceiver() {
		return addrReceiver;
	}
	public void setAddrReceiver(String addrReceiver) {
		this.addrReceiver = addrReceiver;
	}
	public String getAddrTel() {
		return addrTel;
	}
	public void setAddrTel(String addrTel) {
		this.addrTel = addrTel;
	}
	
	public int getAddrIsdefault() {
		return addrIsdefault;
	}



	public int getUserId() {
		return userId;
	}



	public void setUserId(int userId) {
		this.userId = userId;
	}



	public void setAddrIsdefault(int addrIsdefault) {
		this.addrIsdefault = addrIsdefault;
	}



	@Override
	public String toString() {
		return "Address [addrId=" + addrId + ", userId=" + userId + ", addrProvince=" + addrProvince + ", addrCity="
				+ addrCity + ", addrArea=" + addrArea + ", addrContent=" + addrContent + ", addrReceiver="
				+ addrReceiver + ", addrTel=" + addrTel + ", addrIsdefault=" + addrIsdefault + "]";
	}

}
