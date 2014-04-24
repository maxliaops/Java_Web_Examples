package com.servlet;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.FriendDao;
import com.dao.PhotoDao;
import com.toolsBean.Change;
import com.valueBean.UserSingle;

public class FriendServlet extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
		doPost(request,response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
		String action=request.getParameter("action");
		if("listShow".equals(action))
			doListShow(request,response);
		else if("adminList".equals(action))
			doAdminList(request,response);
		else if("adminSingle".equals(action))
			doAdminSingle(request,response);
		else if("insert".equals(action))
			doInsert(request,response);
		else if("delete".equals(action))
			doDelete(request,response);
		else
			doOther(request,response);
	}
	protected void doListShow(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
		HttpSession session=request.getSession();
		UserSingle callBlogMaster=(UserSingle)session.getAttribute("callBlogMaster");

		int userid=callBlogMaster.getId();
		List friendList=null;
		FriendDao friendDao=new FriendDao();		
		try {
			friendList=friendDao.getListFriend(userid);
		} catch (SQLException e) {
			System.out.println("获取好友列表失败！");
			e.printStackTrace();			
		}
		request.setAttribute("friendList",friendList);

		String forward=getInitParameter("listShowPage");
		RequestDispatcher rd=request.getRequestDispatcher(forward);
		rd.forward(request,response);
	}	
	protected void doAdminList(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
		request.setAttribute("mainPage",getInitParameter("adminListPage"));
		HttpSession session=request.getSession();
		UserSingle logoner=(UserSingle)session.getAttribute("logoner");

		int whoid=logoner.getId();
		List friendList=null;
		FriendDao friendDao=new FriendDao();		
		try {
			friendList=friendDao.getListFriend(whoid);
		} catch (SQLException e) {
			System.out.println("后台－获取好友列表失败！");
			e.printStackTrace();			
		}
		request.setAttribute("friendList",friendList);

		String forward=getServletContext().getInitParameter("adminTemp");
		RequestDispatcher rd=request.getRequestDispatcher(forward);
		rd.forward(request,response);
	}
	protected void doAdminSingle(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
		int id=Change.strToInt(request.getParameter("id"));
		UserSingle single=null;
		try {
			FriendDao friendDao=new FriendDao();		
			single=friendDao.getFriendInfo(id);
		} catch (SQLException e) {
			System.out.println("后台－获取好友详细信息失败！");
			e.printStackTrace();			
		}
		request.setAttribute("friendSingle",single);

		String forward=getInitParameter("adminSinglePage");
		RequestDispatcher rd=request.getRequestDispatcher(forward);
		rd.forward(request,response);
	}
	protected void doInsert(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
		HttpSession session=request.getSession();		
		UserSingle callMaster=(UserSingle)session.getAttribute("callBlogMaster");
		UserSingle logoner=(UserSingle)session.getAttribute("logoner");
		
		int whoid=logoner.getId();									//获取当前登录用户ID
		int userid=callMaster.getId();								//获取被访问的博客的博主ID

		Object[] params={whoid,userid};
		String message="";
		
		if(whoid==userid)											//首先判断是否进行了将自己添加为好友的操作
			message="<li>不能添加自己为好友！</li><a href='javascript:window.history.go(-1)'>【返回】</a>";
		else{
			try {
				FriendDao friendDao=new FriendDao();
				boolean have=friendDao.getSingleFriend(params);		//判断要添加的好友是否已经存在好友列表中
				if(!have){													//如果不存在
					friendDao.insert(params);								//向数据表中添加好友信息
					message="<li>添加好友成功！</li><a href='javascript:window.history.go(-1)'>【返回】</a>";				
				}
				else														//如果存在
					message="<li>该用户已在您的好友列表中！</li><a href='javascript:window.history.go(-1)'>【返回】</a>";
			} catch (SQLException e) {
				message="<li>添加好友失败！</li><a href='javascript:window.history.go(-1)'>【返回】</a>";
				e.printStackTrace();
			}			
		}		
		request.setAttribute("message",message);
		
		String forward=this.getServletContext().getInitParameter("messagePage");
		RequestDispatcher rd=request.getRequestDispatcher(forward);
		rd.forward(request,response);		
	}
	protected void doDelete(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
		String message="";
		String forward="";
		HttpSession session=request.getSession();
		int whoid=((UserSingle)session.getAttribute("logoner")).getId();
		int userid=Change.strToInt(request.getParameter("id"));
		Object[] params=new Object[]{whoid,userid};
		
		int i=0;
		try {
			FriendDao friendDao=new FriendDao();
			i=friendDao.delete(params);
		} catch (SQLException e) {
			i=-1;
			e.printStackTrace();
		}
		if(i<=0){
			message="<li>删除好友失败！</li><a href='javascript:window.history.go(-1)'>【返回】</a>";
			forward=getServletContext().getInitParameter("messagePage");
		}
		else{
			message="<li>删除好友成功！</li>";
			forward="/my/admin/friend?action=adminList";
		}
		request.setAttribute("message",message);
		RequestDispatcher rd=request.getRequestDispatcher(forward);
		rd.forward(request,response);
	}
	protected void doOther(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
		
	}
}
