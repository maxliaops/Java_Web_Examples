package com.mr.model;

public class ReArticleInfo {
	private Integer id=-1;
	private Integer re_id=-1;
	private String account="";
	private String re_time="";
	private String content = "";
	
	public Integer getRe_id() {
		return re_id;
	}
	public void setRe_id(Integer re_id) {
		this.re_id = re_id;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getRe_time() {
		return re_time;
	}
	public void setRe_time(String re_time) {
		this.re_time = re_time;
	}
	public String getAccount() {
		return account;
	}
	public void setAccount(String account) {
		this.account = account;
	}
}
