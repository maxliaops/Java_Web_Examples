package com.servlet;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.ArticleDao;
import com.dao.ElectDao;
import com.dao.FriendDao;
import com.dao.LinkDao;
import com.dao.MediaDao;
import com.dao.PhotoDao;
import com.dao.UserDao;
import com.dao.WordDao;
import com.toolsBean.Change;
import com.valueBean.UserSingle;

public class BlogServlet extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
		doPost(request,response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
		request.setAttribute("mainPage",getInitParameter("defaultPage"));
		String forward="";
		
		try{
			UserDao userDao=new UserDao();
			int userid=Change.strToInt(request.getParameter("master"));
			
			userDao.setHitNum(userid);								//将博客的点击率加１
			UserSingle master=userDao.getMasterSingle(userid);		//获取博主信息
			
			if(master!=null){										//如果访问的用户存在
				HttpSession session=request.getSession();
				session.setAttribute("callBlogMaster",master);
				
				/* 获取显示在个人主页中博主最新上传的前4个视频 */			
				List medialist=new ArrayList();
				MediaDao mediaDao=new MediaDao();
				medialist=mediaDao.getDefaultMedia(userid);
				request.setAttribute("medialist",medialist);
				
				/* 获取显示在个人主页中博主最新上传的前n篇文章 */
				List articlelist=new ArrayList();
				ArticleDao articleDao=new ArticleDao();
				articlelist=articleDao.getDefaultArticle(userid);
				request.setAttribute("articlelist",articlelist);
				
				/* 获取显示在个人主页中博主最新上传的前4张图片 */
				List photolist=new ArrayList();
				PhotoDao photoDao=new PhotoDao();
				photolist=photoDao.getDefaultPhoto(userid);
				request.setAttribute("photolist",photolist);
				
				/* 获取显示在个人主页中侧栏位置上的博主推荐文章 */
				List electlist=new ArrayList();
				ElectDao electDao=new ElectDao();
				electlist=electDao.getDefaultElect(userid);
				session.setAttribute("electlist",electlist);
				
				/* 获取显示在个人主页中侧栏位置上的前５位我的好友 */
				List friendlist=new ArrayList();
				FriendDao friendDao=new FriendDao();
				friendlist=friendDao.getDefaultFriend(userid);
				session.setAttribute("friendlist",friendlist);
				
				/* 获取显示在个人主页中侧栏位置上的友情链接 */
				List linklist=new ArrayList();
				LinkDao linkDao=new LinkDao();
				linklist=linkDao.getDefaultLink(userid);
				session.setAttribute("linklist",linklist);

				/* 获取显示在个人主页中侧栏位置上的点击率排行前20名的博客 */				
				List toplist=userDao.getTopList();
				session.setAttribute("toplist",toplist);				
				
				forward=this.getServletContext().getInitParameter("indexTemp");
			}
			else{							//如果访问的用户不存在		
				forward=this.getServletContext().getInitParameter("messagePage");
				String message="<li>对不起，访问的用户不存在！</li>";
				request.setAttribute("message",message);
			}
		}catch(Exception e){
			forward=this.getServletContext().getInitParameter("messagePage");
			System.out.println("'获取显示在首页中信息'失败！");
			e.printStackTrace();
		}
		RequestDispatcher rd=request.getRequestDispatcher(forward);
		rd.forward(request,response);		
	}
}