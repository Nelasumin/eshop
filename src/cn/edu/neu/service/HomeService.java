package cn.edu.neu.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;



import cn.edu.edu.dao.DBUtil;
import cn.edu.neu.model.Category;
import cn.edu.neu.model.Goods;
import cn.edu.neu.model.User;

public class HomeService {

	
    //获取今日推荐商品信息
	public static List getTodayGoodsList() {
		  PreparedStatement pstmt=null;
		  ResultSet rs=null;
		  Connection con=null;		
		
		try{		
			con=DBUtil.getCon();
		
		String sql="select * from t_goods where istoday=1";
		pstmt=con.prepareStatement(sql);
		rs=pstmt.executeQuery();
        List<Map<String,String>> list=new ArrayList<Map<String,String>>();
		while(rs.next()){

			Map map=new HashMap();
			map.put("goods_id", rs.getString("goods_id"));
			map.put("goods_name",rs.getString("goods_name"));
			map.put("goods_price", rs.getString("goods_price"));
			map.put("goods_pic", rs.getString("goods_pic"));
			map.put("goods_discount", rs.getString("goods_discount"));
			list.add(map);
		}	
		return list;
		}catch(Exception e){
           e.printStackTrace();
           return null;
		}finally{
			DBUtil.close(rs,pstmt,con);
		}
	}

	//首页，商品大类、子类及最新商品信息
	public static List<Category> getcateList() {		
		  PreparedStatement pstmt=null;
		  ResultSet rs=null;
		  Connection con=null;		
		
		try{		
			con=DBUtil.getCon();
		
			String sql_parent_cate="select * from t_category where parentid is null";
			String sql_child_cate="select * from t_category where parentid =?";
			String sql_goods="select * from t_goods where cate_Id in(select cate_id from t_category where parentid =?)  order by goods_date desc";
			
			pstmt=con.prepareStatement(sql_parent_cate);
			rs=pstmt.executeQuery();
	
	        List<Category> list=new ArrayList<Category>();
	        
			while(rs.next()){
	            Category cate=new Category();
	            cate.setCateId(rs.getInt("cate_id"));
	            cate.setCateName(rs.getString("cate_name"));
	            cate.setCateDesc(rs.getString("cate_desc"));
	            //获取商品子类
	            PreparedStatement ps=con.prepareStatement(sql_child_cate);
	            ps.setInt(1, rs.getInt("cate_id"));

	            ResultSet rs_child=ps.executeQuery();
	            List<Map<String,String>> childlist=new ArrayList<Map<String,String>>();
	            while(rs_child.next()){
	            	if(rs_child.getRow()<8){
		    			Map map=new HashMap();
		    			map.put("childid", rs_child.getInt("cate_id"));
		    			map.put("childname",rs_child.getString("cate_name"));	            	

		            	childlist.add(map);
		            	cate.setChildlist(childlist);	            		
	            	} 
	            }
	            //获取最新商品信息
	            PreparedStatement ps_goods=con.prepareStatement(sql_goods);
	            ps_goods.setInt(1, rs.getInt("cate_id"));	            
	            ResultSet rs_goods=ps_goods.executeQuery();
	            List<Goods> goodslist=new ArrayList<Goods>();
	            while(rs_goods.next()){
	            	if(rs_goods.getRow()<7){
	            	    Goods good=new Goods();
                        good.setCateId(rs_goods.getInt("cate_id"));
                        good.setGoodsId(rs_goods.getInt("goods_id"));
                        good.setGoodsName(rs_goods.getString("goods_name"));
                        good.setGoodsPrice(rs_goods.getFloat("goods_price"));
                        good.setGoodsPic(rs_goods.getString("goods_pic"));
                        good.setGoodsDiscount(rs_goods.getFloat("goods_discount"));
                        goodslist.add(good);
		            	cate.setGoodslist(goodslist);	            		
	            	} 
	            }	            
	            
	            list.add(cate);
			}	
			return list;
			}catch(Exception e){
	         e.printStackTrace();
	         return null;
			}finally{
				DBUtil.close(rs,pstmt,con);
			}
	}

	//获取热销商品
	public static List<Goods> getHotGoodsList() {
		  PreparedStatement pstmt=null;
		  ResultSet rs=null;
		  Connection con=null;		
		
		try{		
			con=DBUtil.getCon();
		
			String sql_goods="select * from t_goods order by goods_sales desc limit 50";
			
			pstmt=con.prepareStatement(sql_goods);
			rs=pstmt.executeQuery();
	
	        List<Goods> list=new ArrayList<Goods>();
	        
			while(rs.next()){
        	    Goods good=new Goods();
                good.setCateId(rs.getInt("cate_id"));
                good.setGoodsId(rs.getInt("goods_id"));
                good.setGoodsName(rs.getString("goods_name"));
                good.setGoodsPrice(rs.getFloat("goods_price"));
                good.setGoodsDiscount(rs.getFloat("goods_discount"));
                good.setGoodsPic(rs.getString("goods_pic"));
                list.add(good);

			}	
			return list;
			}catch(Exception e){
	         e.printStackTrace();
	         return null;
			}finally{
				DBUtil.close(rs,pstmt,con);
			}
	}
    //验证用户名和密码
	public static User getCheckUser(String username, String password) {
		  PreparedStatement pstmt=null;
		  ResultSet rs=null;
		  Connection con=null;		
		  
		try{		
			con=DBUtil.getCon();
		
			String sql="select * from t_user where user_name=? and user_pass=?";
			
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, username);
			pstmt.setString(2, password);
			rs=pstmt.executeQuery();
	        rs.next();
            User user=new User();
            user.setUserName(rs.getString("user_name"));
            user.setUserId(rs.getInt("user_id"));
			return user;
			
			}catch(Exception e){
	         e.printStackTrace();
	         return null;
			}finally{
				DBUtil.close(rs,pstmt,con);
			}
	}

    //新用户注册
	public static int regUser(Map<String, String[]> map) {
		  PreparedStatement pstmt=null;
		  Connection con=null;		
		  
		try{		
			con=DBUtil.getCon();
		
			String sql="insert into t_user (user_name,user_pass,user_age,user_sex,user_email) values (?,?,?,?,?)";

			
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1,map.get("userName")[0]);
			pstmt.setString(2, map.get("userPass")[0]);

			if(map.get("userAge")[0]!=""){
				pstmt.setInt(3,Integer.parseInt(map.get("userAge")[0]));
			}else{
				pstmt.setString(3,null);
			}
			
			pstmt.setInt(4, Integer.parseInt(map.get("userSex")[0]));
			pstmt.setString(5, map.get("userEmail")[0]);

			int i=pstmt.executeUpdate();
			return i;
			}catch(Exception e){
	         e.printStackTrace();
            return -1;
			}finally{
				DBUtil.close(null,pstmt,con);
			}		
		
	}


}
