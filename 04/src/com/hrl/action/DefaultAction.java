package com.hrl.action;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Map;

import org.apache.struts2.ServletActionContext;

import com.hrl.model.User;
import com.hrl.util.PageUtil;
import com.opensymphony.xwork2.ActionSupport;

public class DefaultAction extends ActionSupport {
	protected String msg = null;
	protected String firstResult = ActionConstant.FIRSTRESULT;
	protected String maxResults = ActionConstant.MAXRESULTS;
	protected String resultCount = null;
	protected String pageCount = null;
	protected User currUser = null;
	protected PageUtil page = new PageUtil();

	protected Map<String, Object> getSession() {
		return ServletActionContext.getContext().getSession();
	}

	protected User getCurrUser() {
		User user = (User) this.getSession().get(
				ActionConstant.CUURUSER_SESSION_FLAG);
		return user;
	}

	protected void setCurrUser(User user) {
		this.getSession().put(ActionConstant.CUURUSER_SESSION_FLAG, user);
	}

	protected String getNowTime() {
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
		return format.format(new Date());
	}

	public String getMsg() {
		return msg;
	}

	public void setMsg(String msg) {
		this.msg = msg;
	}

	public String getFirstResult() {
		return firstResult;
	}

	public void setFirstResult(String firstResult) {
		this.firstResult = firstResult;
	}

	public String getMaxResults() {
		return maxResults;
	}

	public void setMaxResults(String maxResults) {
		this.maxResults = maxResults;
	}

	public String getResultCount() {
		return resultCount;
	}

	public void setResultCount(String resultCount) {
		this.resultCount = resultCount;
	}

	public String getPageCount() {
		return pageCount;
	}

	public void setPageCount(String pageCount) {
		this.pageCount = pageCount;
	}

	public PageUtil getPage() {
		return page;
	}

	public void setPage(PageUtil page) {
		this.page = page;
	}

}
