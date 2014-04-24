package com.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.valueBean.UserSingle;

public class NeedLogonFilter implements Filter {
	private FilterConfig fc;
	
	public void destroy() {
		this.fc=null;
	}

	public void doFilter(ServletRequest sRequest, ServletResponse sResponse,FilterChain chain) throws IOException, ServletException {
		HttpServletRequest request=(HttpServletRequest)sRequest;
		HttpSession session=request.getSession();
		
		Object logoner=session.getAttribute("logoner");	
		if(logoner!=null&&(logoner instanceof UserSingle))					//用户已经登录
			chain.doFilter(sRequest,sResponse);
		else{																//没有登录
			String message="";
			if("review".equals(request.getParameter("action"))){			//如果进行的是"发表评论"、"发表留言"的操作
				String noname=request.getParameter("noname");
				if(!"true".equals(noname)){									//若不是匿名发表
					message="<li>您没有登录！</li><a href='javascript:window.history.go(-1)'>【返回】</a>";
					request.setAttribute("message",message);
					
					String forward=fc.getServletContext().getInitParameter("messagePage"); 
					RequestDispatcher rd=request.getRequestDispatcher(forward);
					rd.forward(sRequest,sResponse);
				}
				else														//若是匿名发表
					chain.doFilter(sRequest,sResponse);
			}
			else{															//如果进行的是其他操作，如＂加为好友＂
				message="<li>您没有登录！</li><a href='javascript:window.history.go(-1)'>【返回】</a>";
				request.setAttribute("message",message);
				
				String forward=fc.getServletContext().getInitParameter("messagePage"); 
				RequestDispatcher rd=request.getRequestDispatcher(forward);
				rd.forward(sRequest,sResponse);
			}
		}
	}

	public void init(FilterConfig fc) throws ServletException {
		this.fc=fc;
	}
}
