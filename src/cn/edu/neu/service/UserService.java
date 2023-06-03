package cn.edu.neu.service;

import java.util.Map;

import cn.edu.edu.dao.DBUtil1;
import cn.edu.neu.model.User;

public class UserService {

	public static User getUserByUserId(int userId) {
		// TODO Auto-generated method stub
		DBUtil1 db=new DBUtil1();
		String sql="select * from t_user where user_id="+userId;
		Map<String,String> u=db.getMap(sql);
		User user=new User();
		user.setUserName(u.get("user_name"));
		user.setUserPass(u.get("user_pass"));
		user.setUserAge(Integer.parseInt(u.get("user_age")));
		user.setUserEmail(u.get("user_email"));
		user.setUserSex(Integer.parseInt(u.get("user_sex")));
		return user;
	}

	public static int UpdateUserInfo(User newu) {
		// TODO Auto-generated method stub
		DBUtil1 db=new DBUtil1();
		String sql="update t_user set user_sex=?,user_email=?,user_age=? where user_id=?";
		String params[]={newu.getUserSex()+"",newu.getUserEmail(),newu.getUserAge()+"",newu.getUserId()+""};
		return db.update(sql,params);
	
	}

	public static int UpdateUserPass(String userId, String newUserPass) {
		// TODO Auto-generated method stub
		DBUtil1 db=new DBUtil1();
		String sql="update t_user set user_pass=? where user_id=?";
		String params[]={newUserPass,userId};
		return db.update(sql,params);
	}

	public static boolean CheckUserPass(String userId, String userPass) {
		// TODO Auto-generated method stub
		DBUtil1 db=new DBUtil1();
		String sql="select * from t_user where user_id=? and user_pass=?";
		String params[]={userId,userPass};
		if(db.getMap(sql,params)==null)
			return false;
		else
			return true;
	}

}
