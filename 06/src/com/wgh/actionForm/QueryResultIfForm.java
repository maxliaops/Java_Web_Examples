package com.wgh.actionForm;

import org.apache.struts.action.ActionForm;

public class QueryResultIfForm extends ActionForm  {
	private String queryIf;
	private String key;


	public String getQueryIf() {
		return queryIf;
	}
	public void setQueryIf(String queryIf) {
		this.queryIf = queryIf;
	}
	public String getKey() {
		return key;
	}
	public void setKey(String key) {
		this.key = key;
	}
}
