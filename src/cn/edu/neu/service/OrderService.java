package cn.edu.neu.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Random;

import cn.edu.edu.dao.DBUtil;
import cn.edu.edu.dao.DBUtil1;
import cn.edu.neu.model.Goods;
import cn.edu.neu.model.Order;
import cn.edu.neu.model.OrderDetail;

public class OrderService {

	public static int addOrder(Order order, List<OrderDetail> orderDetails) {
		// TODO Auto-generated method stub
		DBUtil1 db=new DBUtil1();
		String sql="insert into t_order values(null,?,?,1,?,?,?,null,null)";
		Date d=new Date();
		java.sql.Date d1=new java.sql.Date(d.getTime());
		SimpleDateFormat sf=new SimpleDateFormat("yyyyMMddHHmmssSSS",Locale.CHINA);
		String str=sf.format(d);
		Random r=new Random();
		int i=r.nextInt(100);
		String s="";
		if(i<10){
			s="00"+i;
		}
		else if(i>=10&&i<=99){
			s="0"+i;
		}
		String orderCode=str+s;
		order.setOrderCode(orderCode);
		String params[]={order.getOrderCode(),order.getUserId()+"",order.getOrderAddress(),order.getOrderPostalfee()+"",d1+""};
		Map<String,Integer> map=db.insert(sql, params);
		if(map!=null){
			String orderId=map.get("lastId")+"";
			sql="insert into t_orderdetail values(null,?,?,?,?,?,?)";
			for(OrderDetail od:orderDetails){
				String params1[]={orderId,od.getGoodsId()+"",od.getOdetailName(),od.getOdetailPrice()+"",od.getOdetailNum()+"",od.getOdetailPic()};
				db.update(sql, params1);
			}
			return map.get("lastId");
		}
		else
			return 0;
	}

	public static void payOrder(String orderId) {
		// TODO Auto-generated method stub
		DBUtil1 db=new DBUtil1();
		String params[]={orderId};
		String sql="update t_order set order_status=2 where order_id=?";
		db.update(sql,params);
	}

