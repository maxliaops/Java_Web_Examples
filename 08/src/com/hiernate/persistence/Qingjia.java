package com.hiernate.persistence;

import java.sql.Date;

public class Qingjia {
   private int id;
   private String name1;
   private String department;
   private String content;
   private Date time1;
   private Date time2;
   private String state;
public String getContent() {
	return content;
}
public void setContent(String content) {
	this.content = content;
}
public String getDepartment() {
	return department;
}
public void setDepartment(String department) {
	this.department = department;
}
public int getId() {
	return id;
}
public void setId(int id) {
	this.id = id;
}
public String getName1() {
	return name1;
}
public void setName1(String name1) {
	this.name1 = name1;
}
public String getState() {
	return state;
}
public void setState(String state) {
	this.state = state;
}
public Date getTime1() {
	return time1;
}
public void setTime1(Date time1) {
	this.time1 = time1;
}
public Date getTime2() {
	return time2;
}
public void setTime2(Date time2) {
	this.time2 = time2;
}


}
