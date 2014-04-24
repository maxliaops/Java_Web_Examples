package com.servlet;

import java.io.IOException;
import java.sql.SQLException;
import java.util.Date;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.ElectDao;
import com.toolsBean.Change;
import com.valueBean.UserSingle;

public class ElectServlet extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
		doPost(request,response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
		String action=request.getParameter("action");
		if("adminList".equals(action))
			doAdminList(request,response);
		else if("insert".equals(action))
			doInsert(request,response);
		else if("delete".equals(action))
			doDelete(request,response);
		else
			doOther(request,response);
	}	
	
	protected void doAdminList(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
		request.setAttribute("mainPage",getInitParameter("adminListPage"));
		HttpSession session=request.getSession();
		UserSingle logoner=(UserSingle)session.getAttribute("logoner");

		int whoid=logoner.getId();
		System.out.println(whoid);
		List electlist=null;
		ElectDao electDao=new ElectDao();		
		try {
			electlist=electDao.getListElect(whoid);
			
		} catch (SQLException e) {
			System.out.println("后台－获取推荐文章失败！");
			e.printStackTrace();			
		}		
		request.setAttribute("electlist",electlist);

		String forward=getServletContext().getInitParameter("adminTemp");
		RequestDispatcher rd=request.getRequestDispatcher(forward);
		rd.forward(request,response);
	}
	protected void doInsert(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
		request.setAttribute("mainPage",getInitParameter("insertPage"));
		String message="";
		String forward=getServletContext().getInitParameter("adminTemp");
		HttpSession session=request.getSession();
		String type=request.getParameter("type");

		if("add".equals(type)){										//通过单击“添加”提交按钮触发的请求
			message=validateElect(request);							//进行表单验证
			if("".equals(message)){									//表单验证成功
				int whoId=((UserSingle)session.getAttribute("logoner")).getId();
				String title=request.getParameter("title");
				String src=request.getParameter("src");
				String time=Change.dateTimeChange(new Date());
				Object[] params={whoId,title,src,time};

				int i=0;
				try {
					ElectDao electDao=new ElectDao();
					i=electDao.insert(params);
				} catch (SQLException e) {
					i=-1;
					e.printStackTrace();
				}
				if(i<=0)
					message="<li>添加推荐文章失败！</li>";
				else{
					message="<li>添加推荐文章成功！</li>";
					forward="/my/admin/elect?action=adminList";
				}
			}
		}
		
		request.setAttribute("message",message);
		RequestDispatcher rd=request.getRequestDispatcher(forward);
		rd.forward(request,response);
	}
	protected void doDelete(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
		String message="";
		String forward="";
		int id=Change.strToInt(request.getParameter("id"));
		
		int i=0;
		try {
			ElectDao electDao=new ElectDao();
			i=electDao.delete(id);
		} catch (SQLException e) {
			i=-1;
			e.printStackTrace();
		}
		if(i<=0){
			message="<li>删除失败！<a href='javascript:window.history.go(-1)'>【返回】</a></li>";
			forward=getServletContext().getInitParameter("messagePage");
		}
		else{
			message="<li>删除成功！</li>";
			forward="/my/admin/elect?action=adminList";
		}
		request.setAttribute("message",message);

		RequestDispatcher rd=request.getRequestDispatcher(forward);
		rd.forward(request,response);
	}
	protected void doOther(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
		
	}
	private String validateElect(HttpServletRequest request){
		String message="";
		String title=request.getParameter("title");
		String src=request.getParameter("src");
		if(title==null||title.equals(""))
			message="<li>请输入 <b>文章标题</b>！";
		if(src==null||src.equals(""))
			message+="<li>请输入 <b>文章链接地址</b>！";
		return message;
	}
}
