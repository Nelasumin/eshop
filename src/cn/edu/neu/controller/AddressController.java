package cn.edu.neu.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fasterxml.jackson.databind.ObjectMapper;

import cn.edu.neu.model.Address;
import cn.edu.neu.model.Category;
import cn.edu.neu.model.User;
import cn.edu.neu.service.AddressService;
import cn.edu.neu.service.HomeService;

/**
 * Servlet implementation class AddressController
 */
@WebServlet(urlPatterns ={"/address/getMyAddress.action","/address/delAddress.action","/address/getAddressById.action","/address/handleAddress.action","/address/setDefaultAddress.action"})
public class AddressController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddressController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String url=req.getServletPath();
		req.setCharacterEncoding("utf-8");
		List<Category> catelist = HomeService.getcateList();
	    req.setAttribute("catelist", catelist);
	    User logu=(User)req.getSession().getAttribute("_LOGIN_USER_");
	    if(logu==null){
	    	req.setAttribute("msg", "登录已过期，请重新登录！！");
	    	req.getRequestDispatcher("/usercenter/index.jsp").forward(req, resp);
	    }
	    else if(url.equals("/address/getMyAddress.action")){
	    	List<Address> addresses=AddressService.getAllAddress(logu.getUserId());
	    	req.setAttribute("addrs",addresses);
	    	req.getRequestDispatcher("/address/addressList.jsp").forward(req, resp);
	    } else if(url.equals("/address/delAddress.action")){
	    	String addrId=req.getParameter("addrId");
	    	AddressService.delAddressById(addrId);
	    	req.getRequestDispatcher("/address/getMyAddress.action").forward(req, resp);
	    } else if(url.equals("/address/getAddressById.action")){
	     	resp.setContentType("text/json; charset=utf-8");
			PrintWriter out = resp.getWriter();
			String addrId=req.getParameter("addrId");
	    	Address addr=AddressService.getAddressById(addrId);
	    	if(addr!=null){
	    		ObjectMapper mapper = new ObjectMapper();  	
	    		String jsonlist = mapper.writeValueAsString(addr);  
	    		out.print(jsonlist);
	    		}
	    	
	    }
	    else if(url.equals("/address/handleAddress.action")){
	    	String addrId=req.getParameter("addrId");
	    	String index=req.getParameter("index");
	    	Address addr=new Address();
	       	addr.setAddrArea(req.getParameter("addrArea"));
	    	addr.setAddrCity(req.getParameter("addrCity"));
	    	addr.setAddrContent(req.getParameter("addrContent"));
	       	addr.setAddrProvince(req.getParameter("addrProvince"));
	    	addr.setAddrReceiver(req.getParameter("addrReceiver"));
	    	addr.setAddrTel(req.getParameter("addrTel"));
	    	if(addrId.equals("0")){
	    		addr.setUserId(logu.getUserId());
	    		int newaddrId=AddressService.addAddress(addr);
	    		PrintWriter out = resp.getWriter();
		     	out.print("{\"index\":false,\"addrId\":"+newaddrId+"}");
	    	}
	    	else
	    	{
	    		addr.setAddrId(Integer.parseInt(addrId));
	    		AddressService.updateAddress(addr);
	    		PrintWriter out = resp.getWriter();
		     	out.print("{\"index\":"+index+"}");
	    	 
	    	}
	    	//req.getRequestDispatcher("/address/getMyAddress.action").forward(req, resp);
	    }
	    else if(url.equals("/address/setDefaultAddress.action")){
	    	resp.setContentType("text/json; charset=utf-8");
			PrintWriter out = resp.getWriter();
	    	String addrId=req.getParameter("addrId");
	    	if(AddressService.setDefaultAddress(addrId,logu.getUserId()))
	    		out.print("{\"setDefault\":\"success\"}");
	    	else
	    		out.print("{\"setDefault\":\"failure\"}");
	    	//req.getRequestDispatcher("/address/getMyAddress.action").forward(req, resp);
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
