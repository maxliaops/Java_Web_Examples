package com.valueBean;

public class ElectSingle {
	private int id;
	private int electWhoId;
	private String electTitle;
	private String electSrc;
	private String electTime;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}	
	public int getElectWhoId() {
		return electWhoId;
	}
	public void setElectWhoId(int electWhoId) {
		this.electWhoId = electWhoId;
	}
	public String getElectTitle() {
		return electTitle;
	}
	public String getCutElectTitle() {
		int len=14;
		if(len>=electTitle.length()||len<=0)
			return electTitle;
		else{
			return (electTitle.substring(0,len)+"..");
		}
	}
	public void setElectTitle(String electTitle) {
		this.electTitle = electTitle;
	}
	public String getElectSrc() {
		return electSrc;
	}
	public void setElectSrc(String electSrc) {
		this.electSrc = electSrc;
	}
	public String getElectTime() {
		return electTime;
	}
	public void setElectTime(String electTime) {
		this.electTime = electTime;
	}
}
