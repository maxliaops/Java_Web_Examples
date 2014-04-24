package com.yxq.model;

public class InfoSingle {
	private int id;
	private int infoType;
	private String infoTitle;
	private String infoContent;
	private String infoLinkman;
	private String infoPhone;
	private String infoEmail;
	private String infoDate; 
	private String infoState;
	private String infoPayfor;
	
	public int getId() {
		return this.id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getInfoContent() {
		return infoContent;
	}
	public void setInfoContent(String infoContent) {
		this.infoContent = infoContent;
	}
	public String getInfoDate() {
		return infoDate;
	}
	public void setInfoDate(String infoDate) {
		this.infoDate = infoDate;
	}
	public String getInfoLinkman() {
		return infoLinkman;
	}
	public void setInfoLinkman(String infoLinkman) {
		this.infoLinkman = infoLinkman;
	}
	public String getInfoPayfor() {
		return infoPayfor;
	}
	public void setInfoPayfor(String infoPayfor) {
		this.infoPayfor = infoPayfor;
	}
	public String getInfoPhone() {
		return infoPhone;
	}
	public void setInfoPhone(String infoPhone) {
		this.infoPhone=infoPhone;
	}	
	public String getInfoEmail() {		
		return infoEmail;
	}
	public void setInfoEmail(String infoEmail) {
		this.infoEmail = infoEmail;
	}
	public String getInfoState() {
		return infoState;
	}
	public void setInfoState(String infoState) {
		this.infoState = infoState;
	}
	public String getInfoTitle() {
		return infoTitle;
	}
	public void setInfoTitle(String infoTitle) {
		this.infoTitle = infoTitle;
	}
	public int getInfoType() {
		return infoType;
	}
	public void setInfoType(int infoType) {
		this.infoType = infoType;
	}
	public String getSubInfoTitle(int len){
		if(len<=0||len>this.infoTitle.length())
			len=this.infoTitle.length();
		return this.infoTitle.substring(0,len);		
	}
}
