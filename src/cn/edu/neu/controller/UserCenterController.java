package cn.edu.neu.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.edu.neu.model.Category;
import cn.edu.neu.model.User;
import cn.edu.neu.service.HomeService;
import cn.edu.neu.service.UserService;

/**
 * Servlet implementation class UserCenter
 */
@WebServlet(urlPatterns ={"/usercenter/updatePersonalPassword.action","/usercenter/index.action","/usercenter/getPersonalInfo.action","/usercenter/updatePersonalInfo.action","/usercenter/getPersonalPassword.action"})
public class UserCenterController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserCenterController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String url=req.getServletPath();
		req.setCharacterEncoding("utf-8");
		List<Category> catelist = HomeService.getcateList();
	    req.setAttribute("catelist", catelist);
	    User logu=(User)req.getSession().getAttribute("_LOGIN_USER_");
	    if(logu==null){
	    	req.setAttribute("msg", "登录已过期，请重新登录！");
	    	req.getRequestDispatcher("/usercenter/index.jsp").forward(req, res);
	    }
	    else if(url.equals("/usercenter/index.action")){
	    	req.getRequestDispatcher("/usercenter/index.jsp").forward(req, res);
	    }
	    else if(url.equals("/usercenter/getPersonalInfo.action")){
	    	User u=UserService.getUserByUserId(logu.getUserId());
	    	req.setAttribute("user", u);
	    	req.getRequestDispatcher("/usercenter/updatePersonalInfo.jsp").forward(req, res);	    	
	    }
	    else if(url.equals("/usercenter/updatePersonalInfo.action")){
	    	String uid=req.getParameter("userId");
	    	String usex=req.getParameter("userSex");
	    	String uage=req.getParameter("userAge");
	    	String uemail=req.getParameter("userEmail");
	    	User newu=new User();
	    	newu.setUserId(Integer.parseInt(uid));
	    	newu.setUserSex((usex==null)?0:Integer.parseInt(usex));
	    	newu.setUserEmail(uemail);
	    	newu.setUserAge(Integer.parseInt(uage));
	    	int i=UserService.UpdateUserInfo(newu);
	    	req.setAttribute("msg", "个人信息修改成功");
	    	req.getRequestDispatcher("/usercenter/index.jsp").forward(req, res);
	    }
	    else if(url.equals("/usercenter/getPersonalPassword.action")){
	    	req.getRequestDispatcher("/usercenter/updatePersonalPassword.jsp").forward(req, res);
	    }	
	    else if(url.equals("/usercenter/updatePersonalPassword.action")){
	    	String newUserPass=req.getParameter("newUserPass");
	    	String userPass=req.getParameter("userPass");
	    	String userId=logu.getUserId()+"";
	    	boolean result=UserService.CheckUserPass(userId,userPass);
	    	if(result){
	    			UserService.UpdateUserPass(userId,newUserPass);
	        		req.setAttribute("msg", "密码修改成功");}
	    	else
	    		req.setAttribute("msg", "原密码错误，密码修改失败");
	    	req.getRequestDispatcher("/usercenter/index.jsp").forward(req, res);
	    }
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
