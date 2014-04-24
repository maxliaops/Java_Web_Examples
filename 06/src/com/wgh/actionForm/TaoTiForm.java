package com.wgh.actionForm;

import java.util.Date;
import org.apache.struts.action.ActionForm;

public class TaoTiForm extends ActionForm {
	private int lessonId;
	private Date joinTime;
	private String name;
	private int ID;
	private String[] delIdArray=new String[0];
	private String[] nameArray=new String[0];
	public int getLessonId() {
		return lessonId;
	}
	public void setLessonId(int lessonId) {
		this.lessonId = lessonId;
	}

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
	public String[] getNameArray(){
		return nameArray;
	}
	public void setNameArray(String[] nameArray){
		this.nameArray=nameArray;
	}
}