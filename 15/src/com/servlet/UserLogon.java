package com.servlet;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.UserDao;
import com.toolsBean.Change;
import com.valueBean.UserSingle;

public class UserLogon extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
		doPost(request,response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
		String message="";
		String forward=getInitParameter("visitorLogonPage");
		HttpSession session=request.getSession();
		
		Object logoner=session.getAttribute("logoner");	
		if(logoner!=null&&(logoner instanceof UserSingle))					//用户已经登录
			message="<li>您已经登录！</li>";
		else{																//用户没有登录
			String name=Change.toChinese(request.getParameter("userName"));
			String pswd=Change.toChinese(request.getParameter("userPswd"));

			message=validateLogon(name,pswd);								//进行表单验证
			if(message.equals("")){											//表单验证成功
				try {
					UserDao userDao=new UserDao();
					logoner=userDao.getLogoner(new Object[]{name,pswd});
					if(logoner==null)
						message="<li>输入的　<b>用户名</b> 或　<b>密码</b>　不正确！</li>";
					else{
						message="<li>登录成功！</li>";
						session.setAttribute("logoner",logoner);
					}
				} catch (SQLException e) {
					message="<li>登录失败！</li>";
					e.printStackTrace();
				}
			}			
		}		
		
		request.setAttribute("message",message);
		RequestDispatcher rd=request.getRequestDispatcher(forward);
		rd.forward(request,response);		
	}
	private String validateLogon(String name,String pswd){
		String message="";
		if(name==null||name.equals(""))
			message="<li>请输入　<b>用户名！</b></li>";
		if(pswd==null||pswd.equals(""))
			message+="<li>请输入　<b>密&nbsp;&nbsp;码！</b></li>";
		return message;
	}
}
