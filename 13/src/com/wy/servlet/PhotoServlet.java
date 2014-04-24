package com.wy.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jspsmart.upload.File;
import com.jspsmart.upload.Files;
import com.wy.dao.OperationData;
import com.wy.form.Photo;
import com.wy.form.UserInfo;

public class PhotoServlet extends HttpServlet {
	private String info = "";

	private OperationData data = null;

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		info = request.getParameter("info");
		// 根据页面中info对象的不同值，将执行不同的操作
		if (info.equals("userQueryPhoto")) {
			this.user_queryPhoto(request, response);
		}
		if (info.equals("userUploadPhoto")) {
			this.user_uploadPhoto(request, response);
		}
		if (info.equals("queryOnePhoto")) {

			this.queryOnePhoto(request, response);
		}
		if (info.equals("queryPhotoList")) {

			this.user_queryPhotoList(request, response);
		}
		if (info.equals("queryOnePhoto")) {

			this.queryOnePhoto(request, response);
		}
		if (info.equals("queryPhotoSlide")) {

			this.queryPhotoSlide(request, response);
		}
		if (info.equals("userDeletePhoto")) {

			this.user_deletePhoto(request, response);
		}
		if (info.equals("userprintPhoto")) {

			this.user_printPhoto(request, response);
		}
		if (info.equals("forward_index")) {

			this.forward_index(request, response);
		}

	}

	// 转向首页操作
	public void forward_index(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		List list = new OperationData().queryPhotoList();
		request.setAttribute("list", list);
		request.getRequestDispatcher("photoIndex.jsp").forward(request,
				response);
	}

	// 设置水印的图片
	public void user_printPhoto(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		data = new OperationData();
		Integer id = Integer.valueOf(request.getParameter("id"));
		String condition = "id = '" + id + "'";
		List list = data.photo_queryList(condition);
		Photo photo1 = (Photo) list.get(0);
		String filePath = request.getRealPath(photo1.getPhotoAddress()); // 设置图片的源文件
		String print = "savePrint/" + System.currentTimeMillis() + ".JPG";
		String printPath = request.getRealPath(print); // 设置水印图片的位置
		/** ******************************************************************************* */
		if (!photo1.getPrintAddress().equals("0")) {
			String path = request.getRealPath(photo1.getPrintAddress());
			java.io.File file1 = new java.io.File(path);
			if (file1.exists()) {
				file1.delete();
			}
		}
		/** ******************************************************************************* */
		String printInforamtion = com.wy.tools.Encrypt.toChinese(request
				.getParameter("information"));
		String information = "添加水印效果失败！";
		if (com.wy.tools.ImageUtils.createMark(filePath, printPath,
				printInforamtion)) {
			Photo photo2 = new Photo();
			photo2.setId(photo1.getId());
			photo2.setPrintAddress(print);
			if (data.updatePhoto(photo2)) {
				information = "添加水印效果成功！";
			}
		}

		request.setAttribute("information", information);
		List list1 = data.photo_queryList(condition);
		Photo photo3 = (Photo) list1.get(0);
		request.setAttribute("photo", photo3);
		request.getRequestDispatcher("photoShow.jsp")
				.forward(request, response);
	}

	// 删除图片
	public void user_deletePhoto(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=GBK");
		PrintWriter out = response.getWriter();
		data = new OperationData();
		Integer id = Integer.valueOf(request.getParameter("id")); // 从页面中获取要删除相片的id号
		String condition = "id=" + id; // 设置以id为条件，设置查询内容
		List list = data.photo_queryList(condition); // 根据id值进行查询相片的一组信息
		String address = null; // 设置存放服务器端地址对象
		String print = null;
		String type = null; // 设置相片所在相册对象
		if (list.size() == 1) { // 判断查询的集合内容是否就存在一组数据
			Photo photo = (Photo) list.get(0);
			address = photo.getPhotoAddress(); // 获取数据库中相片存放服务器端的地址
			print = photo.getPrintAddress();
			type = photo.getPhotoType(); // 获取相片所在相册的类型
		}
		String path = request.getRealPath("/" + address); // 获取文件的实际地址
		data.photo_delete(id); // 删除相片所对应的SQL语句
		// 下面的操作是根据文件的所在位置进行删除操作
		java.io.File file1 = new java.io.File(path);
		if (file1.exists()) {
			file1.delete();
		}
		String printPath = request.getRealPath("/" + print);
		java.io.File file2 = new java.io.File(printPath);
		if (file2.exists()) {
			file2.delete();
		}
		// 将文件的类型保存在request范围内容
		request.setAttribute("type", type);
		request.getRequestDispatcher("dealwith.jsp").forward(request, response);
	}

	// 实现用户上传自己的图片
	public void user_uploadPhoto(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		data = new OperationData();
		com.jspsmart.upload.SmartUpload su = new com.jspsmart.upload.SmartUpload();
		String information = "您输入的数据有误，添加相片失败！";
		try {
			su.initialize(this.getServletConfig(), request, response); // 设置长传操作的初始化
			su.setMaxFileSize(2 * 1024 * 1024); // 设置上传文件的大小
			su.upload();
			Files files = su.getFiles(); // 获取上传的文件操作

			for (int i = 0; i < files.getCount(); i++) {
				File singleFile = files.getFile(i); // 获取上传文件的单个文件

				String fileType = singleFile.getFileExt(); // 获取上传文件的扩展名
				String[] type = { "JPG", "jpg", "gif", "bmp", "BMP" }; // 设置上传文件的扩展名
				int place = java.util.Arrays.binarySearch(type, fileType); // 判断上传文件的类型是否正确

				String code = su.getRequest().getParameter("code"); // 获取表单中验证码内容
				String codeSession = (String) request.getSession()
						.getAttribute("rand"); // 获取客户端session中验证码的值
				if (code.equals(codeSession)) { // 判断验证码是否正确

					if (place != -1) { // 判断文件扩展名是否正确
						if (!singleFile.isMissing()) { // 判断该文件是否被选择
							String photoName = su.getRequest().getParameter(
									"photoName")
									+ i; // 获取相片的名称
							String photoType = su.getRequest().getParameter(
									"photoType"); // 获取相册名称
							String photoTime = su.getRequest().getParameter(
									"photoTime"); // 获取相册上传时间
							String username = su.getRequest().getParameter(
									"username"); // 获取上传用户名
							String photoSize = String.valueOf(singleFile
									.getSize()); // 获取上传文件的大小
							String filedir = "savefile/"
									+ System.currentTimeMillis() + "."
									+ singleFile.getFileExt(); // 以系统时间作为上传文件名称，设置上传文件的完整路径

							String smalldir = "saveSmall/"
									+ System.currentTimeMillis() + "."
									+ singleFile.getFileExt();

							Photo photo = new Photo();
							/** ********将photo对象中的属性进行一一赋值*** */
							photo.setPhotoName(photoName);
							photo.setPhotoType(photoType);
							photo.setPhotoSize(photoSize);
							photo.setPhotoTime(photoTime);
							photo.setUsername(username);
							photo.setPhotoAddress(filedir);
							photo.setSmallPhoto(smalldir);
							/** ************************************ */
							if (data.photo_save(photo)) { // 实现上传操作的SQL语句
								singleFile.saveAs(filedir, File.SAVEAS_VIRTUAL); // 执行上传操作
								com.wy.tools.ImageUtils.createSmallPhoto(
										request.getRealPath("/" + filedir),
										request.getRealPath("/" + smalldir));
								information = "您添加相片成功!";

							}

						}

					}

				}
			}

		} catch (Exception e) {
			System.out.println(e);
		}

		request.setAttribute("information", information);
		request.getRequestDispatcher("user_upLoadPhoto.jsp").forward(request,
				response);

	}

	// 当用户成功登录后，实现登录用户查询相册的功能
	public void user_queryPhoto(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		data = new OperationData();
		UserInfo userInfo = (UserInfo) request.getSession().getAttribute(
				"userInfo"); // 获取客户端存放session对象中的数据
		String username = userInfo.getUsername(); // 获取用户名
		String[] type = data.queryPhotoType(username); // 根据用户名查询该用户上传相册的名称
		request.setAttribute("type", type); // 将相册类型存放在request范围内容
		String condition = "username = '" + username + "'";
		List list = data.photo_queryList(condition); // 根据用户名，查询相册内容
		request.setAttribute("list", list); // 将查询的结果保存在request请求范围内
		request.getRequestDispatcher("user_queryPhoto.jsp").forward(request,
				response);
	}

	// 当用户登录后，对每个相册的中的相片进行查询
	public void user_queryPhotoList(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		data = new OperationData();
		String type = com.wy.tools.Encrypt.toChinese(request
				.getParameter("type")); // 获取页面中的相册名称
		String condition = "photoType = '" + type + "'";
		if (null != request.getSession().getAttribute("userInfo")) {
			UserInfo userInfo = (UserInfo) request.getSession().getAttribute(
					"userInfo"); // 获取客户端session中的对象
			String username = userInfo.getUsername(); // 根据客户端session中的对象，获取用户名名称
			condition = "username ='" + username + "' and photoType = '" + type
					+ "'"; // 设置查询条件，分别是以用户名和相册类型进行查询
		}
		List list = data.photo_queryList(condition); // 执行查询操作
		if (list.size() == 0) {
			request.setCharacterEncoding("gb2312");
			PrintWriter out = response.getWriter();
			out.print("<script language=javascript>history.go(-1);</script>");
		} else {
			request.setAttribute("list", list); // 将查询的结果保存在request范围内
			request.setAttribute("type", type); // 将相册名称保存在request范围内
			request.getRequestDispatcher("user_queryPhotoList.jsp").forward(
					request, response);
		}
	}

	// 对相片的详细查询
	public void queryOnePhoto(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		data = new OperationData();
		Integer id = Integer.valueOf(request.getParameter("id")); // 获取页面中相册的ID号
		String condition = "id = '" + id + "'"; // 设置查询条件：以id号为查询条件
		List list = data.photo_queryList(condition); // 执行查询的方法
		Photo photo = null;
		if (list.size() == 1) { // 由于id号的值在数据库中是唯一的，因此只存在一组数据
			photo = (Photo) list.get(0);
		}
		request.setAttribute("photo", photo); // 将查询的结果保存在request范围内
		try {
			request.getRequestDispatcher("photoShow.jsp").forward(request,
					response);
			return;
		} catch (Exception e) {

		}

	}

	// 幻灯片浏览
	public void queryPhotoSlide(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		data = new OperationData();
		UserInfo userInfo = (UserInfo) request.getSession().getAttribute(
				"userInfo"); // 获取客户端session中的指定对象
		String username = userInfo.getUsername(); // 获取用户名名称
		String type = com.wy.tools.Encrypt.toChinese(request
				.getParameter("type")); // 获取网站类型名称
		String condition = "username ='" + username + "' and photoType = '"
				+ type + "'"; // 设置查询的条件：以用户名与相册名称为条件
		List list = data.photo_queryList(condition); // 执行查询操作
		String address[] = new String[list.size()]; // 设置相片存在位置的数组内容
		for (int i = 0; i < list.size(); i++) {
			Photo photo = (Photo) list.get(i);
			address[i] = photo.getPhotoAddress(); // 将查询的结果中，相片存放位置进行一一赋值
		}
		request.setAttribute("address", address); // 将相片地址数组存放在request范围内容
		request.getRequestDispatcher("photoShowSlide.jsp").forward(request,
				response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		this.doGet(request, response);
	}

}
