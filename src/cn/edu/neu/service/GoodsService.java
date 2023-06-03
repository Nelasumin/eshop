package cn.edu.neu.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import cn.edu.edu.dao.DBUtil;
import cn.edu.edu.dao.DBUtil1;
import cn.edu.neu.model.Category;
import cn.edu.neu.model.Goods;
import cn.edu.neu.model.GoodsDetail;
import cn.edu.neu.model.GoodsDetailType;
import cn.edu.neu.model.Pic;

public class GoodsService {


    //获取商品详情信息
	public static Goods getGoodsDetail(int goods_id) {
		  PreparedStatement pstmt=null;
		  ResultSet rs=null;
		  Connection con=null;		
		
		try{		
			con=DBUtil.getCon();
		
		String sql="select * from t_goods where goods_id=?";

		
		//获取商品详情分类信息
		String sql_type="select distinct t.type_id, t.type_name from t_goodsdetail g join t_goodsdetailtype t on g.type_id=t.type_id where goods_id=?";
		PreparedStatement ps_type=null;
		ResultSet rs_type=null;    
		
		pstmt=con.prepareStatement(sql);
		pstmt.setInt(1, goods_id);
		rs=pstmt.executeQuery();
		

		Goods good=new Goods();
		while(rs.next()){ 	    
            good.setCateId(rs.getInt("cate_id"));
            good.setGoodsId(rs.getInt("goods_id"));
            good.setGoodsName(rs.getString("goods_name"));
            good.setGoodsPrice(rs.getFloat("goods_price"));
            good.setGoodsPic(rs.getString("goods_pic"));
            good.setGoodsDiscount(rs.getFloat("goods_discount"));
            good.setGoodsOrigin(rs.getString("goods_origin"));
            good.setGoodsPostalfee(rs.getInt("goods_postalfee"));
            good.setGoodsDisc(rs.getString("goods_disc"));     
            good.setGoodsSales(rs.getInt("goods_sales"));
		}
		
		//获取商品图片信息
		String sql_pic="select * from t_pic where goods_Id=?";
		PreparedStatement ps_pic=null;
		ResultSet rs_pic=null;
		List<Pic> pics=new ArrayList<Pic>();		
        ps_pic=con.prepareStatement(sql_pic);
        ps_pic.setInt(1, goods_id);
        rs_pic=ps_pic.executeQuery();
        
        while(rs_pic.next()){
        	Pic pic=new Pic();
        	pic.setGoodsId(goods_id);
        	pic.setPicId(rs_pic.getInt("pic_id"));
        	pic.setPicUrl(rs_pic.getString("pic_url"));
        	pics.add(pic);
        	
        }
//        System.out.println("===-------"+pics);
        good.setPics(pics);

		//获取商品详情信息
		String sql_detail="select * from t_goodsdetail g where goods_id=? and type_id=?";
		PreparedStatement ps_detail=null;
		ResultSet rs_detail=null;				
		
		List<GoodsDetailType> typelist=new ArrayList<GoodsDetailType>();		
		ps_type=con.prepareStatement(sql_type);
		ps_type.setInt(1, goods_id);
		rs_type=ps_type.executeQuery();
		while(rs_type.next()){
			GoodsDetailType type=new GoodsDetailType();
			type.setTypeId(rs_type.getInt("type_id"));
			type.setTypeName(rs_type.getString("type_name"));
							          
	          ps_detail=con.prepareStatement(sql_detail);
	          ps_detail.setInt(1, goods_id);
	          ps_detail.setInt(2, rs_type.getInt("type_id"));
	          rs_detail=ps_detail.executeQuery();     
	          List<GoodsDetail> detaillist=new ArrayList<GoodsDetail>();
	          while(rs_detail.next()){
	        	GoodsDetail goodsdetail=new GoodsDetail();
	          	goodsdetail.setGoodsId(goods_id);
	          	goodsdetail.setContentId(rs_detail.getInt("content_id"));
	          	goodsdetail.setContent(rs_detail.getString("content"));	 
//	          	System.out.println("----"+rs_detail.getString("content"));
	          	detaillist.add(goodsdetail);
	          }	
	          type.setDetail(detaillist);
	          typelist.add(type);
		}
		good.setTypelist(typelist);
		  
		return good;
		
		}catch(Exception e){
         e.printStackTrace();
         return null;
		}finally{
			DBUtil.close(rs,pstmt,con);
		}
	}
    //根据goods_id获取商品分类信息
	public static Category getCateName(int goods_id) {
		  PreparedStatement pstmt=null;
		  ResultSet rs=null;
		  Connection con=null;		
		
		try{		
			con=DBUtil.getCon();
		
		String sql="select * from t_category c join t_goods g on c.cate_id=g.cate_id where g.goods_id=?";
		pstmt=con.prepareStatement(sql);
		pstmt.setInt(1, goods_id);
		rs=pstmt.executeQuery();
		Category cate=new Category();
		while(rs.next()){
			cate.setCateId(rs.getInt("cate_id"));
			cate.setCateName(rs.getString("cate_name"));
		}	
		
		return cate;
		
		}catch(Exception e){
         e.printStackTrace();
         return null;
		}finally{
			DBUtil.close(rs,pstmt,con);
		}
	}
	
