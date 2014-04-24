package com.wgh.actionForm;

import java.util.Date;
import org.apache.struts.action.ActionForm;

/** 
 * MyEclipse Struts
 * Creation date: 12-14-2007
 * 
 * XDoclet definition:
 * @struts.form name="lessonForm"
 */
public class LessonForm extends ActionForm {
	private Date joinTime;
	private String name;
	private int ID;
	private String[] delIdArray=new String[0];

	public Date getJoinTime() {
		return joinTime;
	}
	public void setJoinTime(Date joinTime) {
		this.joinTime = joinTime;
	}

	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}

	public int getID() {
		return ID;
	}
	public void setID(int ID) {
		this.ID = ID;
	}
	public String[] getDelIdArray(){
		return delIdArray;
	}
	public void setDelIdArray(String[] delIdArray){
		this.delIdArray=delIdArray;
	}
}