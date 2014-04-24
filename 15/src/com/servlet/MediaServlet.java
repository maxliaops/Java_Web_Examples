package com.servlet;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.MediaDao;
import com.dao.MediaRevDao;
import com.jspsmart.upload.File;
import com.jspsmart.upload.SmartUpload;
import com.jspsmart.upload.SmartUploadException;
import com.toolsBean.Change;
import com.valueBean.MediaSingle;
import com.valueBean.UserSingle;

public class MediaServlet extends HttpServlet {
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
		String goWhich="my/guest/media?action=listShow";
		
		List mediaList=null;
		MediaDao mediaDao=new MediaDao();		
		try {
			mediaList=mediaDao.getListMedia(userid,showPage, goWhich);
		} catch (SQLException e) {
			System.out.println("获取视频列表失败！");
			e.printStackTrace();			
		}
		request.setAttribute("medialist",mediaList);
		request.setAttribute("createPage",mediaDao.getPage());
		
		String forward=this.getServletContext().getInitParameter("indexTemp");
		RequestDispatcher rd=request.getRequestDispatcher(forward);
		rd.forward(request,response);
	}
	protected void doSingleShow(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
		request.setAttribute("mainPage",getInitParameter("playPage"));
		try {
			MediaDao mediaDao=new MediaDao();
			int id=Change.strToInt(request.getParameter("id"));

			mediaDao.setLookCount(id);									// 将视频的观看次数加１
			MediaSingle single=mediaDao.getSingleMedia(id);				// 获取视频的详细信息			
			
			/* 获取该视频的最新的前n条评论 */
			MediaRevDao mediaRDao=new MediaRevDao();
			List mediaRlist=mediaRDao.getNewReviewList(id);
			
			/* 保存要播放的视频、视频的评论 */
			request.setAttribute("mediasingle",single);
			request.setAttribute("mediaRlist",mediaRlist);
		} catch (Exception e) {
			System.out.println("获取视频详细信息失败！");
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
		String goWhich="my/admin/media?action=adminList";
		
		List mediaList=null;
		MediaDao mediaoDao=new MediaDao();		
		try {
			mediaList=mediaoDao.getListMedia(whoid,showPage, goWhich);
		} catch (SQLException e) {
			System.out.println("后台－获取影音列表失败！");
			e.printStackTrace();			
		}
		request.setAttribute("medialist",mediaList);
		request.setAttribute("createPage",mediaoDao.getPage());
		
		String forward=this.getServletContext().getInitParameter("adminTemp");
		RequestDispatcher rd=request.getRequestDispatcher(forward);
		rd.forward(request,response);
	}
	protected void doAdminSingle(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
		request.setAttribute("mainPage",getInitParameter("adminPlayPage"));
		try {
			int id=Change.strToInt(request.getParameter("id"));
			MediaDao mediaDao=new MediaDao();
			MediaSingle single=mediaDao.getSingleMedia(id);				// 获取影音的详细信息			
			
			/* 获取该视频的最新的前n条评论 */
			MediaRevDao mediaRDao=new MediaRevDao();
			List mediaRlist=mediaRDao.getNewReviewList(id);
			
			/* 保存要播放的视频、视频的评论 */
			request.setAttribute("mediasingle",single);
			request.setAttribute("mediaRlist",mediaRlist);			
		} catch (Exception e) {
			System.out.println("后台－获取影音详细信息失败！");
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
		
		if("upload".equals(type)){																//如果是单击＂上传视频＂提交按钮触发的请求
			try {				
				SmartUpload myup=new SmartUpload();
				myup.initialize(this, request, response);
				myup.setAllowedFilesList("avi,asf,asx,3gp,mpg,mov,mp4,wmv,flv");				//设置允许上传的文件类型
				myup.upload();																	//上传文件
				
				File upfile=myup.getFiles().getFile(0);											//获取上传的文件。因为只上传了一个文件，所以只有一个元素
				message=validateUpLoad(upfile);

				if(message.equals("")){															//如果通过验证
					Date now=new Date();																//获取当前时间
					String serialName=Change.getSerial(now);											//调用工具Bean根据当前时间获取一个惟一名称
					
					String basePath=getServletContext().getRealPath("\\");								//获取Web应用的实际存放路径
					String upFilePath=basePath+"pages\\admin\\media\\temp\\"+serialName+"."+upfile.getFileExt();			//设置一个保存临时文件的路径：Web应用根目录\pages\admin\media\temp\上传的文件。（如，F:\Tomcat 6.0\webapps\MediaBlog\pages\admin\media\temp\04302008143755.mpg）
					String flvFilePath=basePath+"pages\\media\\videos\\"+serialName+".flv";								//设置转换为flv格式后文件的保存路径
					String cutPicPath=basePath+"images\\media\\"+serialName+".jpg";										//设置从上传的视频中截取的图片的保存路径
					
					upfile.saveAs(upFilePath,File.SAVEAS_PHYSICAL);										//保存文件到磁盘中，作为临时文件
					boolean mark=convertVideo(upFilePath,flvFilePath,cutPicPath);						//转换视频格式
				    
					if(mark){																			//转换视频格式成功，向数据表中添加该视频信息
				    	String src=serialName+".flv";															//获取视频成功转换为flv格式后的文件名
						String time=Change.dateTimeChange(now);	
						String pic=serialName+".jpg";															//获取视频的截图名称
						int count=0;																			//设置视频的访问次数
						String info=myup.getRequest().getParameter("info");										//获取输入的视频描述信息
						String title=myup.getRequest().getParameter("title");									//获取输入的视频标题
						if(title==null||title.equals(""))title="无标题";
						if(info==null||info.equals(""))info="我的视频";
						
						Object[] params={whoid,title,src,pic,info,time,count};
						MediaDao mediaDao=new MediaDao();
						
						int i=mediaDao.upLoad(params);															//调用DAO类向数据表中添加视频信息
						if(i<=0)																				//添加视频信息失败
							message="<li>保存视频信息时失败！</li>";
						else																					//添加视频信息成功
							message="<li>视频上传成功！</li>";
				    }
				    else																				//转换视频格式失败
				    	message="<li>转换视频时失败！</li>";
				}				
			}catch(SecurityException e1){				//捕获违反了允许上传的文件类型后抛出的异常
				message="<li>只允许上传 <b>avi、asf、asx、3gp、mpg、mov、mp4、wmv、flv</b> 格式图片！</li>";
				e1.printStackTrace();				
			}catch (SmartUploadException e2) {
				message="<li>视频上传失败！</li>";		
				e2.printStackTrace();
			}catch(Exception e3){
				message="<li>操作失败！</li>";	
				e3.printStackTrace();
			}catch(OutOfMemoryError e4){
				message="<li>上传失败！您上传的文件太大！</li>";
				e4.printStackTrace();
			}			
		}
		else																					//如果单击＂上传影音＂超链接触发的请求
			message="<li>请选择要上传的视频！</li>";
		
		request.setAttribute("message",message);		
		String forward=getServletContext().getInitParameter("adminTemp");
		RequestDispatcher rd=request.getRequestDispatcher(forward);
		rd.forward(request,response);	
	}
	/**
	 * @功能：验证是否选择了要上传的文件，以及文件大小
	 * @返回：String型值
	 */
	private String validateUpLoad(File upfile){
		String message="";
		long maxLen=30*1024*1024;						//设置允许上传的文件的最大长度为30MB
		if(upfile.isMissing()){							//没有选择文件
			message+="<li>请选择要上传的视频！</li>";
		}
		else{
			int len=upfile.getSize();
			if(len==0)
				message="<li>不允许上传大小为0的空文件！</li>";
			else if(len>maxLen)
				message="<li>上传的视频最大应为30MB！</li>";
		}
		return message;
	}
	/**
	 * @功能：①转换上传的视频为FLV格式；②从上传的视频中截图。
	 * @参数：①upFilePath：	 用于指定要转换格式的文件路径；以及用来指定要截图的视频。<br>
	 * @参数：②flvFilePath：用于指定转换为FLV格式后的文件的保存路径。<br>
	 * @参数：③cutPicPath：	 用于指定截取的图片的保存路径
	 * @返回：boolean型值
	 */
	private boolean convertVideo(String upFilePath,String flvFilePath,String cutPicPath){
		String ffmpegPath=getInitParameter("ffmpegPath");							//获取在web.xml中配置的转换工具（ffmpeg.exe）的存放路径
		
		//创建一个List集合来保存转换视频文件为flv格式的命令
		List<String> convert=new ArrayList<String>();
		convert.add(ffmpegPath);													//添加转换工具路径
		convert.add("-i");															//添加参数＂-i＂，该参数指定要转换的文件
		convert.add(upFilePath);													//添加要转换格式的视频文件的路径
		convert.add("-qscale");
		convert.add("6");
		convert.add("-ab");
		convert.add("64");
		convert.add("-acodec");
		convert.add("mp3");
		convert.add("-ac");
		convert.add("2");
		convert.add("-ar");
		convert.add("22050");
		convert.add("-r");
		convert.add("24"); 
		convert.add("-y");															//添加参数＂-y＂，该参数指定将覆盖已存在的文件
		convert.add(flvFilePath);
		
		//创建一个List集合来保存从视频中截取图片的命令
		List<String> cutpic=new ArrayList<String>();
		cutpic.add(ffmpegPath);
		cutpic.add("-i");
		cutpic.add(upFilePath);														//同上（指定的文件即可以是转换为flv格式之前的文件，也可以是转换的flv文件）
		cutpic.add("-y");
		cutpic.add("-f");
		cutpic.add("image2");
		cutpic.add("-ss");															//添加参数＂-ss＂，该参数指定截取的起始时间
		cutpic.add("9");															//添加起始时间为第9秒
		cutpic.add("-t");															//添加参数＂-t＂，该参数指定持续时间
		cutpic.add("0.001");														//添加持续时间为1毫秒
		cutpic.add("-s");															//添加参数＂-s＂，该参数指定截取的图片大小
		cutpic.add("350*240");														//添加截取的图片大小为350*240
		cutpic.add(cutPicPath);														//添加截取的图片的保存路径
		
		boolean mark=true;
		ProcessBuilder builder = new ProcessBuilder();
	    try {				        
	    	builder.command(convert);
	        builder.start();
	        
	        builder.command(cutpic);
	        builder.start();
	    } catch (Exception e) {
	    	mark=false;
	        e.printStackTrace();
	    }
	    return mark;
	}	
	/**
	 * @功能：删除视频
	 * @步骤：首先根据请求传递的ID值，查询出视频信息，从中获取该视频的文件名；然后从磁盘中删除该视频文件；再从磁盘中删除该视频截图；最后从数据表中删除该视频的信息。
	 */
	protected void doDelete(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
		String message="";
		String forward="";
		int id=Change.strToInt(request.getParameter("id"));
		MediaDao mediaDao=new MediaDao();
		
		try {
			MediaSingle single=new MediaSingle();
			single=mediaDao.getSingleMedia(id);
			
			String flvName=single.getMediaSrc();			
			String picName=flvName.substring(0,flvName.lastIndexOf("."))+".jpg";
			
			System.out.println("flvName:"+flvName);
			System.out.println("picName:"+picName);
			
			boolean delflv=deleteFlv(flvName);									//从磁盘中删除视频文件
			if(delflv){															//如果删除视频文件成功
				boolean delpic=deletePic(picName);									//从磁盘中删除视频截图
				if(delpic){															//如果删除视频截图成功
					int i=mediaDao.delete(id);											//从数据表中删除视频信息
					if(i>0){															//如果删除视频信息成功
						message="<li>视频删除成功！</li>";
						forward="/my/admin/media?action=adminList";
					}
					else{
						message="<li>视频文件以及视频截图已经从磁盘中删除，但在从数据表中删除该视频的信息时失败！</li><br><a href='javascript:window.history.go(-1)'>【返回】</a>";
						forward=getServletContext().getInitParameter("messagePage");
					}
				}
				else{
					message="<li>视频文件以已经从磁盘中删除，但在删除该视频的截图时失败！</li><br><a href='javascript:window.history.go(-1)'>【返回】</a>";
					forward=getServletContext().getInitParameter("messagePage");
				}
			}
			else{																//如果从磁盘中删除视频文件失败
				message="<li>无法从磁盘中删除该视频文件！</li><a href='javascript:window.history.go(-1)'>【返回】</a>";
				forward=getServletContext().getInitParameter("messagePage");
			}			
			
		} catch (SQLException e1) {	
			message="<li>删除视频失败！</li>";
			forward=getServletContext().getInitParameter("messagePage");
			e1.printStackTrace();
		}
		
		request.setAttribute("message",message);
		RequestDispatcher rd=request.getRequestDispatcher(forward);
		rd.forward(request,response);	
	}
	/**
	 * @功能：从磁盘中删除视频文件
	 */
	private boolean deleteFlv(String flvName){
		String path=getServletContext().getRealPath("\\")+"pages\\media\\videos\\"+flvName;
		java.io.File flvFile=new java.io.File(path);
		boolean delflv=flvFile.delete();			
		return delflv;
	}
	/**
	 * @功能：从磁盘中删除视频截图
	 */
	private boolean deletePic(String picName){
		String path=getServletContext().getRealPath("\\")+"images\\media\\"+picName;
		java.io.File picFile=new java.io.File(path);
		boolean picflv=picFile.delete();			
		return picflv;
	}	
	protected void doOther(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
		
	}
}
