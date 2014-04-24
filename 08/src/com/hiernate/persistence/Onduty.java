package com.hiernate.persistence;
public class Onduty {
   private int id;
   private String name1;
   private String department;
   private String enroltype;
   private String definetime;
   private String enroltime;
   private String enrolremark;
   private String state;
public void setDepartment(String department) {
	this.department = department;
}
public String getEnrolremark() {
	return enrolremark;
}
public void setEnrolremark(String enrolremark) {
	this.enrolremark = enrolremark;
}
public String getDefinetime() {
	return definetime;
}
public void setDefinetime(String definetime) {
	this.definetime = definetime;
}
public String getEnroltime() {
	return enroltime;
}
public void setEnroltime(String enroltime) {
	this.enroltime = enroltime;
}
public String getDepartment() {
	return department;
}
public String getEnroltype() {
	return enroltype;
}
public void setEnroltype(String enroltype) {
	this.enroltype = enroltype;
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
}
