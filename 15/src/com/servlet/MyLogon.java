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

public class MyLogon extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
		doPost(request,response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
		String message="";
		HttpSession session=request.getSession();
		String goWhere=request.getParameter("goWhere");
		UserSingle callMaster=(UserSingle)session.getAttribute("callBlogMaster");

		Object logoner=session.getAttribute("logoner");		
		if(logoner!=null&&(logoner instanceof UserSingle)){								//用户已经登录
			String forward="";			
			if("adminTemp".equals(goWhere)){											//如果触发的是＂管理博客＂请求
				if(((UserSingle)logoner).getId()==callMaster.getId()){					//如果当前登录的用户就是被访问博客的博主
					forward=this.getServletContext().getInitParameter("adminTemp");
				}
				else{																	//如果当前登录的用户不是被访问博客的博主
					message="<li>您没有权限管理该博客！</li><a href='javascript:window.history.go(-1)'>【返回】</a>";
					request.setAttribute("message",message);			
					forward=this.getServletContext().getInitParameter("messagePage");	
				}
			}
			else{																		//如果触发的是＂我的博客＂请求			
				forward="/my/goBlog?master="+((UserSingle)logoner).getId();
			}			
			RequestDispatcher rd=request.getRequestDispatcher(forward);
			rd.forward(request,response);	
		}
		else{																			//用户没有已经登录
	
			String forward="";
			String name=request.getParameter("userName");
			String pswd=request.getParameter("userPswd");

			message=validateLogon(name,pswd);											//进行表单验证			
			if(message.equals("")){														//表单验证成功
				try {
					UserDao userDao=new UserDao();
					logoner=userDao.getLogoner(new Object[]{name,pswd});
				} catch (SQLException e) {
					e.printStackTrace();
				}
				if(logoner==null){														//登录失败
					message="<li>输入的　<b>用户名</b 或　<b>密码</b>　不正确！";
					request.setAttribute("message",message);
					forward=getInitParameter("myLogonPage");
				}
				else{																	//登录成功
					if("adminTemp".equals(goWhere)){											//如果触发的是＂管理博客＂请求
						if(((UserSingle)logoner).getId()==callMaster.getId()){					//如果当前登录的用户就是被访问博客的博主
							forward=this.getServletContext().getInitParameter("adminTemp");
							session.setAttribute("logoner",logoner);
						}
						else{																	//如果当前登录的用户不是被访问博客的博主
							message="<li>您没有权限登录他人博客！</li><a href='javascript:window.history.go(-1)'>【返回】</a>";
							request.setAttribute("message",message);			
							forward=this.getServletContext().getInitParameter("messagePage");	
						}
					}
					else{																		//如果触发的是＂我的博客＂请求			
						forward="/my/goBlog?master="+((UserSingle)logoner).getId();
						session.setAttribute("logoner",logoner);
					}
				}
			}
			else{																				//表单验证失败
				request.setAttribute("message",message);
				forward=getInitParameter("myLogonPage");
			}
			
			RequestDispatcher rd=request.getRequestDispatcher(forward);
			rd.forward(request,response);
		}		
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