	//获取最新商品信息列表
	public static List<Goods> getNewgoods() {
		  PreparedStatement pstmt=null;
		  ResultSet rs=null;
		  Connection con=null;		
		
		try{		
			con=DBUtil.getCon();
			
		String sql="select goods_id ,cate_id ,goods_name ,goods_price ,"
				+ "	goods_discount ,goods_stock ,goods_date ,goods_sales,goods_pic"
				+ " from t_goods order by goods_date desc limit 0,12";
		pstmt=con.prepareStatement(sql);
		rs=pstmt.executeQuery();
		
        List<Goods> list=new ArrayList<Goods>();
		while(rs.next()){ 
			Goods good=new Goods();
            good.setGoodsId(rs.getInt("goods_id"));
            good.setGoodsName(rs.getString("goods_name"));
            good.setGoodsPrice(rs.getFloat("goods_price"));
            good.setGoodsPic(rs.getString("goods_pic"));
            good.setGoodsDiscount(rs.getFloat("goods_discount"));  
            good.setGoodsSales(rs.getInt("goods_sales"));
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
	//获取热销商品信息列表
	public static List<Goods> getSalegoods() {
		  PreparedStatement pstmt=null;
		  ResultSet rs=null;
		  Connection con=null;		
		
		try{		
			con=DBUtil.getCon();
			
		String sql="select goods_id,cate_id ,goods_name,goods_price,"
				+ "goods_discount,goods_stock,goods_date,goods_sales,goods_pic"
				+ " from t_goods order by goods_sales desc limit 0,12";
		pstmt=con.prepareStatement(sql);
		rs=pstmt.executeQuery();
		
        List<Goods> list=new ArrayList<Goods>();
		while(rs.next()){ 
			Goods good=new Goods();
            good.setGoodsId(rs.getInt("goods_id"));
            good.setGoodsName(rs.getString("goods_name"));
            good.setGoodsPrice(rs.getFloat("goods_price"));
            good.setGoodsPic(rs.getString("goods_pic"));
            good.setGoodsDiscount(rs.getFloat("goods_discount"));  
            good.setGoodsSales(rs.getInt("goods_sales"));
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
	
	//根据商品分类获取分类下商品信息。
	public static List<Goods> getCategoods(int childid,String sort) {
		  PreparedStatement pstmt=null;
		  ResultSet rs=null;
		  Connection con=null;		
		
		try{		
			con=DBUtil.getCon();
			
		String sql="select goods_id,cate_id ,goods_name,goods_price,"
				+ "goods_discount,goods_stock,goods_date,goods_sales,goods_pic"
				+ " from t_goods where cate_id=?";
		
		//*************************************************************
		if(sort==null) sort="5";
		if(sort.equals("1")) sql=sql+"  order by goods_discount asc";
		else if(sort.equals("2")) sql=sql+"  order by goods_discount desc";
		else if(sort.equals("3")) sql=sql+"  order by goods_sales desc";
		else if(sort.equals("4")) sql=sql+"  order by goods_sales asc";
		else if(sort.equals("5")) sql=sql+"  order by goods_date asc";
		//*************************************************************
		
		pstmt=con.prepareStatement(sql);
		pstmt.setInt(1, childid);
		rs=pstmt.executeQuery();
		
      List<Goods> list=new ArrayList<Goods>();
		while(rs.next()){ 
			Goods good=new Goods();
          good.setGoodsId(rs.getInt("goods_id"));
          good.setGoodsName(rs.getString("goods_name"));
          good.setGoodsPrice(rs.getFloat("goods_price"));
          good.setGoodsPic(rs.getString("goods_pic"));
          good.setGoodsDiscount(rs.getFloat("goods_discount"));  
          good.setGoodsSales(rs.getInt("goods_sales"));
          list.add(good);
		}
//		System.out.println("----------"+list.size());
		return list;
		
		}catch(Exception e){
       e.printStackTrace();
       return null;
		}finally{
			DBUtil.close(rs,pstmt,con);
		}
	}
	//byzmh
	private static List<Goods> maptomodel(List<Map<String,String>> goods_map){
		List<Goods> goods=new ArrayList<Goods>();
		for(Map<String,String> g_map:goods_map){
			Goods g_list=new Goods();
			g_list.setGoodsId(Integer.parseInt(g_map.get("goods_id")));
			g_list.setGoodsName(g_map.get("goods_name"));
			g_list.setGoodsPic(g_map.get("goods_pic"));
			g_list.setGoodsPrice(Float.parseFloat(g_map.get("goods_price")));
			g_list.setGoodsDiscount((Float.parseFloat(g_map.get("goods_discount"))));
			g_list.setGoodsSales(Integer.parseInt(g_map.get("goods_sales"
					+ ""
					+ "")));
			goods.add(g_list);
		}
		return goods;
		
	}
	//byzmh
	public static List<Goods> searchGoodsByKeywords(String name,String sort) {
		// TODO Auto-generated method stub
		DBUtil1 db=new DBUtil1();
		String sql="select * from t_goods where goods_name like ? ";//不对写成 '%?%',必须把%一起作为参数
		
		//********************************************************
		if(sort!=null)
		  if(sort.equals("1"))
				sql=sql+" order by goods_discount asc";
		  else if(sort.equals("2"))
			  sql=sql+" order by goods_discount  desc";
		  else if(sort.equals("3"))
			  sql=sql+" order by goods_sales desc";
		  else if(sort.equals("4"))
			  sql=sql+" order by goods_sales asc";
		  else if(sort.equals("6"))
			  sql=sql+" order by goods_price asc";
		  else if(sort.equals("7"))
			  sql=sql+" order by goods_price desc";
		//********************************************************  
		
		String params[]={"%"+name+"%"};
		List<Map<String,String>> goods_map=db.getList(sql,params);
		if(goods_map!=null)
			return maptomodel(goods_map);
		else
			return null;
	}
}
