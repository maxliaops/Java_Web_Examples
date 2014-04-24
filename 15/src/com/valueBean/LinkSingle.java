package com.valueBean;

public class LinkSingle {
	private int id;
	private int linkWhoId;
	private String linkTitle;
	private String linkSrc;
	private String linkTime;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getLinkWhoId() {
		return linkWhoId;
	}
	public void setLinkWhoId(int linkWhoId) {
		this.linkWhoId = linkWhoId;
	}	
	public String getLinkTitle() {
		return linkTitle;
	}
	public String getCutLinkTitle() {
		int len=14;
		if(len>=linkTitle.length()||len<=0)
			return linkTitle;
		else{
			return (linkTitle.substring(0,len)+"..");
		}
	}
	public void setLinkTitle(String linkTitle) {
		this.linkTitle = linkTitle;
	}
	public String getLinkSrc() {
		return linkSrc;
	}
	public void setLinkSrc(String linkSrc) {
		this.linkSrc = linkSrc;
	}
	public String getLinkTime() {
		return linkTime;
	}
	public void setLinkTime(String linkTime) {
		this.linkTime = linkTime;
	}	
}
