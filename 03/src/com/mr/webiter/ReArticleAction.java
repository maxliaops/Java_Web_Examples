package com.mr.webiter;

import java.text.SimpleDateFormat;
import java.util.Calendar;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.interceptor.ServletRequestAware;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.mr.dao.ObjectDao;
import com.mr.model.ArticleInfo;
import com.mr.model.ReArticleInfo;

public class ReArticleAction extends ActionSupport
		implements
			ModelDriven<ReArticleInfo>,
			ServletRequestAware {
	protected HttpServletRequest request;
	private ReArticleInfo reArticleInfo = new ReArticleInfo();
	private ObjectDao<ReArticleInfo> reart_objectDao = null;
	private ObjectDao<ArticleInfo> art_objectDao = null;
	private String dateTimeFormat = new SimpleDateFormat("yyyy-mm-dd HH:mm:ss")
			.format(Calendar.getInstance().getTime());
	private String account = null;
	private String hql = null;

	public ReArticleInfo getModel() {
		return this.reArticleInfo;
	}

	public void setServletRequest(HttpServletRequest request) {
		this.request = request;
	}

	
	
	//删除回复信息
	public String reArticle_delete(){
		Integer id=Integer.valueOf(request.getParameter("id"));
		reart_objectDao = new ObjectDao<ReArticleInfo>();
		hql = "from ReArticleInfo where id=" + id + " order by id desc";
		reArticleInfo=reart_objectDao.queryFrom(hql);
		reart_objectDao.deleteT(reArticleInfo);
		request.setAttribute("sign", "12");
		
		request.setAttribute("id", reArticleInfo.getRe_id());
		
		return "operReArticle";
	}
	
	
	
	// 添加回复信息
	public String reArticle_add() {
		account = (String) request.getSession().getAttribute("account");
		String result = "添加回复信息失败！";
		reart_objectDao = new ObjectDao<ReArticleInfo>();
		if (null == account || account.equals("")) {
			result="您还没有登录！";
		} else {
			if (!reArticleInfo.getContent().equals("")) {
				reArticleInfo.setAccount(account);
				reArticleInfo.setRe_time(dateTimeFormat);
				reart_objectDao.saveT(reArticleInfo);
				result = "添加回复信息成功！";
			}
		}
		request.setAttribute("result", result);
		request.setAttribute("sign", "11");
		return "operReArticle";
	}

}
