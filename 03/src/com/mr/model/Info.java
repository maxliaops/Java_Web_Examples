package com.mr.model;

public class Info {
	private Integer id=-1;
	private String info_account="";
	private String info_fromAccount="ÄäÃû";
	private String info_content="";
	private Integer info_sign=-1;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getInfo_account() {
		return info_account;
	}
	public void setInfo_account(String info_account) {
		this.info_account = info_account;
	}
	public String getInfo_content() {
		return info_content;
	}
	public void setInfo_content(String info_content) {
		this.info_content = info_content;
	}
	public String getInfo_fromAccount() {
		return info_fromAccount;
	}
	public void setInfo_fromAccount(String info_fromAccount) {
		this.info_fromAccount = info_fromAccount;
	}
	public Integer getInfo_sign() {
		return info_sign;
	}
	public void setInfo_sign(Integer info_sign) {
		this.info_sign = info_sign;
	}
	
}
