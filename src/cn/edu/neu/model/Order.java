package cn.edu.neu.model;

import java.util.Date;
import java.util.List;

public class Order {
	private int orderId;
	private String orderCode;
	private int userId;
	private String userName;
	private int orderStatus;
	private String orderAddress;
	private float orderPostalfee;
	private Date orderDate;
	private String orderPostcode;
	private String orderPostname;
	private List<OrderDetail> odetails;
	
	
	public Order() {
		super();
		// TODO Auto-generated constructor stub
	}



	public Order(int orderId, String orderCode, int userId, String userName, int orderStatus, String orderAddress,
			float orderPostalfee, Date orderDate, String orderPostcode, String orderPostname,
			List<OrderDetail> odetails) {
		super();
		this.orderId = orderId;
		this.orderCode = orderCode;
		this.userId = userId;
		this.userName = userName;
		this.orderStatus = orderStatus;
		this.orderAddress = orderAddress;
		this.orderPostalfee = orderPostalfee;
		this.orderDate = orderDate;
		this.orderPostcode = orderPostcode;
		this.orderPostname = orderPostname;
		this.odetails = odetails;
	}



	public int getOrderId() {
		return orderId;
	}
	public void setOrderId(int orderId) {
		this.orderId = orderId;
	}
	public String getOrderCode() {
		return orderCode;
	}
	public void setOrderCode(String orderCode) {
		this.orderCode = orderCode;
	}
	public int getOrderStatus() {
		return orderStatus;
	}
	public void setOrderStatus(int orderStatus) {
		this.orderStatus = orderStatus;
	}
	public String getOrderAddress() {
		return orderAddress;
	}
	public void setOrderAddress(String orderAddress) {
		this.orderAddress = orderAddress;
	}
	public float getOrderPostalfee() {
		return orderPostalfee;
	}
	public void setOrderPostalfee(float orderPostalfee) {
		this.orderPostalfee = orderPostalfee;
	}
	public String getOrderPostcode() {
		return orderPostcode;
	}
	public void setOrderPostcode(String orderPostcode) {
		this.orderPostcode = orderPostcode;
	}
	public String getOrderPostname() {
		return orderPostname;
	}
	public void setOrderPostname(String orderPostname) {
		this.orderPostname = orderPostname;
	}
	public Date getOrderDate() {
		return orderDate;
	}
	public void setOrderDate(Date orderDate) {
		this.orderDate = orderDate;
	}


	public int getUserId() {
		return userId;
	}



	public void setUserId(int userId) {
		this.userId = userId;
	}



	public List<OrderDetail> getOdetails() {
		return odetails;
	}

	public void setOdetails(List<OrderDetail> odetails) {
		this.odetails = odetails;
	}



	public String getUserName() {
		return userName;
	}



	public void setUserName(String userName) {
		this.userName = userName;
	}



	@Override
	public String toString() {
		return "Order [orderId=" + orderId + ", orderCode=" + orderCode + ", userId=" + userId + ", userName="
				+ userName + ", orderStatus=" + orderStatus + ", orderAddress=" + orderAddress + ", orderPostalfee="
				+ orderPostalfee + ", orderDate=" + orderDate + ", orderPostcode=" + orderPostcode + ", orderPostname="
				+ orderPostname + ", odetails=" + odetails + "]";
	}


}
