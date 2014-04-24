package com.mr.webiter;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.interceptor.ServletRequestAware;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.mr.dao.ObjectDao;
import com.mr.model.Info;
import com.mr.model.UserInfo;

public class InfoAction extends ActionSupport
		implements
			ModelDriven<Info>,
			ServletRequestAware {
	protected HttpServletRequest request;
	private Info info = new Info();
	private ObjectDao<Info> objectDao = null;

	public Info getModel() {

		return info;
	}

	public void setServletRequest(HttpServletRequest request) {
		this.request = request;
	}

	public String deleteInfo() {
		objectDao = new ObjectDao<Info>();
		String ids[] = request.getParameterValues("id");
		String result="操作失败！";
		if (null != ids) {
			for (String id : ids) {
				String hql_info = "from Info where id = " + new Integer(id);
				info = objectDao.queryFrom(hql_info);
				objectDao.deleteT(info);
			}
			result="操作成功！";
		}
		request.setAttribute("result", result);
		request.setAttribute("sign", "17");
		request.setAttribute("sign1", request.getParameter("sign"));
		return "f_operInfo";
	}

	public String queryInfo() {
		Integer sign = Integer.valueOf(request.getParameter("sign"));
		String account = (String) request.getSession().getAttribute("account");
		String hql_info = "from Info where info_sign = " + sign
				+ " and info_account='" + account + "'";
		objectDao = new ObjectDao<Info>();
		List<Info> list = null;

		int showNumber = 15;
		Integer count = 0;
		if (null != request.getParameter("count")) {
			count = Integer.valueOf(request.getParameter("count"));
		}
		list = objectDao.queryList(hql_info);

		int maxPage = list.size();
		if (maxPage % showNumber == 0) {
			maxPage = maxPage / showNumber;
		} else {
			maxPage = maxPage / showNumber + 1;
		}
		if (0 == count) {
			list = objectDao.queryList(hql_info, showNumber, count);
		} else {
			count--;
			list = objectDao
					.queryList(hql_info, showNumber, count * showNumber);
		}
		String result = "留言查询";
		if (sign == 1) {
			result = "小纸条查询";
		}

		request.setAttribute("result", result);
		request.setAttribute("count", count);
		request.setAttribute("list", list);
		request.setAttribute("maxPage", maxPage);
		request.setAttribute("sign", sign);
		return "queryInfo";
	}

	// 前台添加留言
	public String f_addInfo() {
		objectDao = new ObjectDao<Info>();
		String result = "操作失败！";
		if (!info.getInfo_account().equals(info.getInfo_fromAccount())) {
			objectDao.saveT(info);
			result = "操作成功！";
		}
		request.setAttribute("result", result);
		if (null == request.getParameter("sign")) {
			request.setAttribute("sign", "15");
		} else {
			request.setAttribute("sign", "16");
		}

		return "f_operInfo";
	}
	// 前台查看留言
	public String f_queryInfo() {
		objectDao = new ObjectDao<Info>();
		UserInfo userInfo = (UserInfo) request.getSession().getAttribute(
				"userInfo");
		objectDao = new ObjectDao<Info>();
		String hql_info = "from Info where info_sign=0 and info_account = '"
				+ userInfo.getAccount() + "'";
		List<Info> list = null;

		Integer showNumber = 15;
		Integer count = 0;
		if (null != request.getParameter("count")) {
			count = Integer.valueOf(request.getParameter("count"));
		}
		list = objectDao.queryList(hql_info);
		Integer maxPage = new Integer(list.size());
		if (maxPage % showNumber == 0) {
			maxPage = maxPage / showNumber;
		} else {
			maxPage = maxPage / showNumber + 1;
		}
		if (0 == count) {
			list = objectDao.queryList(hql_info, showNumber, count);
		} else {
			count--;
			list = objectDao
					.queryList(hql_info, showNumber, count * showNumber);
		}

		request.setAttribute("count", count);
		request.setAttribute("list", list);
		request.setAttribute("maxPage", maxPage);

		return "f_queryInfo";
	}

}
