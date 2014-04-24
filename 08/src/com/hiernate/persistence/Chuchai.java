package com.hiernate.persistence;

import java.sql.Date;

public class Chuchai {
  private int id;
  private String chuarea;
  private Date time1;
  private Date time2;
  private String name1;
  private String department;
  private String state;
public String getState() {
	return state;
}
public void setState(String state) {
	this.state = state;
}
public String getChuarea() {
	return chuarea;
}
public void setChuarea(String chuarea) {
	this.chuarea = chuarea;
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
