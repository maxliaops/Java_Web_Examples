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

import com.dao.ArtReviewDao;
import com.dao.MediaRevDao;
import com.toolsBean.Change;
import com.valueBean.UserSingle;

public class MediaRevServlet extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
		doPost(request,response);
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
		String action=request.getParameter("action");
		if("listShow".equals(action))
			doListShow(request,response);
		else if("adminList".equals(action))
			doAdminList(request,response);
		else if("review".equals(action))
			doReview(request,response);
		else if("delete".equals(action))
			doDelete(request,response);
		else
			doOther(request,response);
	}
	protected void doListShow(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
		int rootId=Change.strToInt(request.getParameter("id"));
		String showPage=request.getParameter("showPage");
		String goWhich="my/guest/mediaRev?action=listShow&id="+rootId;
		
		List mediaRlist=null;
		MediaRevDao mediaRevDao=new MediaRevDao();		
		try {
			mediaRlist=mediaRevDao.getMoreReviewList(rootId, showPage, goWhich);
		} catch (SQLException e) {
			System.out.println("获取视频评论列表失败！");
			e.printStackTrace();			
		}
		request.setAttribute("mediaRlist",mediaRlist);
		request.setAttribute("createPage",mediaRevDao.getPage());
		
		String forward=getInitParameter("mediaRlistPage");
		RequestDispatcher rd=request.getRequestDispatcher(forward);
		rd.forward(request,response);
	}
	protected void doAdminList(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
		int rootId=Change.strToInt(request.getParameter("id"));
		String showPage=request.getParameter("showPage");
		String goWhich="my/admin/mediaRev?action=adminList&id="+rootId;
		
		List mediaRlist=null;
		MediaRevDao mediaRevDao=new MediaRevDao();		
		try {
			mediaRlist=mediaRevDao.getMoreReviewList(rootId, showPage, goWhich);
		} catch (SQLException e) {
			System.out.println("后台－获取视频评论列表失败！");
			e.printStackTrace();			
		}
		request.setAttribute("mediaRlist",mediaRlist);
		request.setAttribute("createPage",mediaRevDao.getPage());
		
		String forward=getInitParameter("adminMediaRListPage");
		RequestDispatcher rd=request.getRequestDispatcher(forward);
		rd.forward(request,response);
	}
	protected void doReview(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
		String forward="";
		String message=validateInsert(request);			//进行表单验证
		if(!"".equals(message)){						//表单验证失败
			forward=this.getServletContext().getInitParameter("messagePage");
		}
		else{											//表单验证成功
			String rootId=request.getParameter("rootId");
			String content=request.getParameter("mediaRContent");
			String time=Change.dateTimeChange(new Date());
			String author="";
			String noname=request.getParameter("noname");
			if("true".equals(noname))					//匿名发表
				author="明日网友";
			else{										//不是匿名发表
				HttpSession session=request.getSession();
				author=((UserSingle)session.getAttribute("logoner")).getUserName();
			}
			
			MediaRevDao mediaRevDao=new MediaRevDao();
			try {
				mediaRevDao.insert(new Object[]{rootId,author,content,time});
				forward="/my/guest/media?action=singleShow&id="+rootId;		
			} catch (SQLException e) {			
				message="<li>发表评论失败！</li>";
				forward=this.getServletContext().getInitParameter("messagePage");
				e.printStackTrace();				
			}			
		}
		request.setAttribute("message",message);
		
		RequestDispatcher rd=request.getRequestDispatcher(forward);
		rd.forward(request,response);
	}	
	protected void doDelete(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
		String message="";
		String forward="";
		int rootId=Change.strToInt(request.getParameter("rootId"));
		int id=Change.strToInt(request.getParameter("id"));
		
		int i=0;
		try {
			MediaRevDao mediaRevDao=new MediaRevDao();
			i=mediaRevDao.delete(id);
		} catch (SQLException e) {
			i=-1;
			e.printStackTrace();
		}
		if(i<=0){
			message="<li>删除评论失败！</li><a href='javascript:window.history.go(-1)'>【返回】</a>";
			forward=getServletContext().getInitParameter("messagePage");
		}
		else{
			message="<li>删除评成功！</li>";
			forward="/my/admin/mediaRev?action=adminList&id="+rootId;
		}
		
		request.setAttribute("message",message);		
		RequestDispatcher rd=request.getRequestDispatcher(forward);
		rd.forward(request,response);
	}
	protected void doOther(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
		
	}
	private String validateInsert(HttpServletRequest request) throws ServletException, IOException{
		String message="";
		String content=request.getParameter("mediaRContent");
		if(content==null||content.equals(""))
			message="<li>请输入<b>评论内容！</b></li><a href='javascript:window.history.go(-1)'>【返回】</a>";
		return message; 
	}
}