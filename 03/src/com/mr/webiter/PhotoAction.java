package com.mr.webiter;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.ServletRequestAware;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.mr.dao.ObjectDao;
import com.mr.model.PhotoInfo;
import com.mr.model.UserInfo;

public class PhotoAction extends ActionSupport
		implements
			ModelDriven<PhotoInfo>,
			ServletRequestAware {
	protected HttpServletRequest request;
	private PhotoInfo photoInfo = new PhotoInfo();
	private ObjectDao<PhotoInfo> objectDao = null;

	public PhotoInfo getModel() {
		// TODO 自动生成方法存根
		return photoInfo;
	}

	public void setServletRequest(HttpServletRequest request) {
		this.request = request;
	}

	private static void copy(File src, File dst) {
		try {
			InputStream in = null;
			OutputStream out = null;
			try {
				in = new BufferedInputStream(new FileInputStream(src));
				out = new BufferedOutputStream(new FileOutputStream(dst));
				byte[] buffer = new byte[1024 * 10];
				while (in.read(buffer) > 0) {
					out.write(buffer);
				}
			} finally {
				if (null != in) {
					in.close();
				}
				if (null != out) {
					out.close();
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public String photo_add() throws Exception {
		String address = System.currentTimeMillis()
				+ photoInfo.getUploadFileName().substring(
						photoInfo.getUploadFileName().lastIndexOf("."));
		File imageFile = new File(ServletActionContext.getServletContext()
				.getRealPath("/photo")
				+ "/" + address);
		photoInfo.setPhotoAddress("photo/" + address);
		objectDao = new ObjectDao<PhotoInfo>();
		String result = "上传失败！";
		if (objectDao.saveT(photoInfo)) {
			copy(photoInfo.getUpload(), imageFile);
			result = "上传成功！";
		}
		request.setAttribute("result", result);

		return SUCCESS;
	}

	public String photo_query() {
		String account = (String) request.getSession().getAttribute("account");
		String hql = "from PhotoInfo where author='" + account + "'";
		objectDao = new ObjectDao<PhotoInfo>();
		List<PhotoInfo> list = objectDao.queryList(hql);
		request.setAttribute("list", list);
		return SUCCESS;
	}

	public String photo_delete() {
		Integer id = Integer.valueOf(request.getParameter("id"));
		String hql = "from PhotoInfo where id=" + id + "";
		objectDao = new ObjectDao<PhotoInfo>();
		photoInfo = objectDao.queryFrom(hql);
		if (objectDao.deleteT(photoInfo)) {
			String path = request
					.getRealPath("/" + photoInfo.getPhotoAddress());
			File file = new File(path);
			if (file.exists()) {
				file.delete();
			}
		}
		if (null == request.getParameter("admin")) {
			request.setAttribute("sign", "19");
		} else {
			request.setAttribute("sign", "20");
		}
		return "operPhoto";
	}

	public String fphoto_query() {
		UserInfo userInfo = (UserInfo) request.getSession().getAttribute(
				"userInfo");
		String hql = "from PhotoInfo where author='" + userInfo.getAccount()
				+ "'";
		if (null != request.getParameter("photoType")) {
			String photoType = request.getParameter("photoType");
			try {
				photoType = new String(photoType.getBytes("ISO8859_1"),
						"gb2312");
			} catch (Exception e) {
				e.printStackTrace();
			}
			hql = "from PhotoInfo where author='" + userInfo.getAccount()
					+ "' and photoType='" + photoType + "'";
			request.setAttribute("info", photoType);
		}
		objectDao = new ObjectDao<PhotoInfo>();
		List list = objectDao.queryList(hql);
		request.setAttribute("list", list);
		return "fphoto_query";
	}

	public String admin_photoQuery() {
		ObjectDao<UserInfo> objectDao1 = new ObjectDao<UserInfo>();
		String hql = "from UserInfo";

		List userInfoList = objectDao1.queryList(hql);
		request.setAttribute("userInfoList", userInfoList);

		objectDao = new ObjectDao<PhotoInfo>();
		hql = "from PhotoInfo";
		if (null != request.getParameter("photoType")) {
			String photoType = request.getParameter("photoType");
			try {
				photoType = new String(photoType.getBytes("ISO8859_1"),
						"gb2312");
			} catch (Exception e) {
				e.printStackTrace();
			}
			hql = "from PhotoInfo where photoType='" + photoType + "'";
			request.setAttribute("info", photoType);
		}
		request.setAttribute("list", objectDao.queryList(hql));
		return "admin_photoQuery";
	}

}