	public static List<Order> getAllOrders(int userId, String status) {
		// TODO Auto-generated method stub
		List<Order> myorders=new ArrayList<Order>();
		DBUtil1 db=new DBUtil1();
		String sql="select * from t_order where user_id=?";
		if(status!=null)
			sql=sql+" and order_status='"+status+"'";
		String params[]={userId+""};
		List<Map<String,String>> orders=db.getList(sql,params);
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-mm-dd");
		if(orders!=null){
			for(Map<String,String> m:orders){
				Order o=new Order();
				o.setOrderId(Integer.parseInt(m.get("order_id")));
				o.setUserId(userId);
				o.setOrderAddress(m.get("order_address"));
				try {
					o.setOrderDate(sdf.parse(m.get("order_date")));
				} catch (ParseException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				o.setOrderCode(m.get("order_code"));
				o.setOrderStatus(Integer.parseInt(m.get("order_status")));
				o.setOrderPostalfee(Float.parseFloat(m.get("order_postalfee")));
				String sql1="select * from t_orderdetail where order_id=?";
				String params1[]={o.getOrderId()+""};
				List<Map<String,String>> od=db.getList(sql1,params1);
				List<OrderDetail> odetails=new ArrayList<OrderDetail>();
				//将map的商品详情转为orderDetail的详情
				if(od!=null){
					for(Map<String,String> mod:od){
						OrderDetail ord=new OrderDetail();
						ord.setGoodsId(Integer.parseInt(mod.get("goods_id")));
						ord.setOdetailName(mod.get("odetail_name"));
						ord.setOdetailNum(Integer.parseInt(mod.get("odetail_num")));
						ord.setOdetailPrice(Float.parseFloat(mod.get("odetail_price")));
						ord.setOdetailPic(mod.get("odetail_pic"));
						odetails.add(ord);
					}
				}
				o.setOdetails(odetails);
				myorders.add(o);
			}
		}
		return myorders;
	}
	
//	public static List<Order> getAllOrders(int userId, String status) {
//		PreparedStatement pstmt = null;
//		ResultSet rs = null;
//		Connection con = null;
//
//		try {
//			con = DBUtil.getCon();
//
//			String sql = "select * from t_order where user_id=?";
//			if (status != null)
//				sql = sql + " and order_status='" + status + "'";
//
//			pstmt = con.prepareStatement(sql);
//			pstmt.setInt(1, userId);
//			rs = pstmt.executeQuery();
//			
//			String sql_detail="select * from t_orderdetail where order_id=?";
//			PreparedStatement ps_detail=null;
//			ps_detail = con.prepareStatement(sql_detail);
//			ResultSet rs_detail=null;  
//
//			List<Order> list = new ArrayList<Order>();
//			while (rs.next()) {
//				Order order = new Order();
//				order.setOrderId(rs.getInt("order_id"));
//				order.setOrderCode(rs.getString("order_code"));
//				order.setOrderStatus(rs.getInt("order_status"));
//				order.setOrderDate(rs.getDate("order_date"));
//                //set values of order
//				ps_detail.setInt(1, rs.getInt("order_id"));
//				rs_detail = ps_detail.executeQuery();
//				List<OrderDetail> detailList = new ArrayList<OrderDetail>();
//				while (rs_detail.next()) {
//					OrderDetail orderDetail = new OrderDetail();
//					orderDetail.setOdetailId(rs_detail.getInt("odetail_id"));
//					orderDetail.setOrderId(rs_detail.getInt("order_id"));
//					orderDetail.setGoodsId(rs_detail.getInt("goods_id"));
//					orderDetail.setOdetailName(rs_detail.getString("odetail_name"));
//					orderDetail.setOdetailPrice(rs_detail.getFloat("odetail_price"));
//					orderDetail.setOdetailNum(rs_detail.getInt("odetail_num"));
//					orderDetail.setOdetailPic(rs_detail.getString("odetail_pic"));
//
//					detailList.add(orderDetail);
//				}
//				order.setOdetails(detailList);
//				list.add(order);
//			}
//
//			return list;
//
//		} catch (Exception e) {
//			e.printStackTrace();
//			return null;
//		} finally {
//			DBUtil.close(rs, pstmt, con);
//		}
//	}

	public static void changeOrderStatus(String orderId, String status) {
		// TODO Auto-generated method stub
		DBUtil1 db=new DBUtil1();
		String params[]={status,orderId};
		String sql="update t_order set order_status=? where order_id=?";
		db.update(sql,params);
	}

	public static void delOrder(String orderId) {
		// TODO Auto-generated method stub
		DBUtil1 db=new DBUtil1();
		String params[]={orderId};
		String sql="delete  from t_orderdetail where order_id=?";
		db.update(sql,params);
		sql="delete from t_order where order_id=?";
		db.update(sql,params);
	}

	public static Order getOrderDetailById(String orderId) {
		// TODO Auto-generated method stub
		DBUtil1 db=new DBUtil1();
		String sql="select * from t_order where order_id=?";
		String params[]={orderId};
		Order order=new Order();
		List<OrderDetail> odetails=new ArrayList<OrderDetail>();
		Map<String,String> order_map=db.getMap(sql, params);
		sql="select * from t_orderdetail where order_id=?";
		List<Map<String,String>> odetails_list=db.getList(sql, params);		
		if(odetails_list!=null){
			for(Map<String,String> mod:odetails_list){
				OrderDetail ord=new OrderDetail();
				ord.setGoodsId(Integer.parseInt(mod.get("goods_id")));
				ord.setOdetailName(mod.get("odetail_name"));
				ord.setOdetailNum(Integer.parseInt(mod.get("odetail_num")));
				ord.setOdetailPrice(Float.parseFloat(mod.get("odetail_price")));
				ord.setOdetailPic(mod.get("odetail_pic"));
				odetails.add(ord);
			}
		}
		order.setOdetails(odetails);
		order.setOrderId(Integer.parseInt(order_map.get("order_id")));
		order.setUserId(Integer.parseInt(order_map.get("user_id")));
		order.setOrderAddress(order_map.get("order_address"));
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-mm-dd");
		try {
			order.setOrderDate(sdf.parse(order_map.get("order_date")));
		} catch (ParseException e) {
			e.printStackTrace();
		}
		order.setOrderCode(order_map.get("order_code"));
		order.setOrderStatus(Integer.parseInt(order_map.get("order_status")));
		order.setOrderPostalfee(Float.parseFloat(order_map.get("order_postalfee")));
		return order;
	}

}
