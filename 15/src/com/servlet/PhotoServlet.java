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

import com.dao.PhotoDao;
import com.jspsmart.upload.File;
import com.jspsmart.upload.SmartUpload;
import com.jspsmart.upload.SmartUploadException;
import com.toolsBean.Change;
import com.valueBean.PhotoSingle;
import com.valueBean.UserSingle;

public class PhotoServlet extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
		doPost(request,response);
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
		String action=request.getParameter("action");
		if("listShow".equals(action))
			doListShow(request,response);
		else if("singleShow".equals(action))
			doSingleShow(request,response);
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
		request.setAttribute("mainPage",getInitParameter("listShowPage"));

		HttpSession session=request.getSession();
		UserSingle callMaster=(UserSingle)session.getAttribute("callBlogMaster");

		int userid=callMaster.getId();
		String showPage=request.getParameter("showPage");
		String goWhich="my/guest/photo?action=listShow";
		
		List photoList=null;
		PhotoDao photoDao=new PhotoDao();		
		try {
			photoList=photoDao.getListPhoto(userid,showPage, goWhich);
		} catch (SQLException e) {
			System.out.println("获取图片列表失败！");
			e.printStackTrace();			
		}
		request.setAttribute("photolist",photoList);
		request.setAttribute("createPage",photoDao.getPage());
		
		String forward=this.getServletContext().getInitParameter("indexTemp");
		RequestDispatcher rd=request.getRequestDispatcher(forward);
		rd.forward(request,response);
	}

	protected void doSingleShow(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
		request.setAttribute("mainPage",getInitParameter("singleShowPage"));
		try {
			int id=Change.strToInt(request.getParameter("id"));
			PhotoDao photoDao=new PhotoDao();
			PhotoSingle single=photoDao.getSinglePhoto(id);		// 获取图片的详细信息			
			request.setAttribute("photosingle",single);
		} catch (Exception e) {
			System.out.println("获取图片详细信息失败！");
			e.printStackTrace();
		}		
		String forward=this.getServletContext().getInitParameter("indexTemp");
		RequestDispatcher rd=request.getRequestDispatcher(forward);
		rd.forward(request,response);
	}
	protected void doAdminList(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
		request.setAttribute("mainPage",getInitParameter("adminListPage"));
		HttpSession session=request.getSession();
		UserSingle logoner=(UserSingle)session.getAttribute("logoner");

		int whoid=logoner.getId();
		String showPage=request.getParameter("showPage");
		String goWhich="my/admin/photo?action=adminList";
		
		List photoList=null;
		PhotoDao photoDao=new PhotoDao();		
		try {
			photoList=photoDao.getListPhoto(whoid,showPage, goWhich);
		} catch (SQLException e) {
			System.out.println("后台－获取图片列表失败！");
			e.printStackTrace();			
		}
		request.setAttribute("photolist",photoList);
		request.setAttribute("createPage",photoDao.getPage());
		
		String forward=this.getServletContext().getInitParameter("adminTemp");
		RequestDispatcher rd=request.getRequestDispatcher(forward);
		rd.forward(request,response);
	}
	protected void doAdminSingle(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
		request.setAttribute("mainPage",getInitParameter("adminSinglePage"));
		try {
			int id=Change.strToInt(request.getParameter("id"));
			PhotoDao photoDao=new PhotoDao();
			PhotoSingle single=photoDao.getSinglePhoto(id);		// 获取图片的详细信息			
			request.setAttribute("photosingle",single);
		} catch (Exception e) {
			System.out.println("后台－获取图片详细信息失败！");
			e.printStackTrace();
		}		
		String forward=this.getServletContext().getInitParameter("adminTemp");
		RequestDispatcher rd=request.getRequestDispatcher(forward);
		rd.forward(request,response);
	}
	protected void doInsert(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
		request.setAttribute("mainPage",getInitParameter("upLoadPage"));
		
		String message="";
		HttpSession session=request.getSession();
		int whoid=((UserSingle)session.getAttribute("logoner")).getId();
		String type=request.getParameter("type");
		
		if("upload".equals(type)){												//单击＂上传图片＂提交按钮触发的请求
			try {
				SmartUpload myup=new SmartUpload();
				myup.initialize(this, request, response);
				myup.setAllowedFilesList("jpg,jpeg,gif");						//设置允许上传的文件类型
				myup.upload();													//上传文件
				File upfile=myup.getFiles().getFile(0);							//获取上传的文件。因为只上传了一个文件，所以只有一个元素
				
				message=validateUpLoad(upfile);									//验证上传的文件的大小
				if(message.equals("")){											//通过验证
					Date now=new Date();										//获取当前时间
					String src=Change.getSerial(now)+"."+upfile.getFileExt();
					String info=myup.getRequest().getParameter("info");
					if(info==null||info.equals(""))
						info="我的图片";
					String time=Change.dateTimeChange(now);
					
					Object[] params={whoid,src,info,time};
					PhotoDao photoDao=new PhotoDao();
					int i=photoDao.upLoad(params);
					if(i<=0)
						message="<li>图片上传失败！</li>";
					else{
						upfile.saveAs("images/photo/"+src,File.SAVEAS_VIRTUAL);					//保存文件到磁盘中
						message="<li>文件上传成功！</li>";
					}					
				}				
			}catch(SecurityException e1){										//捕获违反了允许上传的文件类型后抛出的异常
				message="<li>只允许上传 <b>jpg、jpeg、gif</b> 格式图片！</li>";
				e1.printStackTrace();				
			}catch (SmartUploadException e2) {
				message="<li>图片上传失败！</li>";		
				e2.printStackTrace();
			}catch(Exception e3){
				message="<li>图片上传失败！</li>";	
				e3.printStackTrace();
			}			
		}
		else																	//单击＂上传图片＂超链接触发的请求
			message="<li>请选择要上传的图片！</li>";
		
		request.setAttribute("message",message);		
		String forward=getServletContext().getInitParameter("adminTemp");
		RequestDispatcher rd=request.getRequestDispatcher(forward);
		rd.forward(request,response);		
	}
	protected void doDelete(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
		String message="";
		String forward="";
		int id=Change.strToInt(request.getParameter("id"));

		PhotoDao photoDao=new PhotoDao();
		try{
			PhotoSingle single=new PhotoSingle();
			single=photoDao.getSinglePhoto(id);
			
			String photoName=single.getPhotoSrc();
			String photoPath=getServletContext().getRealPath("\\")+"images\\photo\\"+photoName;
			java.io.File delPhoto=new java.io.File(photoPath);
			boolean delete=delPhoto.delete();
			if(delete){															//从磁盘中删除图片成功
				int i=photoDao.delete(id);
				if(i<=0){
					message="<li>图片已经从磁盘中删除，但在从数据表中删除图片信息时失败！</li><br><a href='javascript:window.history.go(-1)'>【返回】</a>";
					forward=getServletContext().getInitParameter("messagePage");
				}
				else{
					message="<li>删除成功！</li>";
					forward="/my/admin/photo?action=adminList";
				}				
			}
			else{
				message="<li>无法从磁盘中删除图片！</li><a href='javascript:window.history.go(-1)'>【返回】</a>";
				forward=getServletContext().getInitParameter("messagePage");
			}
		}catch(Exception e){
			e.printStackTrace();
			forward=getServletContext().getInitParameter("messagePage");
		}
		
		request.setAttribute("message",message);
		RequestDispatcher rd=request.getRequestDispatcher(forward);
		rd.forward(request,response);	
	}
	protected void doOther(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
		
	}
	private String validateUpLoad(File upfile){
		String message="";
		long maxLen=2*1024*1024;						//设置允许上传的文件的最大长度为２MB
		if(upfile.isMissing()){							//没有选择文件
			message+="<li>请选择要上传的图片！</li>";
		}
		else{
			int len=upfile.getSize();
			if(len==0)
				message="<li>不允许上传大小为0的空文件！</li>";
			else if(len>maxLen)
				message="<li>上传的图片最大应为２MB！</li>";
		}
		return message;
	}
}
