package com.hiernate.persistence;

import java.sql.Date;

public class Meeting {
  private int id;
  private String MTime;
  private String ZPerson;
  private String CPerson;
  private String subject;
  private String address;
  private String content;
public String getAddress() {
	return address;
}
public void setAddress(String address) {
	this.address = address;
}
public String getContent() {
	return content;
}
public void setContent(String content) {
	this.content = content;
}

public int getId() {
	return id;
}
public void setId(int id) {
	this.id = id;
}

public String getSubject() {
	return subject;
}
public void setSubject(String subject) {
	this.subject = subject;
}
public String getCPerson() {
	return CPerson;
}
public void setCPerson(String person) {
	CPerson = person;
}
public String getZPerson() {
	return ZPerson;
}
public void setZPerson(String person) {
	ZPerson = person;
}
public String getMTime() {
	return MTime;
}
public void setMTime(String time) {
	MTime = time;
}


}
