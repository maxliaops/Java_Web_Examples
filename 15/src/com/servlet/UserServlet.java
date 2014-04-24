package com.servlet;

import java.io.IOException;
import java.sql.SQLException;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.PhotoDao;
import com.dao.UserDao;
import com.jspsmart.upload.File;
import com.jspsmart.upload.SmartUpload;
import com.jspsmart.upload.SmartUploadException;
import com.toolsBean.Change;
import com.valueBean.UserSingle;

public class UserServlet extends HttpServlet {
	private String userIco="myNull.jpg";
	protected void doGet(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
		doPost(request,response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
		String action=request.getParameter("action");
		if("upIco".equals(action))
			doUpLoadIco(request,response);
		else if("userReg".equals(action))
			doUserReg(request,response);
		else
			doOther(request,response);
	}
	
	protected void doUserReg(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
		String forward="";
		String message="";
		
		UserSingle single=(UserSingle)request.getAttribute("regUser");
		message=validateReg(single);
		
		if(!message.equals(""))											//表单验证失败
			forward=getInitParameter("input");
		else{															//表单验证成功
			try {
				UserDao userDao=new UserDao();

				String ctTime=Change.dateTimeChange(new Date());
				single.setUserCTTime(ctTime);
				single.setUserIco(userIco);
				
				userDao.insert(single);
				forward="/goIndex";
			} catch (SQLException e) {				
				e.printStackTrace();
				message="<li>注册博客失败！</li>";
				forward=getInitParameter("input");
			}
		}
		userIco+="1";
		request.setAttribute("message",message);
		RequestDispatcher rd=request.getRequestDispatcher(forward);
		rd.forward(request,response);
	}
	public void doUpLoadIco(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException {
		String message="";
		try {
			SmartUpload myup=new SmartUpload();
			myup.initialize(this, request, response);
			
			myup.setAllowedFilesList("jpg,gif");						//设置允许上传的文件类型
			myup.upload();
			File upfile=myup.getFiles().getFile(0);							//获取上传的文件。因为只上传了一个文件，所以只有一个元素
			if(!upfile.isMissing()){										//如果用户选择了要上传的图片
				message=validateUpLoad(upfile);									//验证上传的文件的大小
				if(message.equals("")){											//通过验证
					Date now=new Date();
					String src="userIco_"+Change.getSerial(now)+"."+upfile.getFileExt();
					userIco=src;
					upfile.saveAs("images/ico/"+src,File.SAVEAS_VIRTUAL);		//保存文件到磁盘中
					message="<li>头像上传成功！</li>";
				}					
			}
			else
				message="<li>请选择图片！</li>";
		}catch(SecurityException e){
			e.printStackTrace();
			message="<li>上传的图片只允许为 jpg、gif 格式！</li>";
		} catch (Exception e1) {
			e1.printStackTrace();
			message="<li>头像上传失败！您可以不进行上传，而使用默认头像！</li>";
			e1.printStackTrace();
		}
		request.setAttribute("message",message);
		RequestDispatcher rd=request.getRequestDispatcher(getInitParameter("input"));
		rd.forward(request,response);		
	}
	private String validateReg(UserSingle single){
		String message="";
		String userName=single.getUserName();
		String userPswd=single.getUserPswd();
		String aginPswd=single.getAginPswd();
		String blogName=single.getUserBlogName();
		String userMotto=single.getUserMotto();		
		String userOicq=single.getUserOicq();
		String userEmail=single.getUserEmail();
		
		boolean mark=true;
		if(userName==null||userName.equals("")){
			message="<li>请输入 <b>姓名</b>！</li>";
			mark=false;
		}
		if(userPswd==null||userPswd.equals("")){
			message+="<li>请输入 <b>密码</b>！</li>";
			mark=false;
		}
		if(aginPswd==null||aginPswd.equals("")){
			message+="<li>请输入 <b>确认密码</b>！</li>";
			mark=false;
		}
		if(blogName==null||blogName.equals("")){
			message+="<li>请输入 <b>博客名称</b>！</li>";
			mark=false;
		}
		if(userMotto==null||userMotto.equals("")){
			message+="<li>请输入 <b>个性签名</b>！</li>";
			mark=false;
		}
		
		if(mark){													//继续判断两次输入的密码是否一致
			if(!userPswd.equals(aginPswd)){
				message="<li>两次输入的密码不一致！</li>";
				mark=false;
			}
		}
		if(mark){													//继续判断，若输入了OICQ和E-mail，则判断输入的是否为数字格式
			if(userOicq!=null&&!userOicq.equals("")){
				try{
					Long.parseLong(userOicq);
				}catch(NumberFormatException e){
					message="<li>输入的 <b>OICQ</b> 不是数字！</li>";
					e.printStackTrace();
				}
			}
			if(userEmail!=null&&!userEmail.equals("")){
				String emailRegex="\\w+([-+.]\\w+)*@\\w+([-.]\\w+)*\\.\\w+([-.]\\w+)*";
				if(!userEmail.matches(emailRegex))
					message+="<li>输入的 <b>E-mail</b> 地址不是正确！</li>";
			}
		}
		return message;
	}
	private String validateUpLoad(File upfile){
		String message="";
		long maxLen=1*1024*1024;						//设置允许上传的文件的最大长度为２MB
		int len=upfile.getSize();
		if(len==0)
			message="<li>不允许上传大小为0的空文件！</li>";
		else if(len>maxLen)
			message="<li>上传的图片最大应为1MB！</li>";
		return message;
	}
	protected void doOther(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
		
	}
}
