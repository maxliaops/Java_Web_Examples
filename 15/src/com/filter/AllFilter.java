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

public class AllFilter implements Filter {
	private FilterConfig fc;
	
	public void destroy() {
		this.fc=null;
	}

	public void doFilter(ServletRequest sRequest, ServletResponse sResponse,FilterChain chain) throws IOException, ServletException {
		HttpServletRequest request=(HttpServletRequest)sRequest;
		HttpSession session=request.getSession();
		Boolean mark=(Boolean)session.getAttribute("activation");
		
		request.setCharacterEncoding("gb2312");
		
		if(mark!=null&&mark)
			chain.doFilter(sRequest,sResponse);
		else{
			String message="<li>对不起，您已经与服务器断开！请<a href='goIndex'>【重新访问】</a></li>";
			request.setAttribute("message",message);
			
			String forward=fc.getServletContext().getInitParameter("messagePage");
			RequestDispatcher rd=request.getRequestDispatcher(forward);
			rd.forward(sRequest,sResponse);
		}
	}

	public void init(FilterConfig fc) throws ServletException {
		this.fc=fc;
	}
}
