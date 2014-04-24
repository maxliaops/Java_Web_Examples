package com.hibernate.model;

import java.io.Serializable;

public class SystemClassInfoList implements Serializable{
	private String classid;
	private String classmc;
	private String spname;
	private String grname;
	public String getClassid() {
		return classid;
	}
	public void setClassid(String classid) {
		this.classid = classid;
	}
	public String getClassmc() {
		return classmc;
	}
	public void setClassmc(String classmc) {
		this.classmc = classmc;
	}
	public String getGrname() {
		return grname;
	}
	public void setGrname(String grname) {
		this.grname = grname;
	}
	public String getSpname() {
		return spname;
	}
	public void setSpname(String spname) {
		this.spname = spname;
	}
	
	
}
