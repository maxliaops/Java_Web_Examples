package com.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.UserDao;

public class IndexServlet extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
		doPost(request,response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
		HttpSession session=request.getSession();
		session.setAttribute("activation",true);			//向session中注册一个属性，并赋值为true，表示用户激活session。我们将在AllFilter过滤器中判断session中该属性值是否存在并且是否为true来判断session是否过期。session的有效期限，我们在web.xml文件中通过了<session-config>元素进行了设置。
		try{
			UserDao mainDao=new UserDao();
			List masterlist=mainDao.getMasterList();
			request.setAttribute("masterlist",masterlist);	
		}catch(Exception e){
			System.out.println("IndexServlet类中doPost方法出错！");
			e.printStackTrace();
		}		
		
		String forward=getInitParameter("showWelcome");
		RequestDispatcher rd=request.getRequestDispatcher(forward);
		rd.forward(request,response);		
	}
}