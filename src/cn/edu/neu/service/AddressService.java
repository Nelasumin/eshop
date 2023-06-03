package cn.edu.neu.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import cn.edu.edu.dao.DBUtil1;
import cn.edu.neu.model.Address;

public class AddressService {

	public static List<Address> getAllAddress(int userId) {
		// TODO Auto-generated method stub
		DBUtil1 db=new DBUtil1();
		String sql="select * from t_address where user_id=?";
		String params[]={userId+""};
		List<Map<String,String>> addrs=db.getList(sql,params);
		List<Address> addrs_model=new ArrayList<Address>();
		if(addrs!=null)
		for(Map<String,String> addrs_map:addrs){
			Address a=new Address();
			a.setAddrId(Integer.parseInt(addrs_map.get("addr_id")));
			a.setAddrArea(addrs_map.get("addr_area"));
			a.setAddrCity(addrs_map.get("addr_city"));
			a.setAddrContent(addrs_map.get("addr_content"));
			a.setAddrIsdefault(Integer.parseInt(addrs_map.get("addr_isdefault")));
			a.setAddrProvince(addrs_map.get("addr_province"));
			a.setAddrReceiver(addrs_map.get("addr_receiver"));
			a.setAddrTel(addrs_map.get("addr_tel"));
			a.setUserId(Integer.parseInt(addrs_map.get("user_id")));
			addrs_model.add(a);
		}
		return addrs_model;
	}
	
	

	public static void delAddressById(String addrId) {
		DBUtil1 db=new DBUtil1();
		String sql="delete from t_address where addr_id=?";
		String params[]={addrId};
		db.update(sql,params);		
	}



	public static Address getAddressById(String addrId) {
		// TODO Auto-generated method stub
		DBUtil1 db=new DBUtil1();
		String sql="select * from t_address where addr_id=?";
		String params[]={addrId};
		Map<String,String> addrs_map=db.getMap(sql,params);
		Address a=new Address();
		if(addrs_map!=null){
			a.setAddrId(Integer.parseInt(addrs_map.get("addr_id")));
			a.setAddrArea(addrs_map.get("addr_area"));
			a.setAddrCity(addrs_map.get("addr_city"));
			a.setAddrContent(addrs_map.get("addr_content"));
			a.setAddrIsdefault(Integer.parseInt(addrs_map.get("addr_isdefault")));
			a.setAddrProvince(addrs_map.get("addr_province"));
			a.setAddrReceiver(addrs_map.get("addr_receiver"));
			a.setAddrTel(addrs_map.get("addr_tel"));
			a.setUserId(Integer.parseInt(addrs_map.get("user_id")));
		}
		return a;
	}



	public static int addAddress(Address addr) {
		// TODO Auto-generated method stub
		DBUtil1 db=new DBUtil1();
		String sql="insert into t_address values(null,?,?,?,?,?,?,?,0)";
		String params[]={addr.getUserId()+"",addr.getAddrProvince(),addr.getAddrCity(),
				addr.getAddrArea(),addr.getAddrContent(),addr.getAddrReceiver(),addr.getAddrTel()};
		Map<String,Integer> map=db.insert(sql, params);
		int addrId=map.get("lastId");
		return addrId;
	}



	public static void updateAddress(Address addr) {
		// TODO Auto-generated method stub
		DBUtil1 db=new DBUtil1();
		String sql="update t_address set addr_province=?,addr_city=?,addr_area=?,addr_content=?,addr_receiver=?,addr_tel=? where addr_id=?";
		String params[]={addr.getAddrProvince(),addr.getAddrCity(),
				addr.getAddrArea(),addr.getAddrContent(),addr.getAddrReceiver(),addr.getAddrTel(),addr.getAddrId()+""};
		db.update(sql, params);
	}



	public static boolean setDefaultAddress(String addrId, int userId) {
		// TODO Auto-generated method stub
		DBUtil1 db=new DBUtil1();
		String sql="update t_address set addr_isdefault=0 where user_id=?";
		String params[]={userId+""};
		db.update(sql,params);
		sql="update t_address set addr_isdefault=1 where addr_id=?";
		params[0]=addrId;
		if(db.update(sql,params)>0)
			return true;
		else
			return false;
	}

}
