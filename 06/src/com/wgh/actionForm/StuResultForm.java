package com.wgh.actionForm;

import java.util.Date;
import org.apache.struts.action.ActionForm;

/** 
 * MyEclipse Struts
 * Creation date: 12-17-2007
 * 
 * XDoclet definition:
 * @struts.form name="stuResultForm"
 */
public class StuResultForm extends ActionForm {
	private int resTotal;
	private Date joinTime;
	private int ID;
	private String stuId;
	private String whichLesson;
	private int resMore;
	private int resSingle;

	public int getResTotal() {
		return resTotal;
	}
	public void setResTotal(int resTotal) {
		this.resTotal = resTotal;
	}

	public Date getJoinTime() {
		return joinTime;
	}
	public void setJoinTime(Date joinTime) {
		this.joinTime = joinTime;
	}

	public int getID() {
		return ID;
	}
	public void setID(int ID) {
		this.ID = ID;
	}

	public String getStuId() {
		return stuId;
	}
	public void setStuId(String stuId) {
		this.stuId = stuId;
	}

	public String getWhichLesson() {
		return whichLesson;
	}
	public void setWhichLesson(String whichLesson) {
		this.whichLesson = whichLesson;
	}

	public int getResMore() {
		return resMore;
	}
	public void setResMore(int resMore) {
		this.resMore = resMore;
	}

	public int getResSingle() {
		return resSingle;
	}
	public void setResSingle(int resSingle) {
		this.resSingle = resSingle;
	}
}