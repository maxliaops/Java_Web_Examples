package com.hiernate.persistence;

import java.sql.Date;

public class Shenhe {
  private int id;
  private String title;
  private String content;
  private String shen;
  private Date time1;
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
public String getShen() {
	return shen;
}
public void setShen(String shen) {
	this.shen = shen;
}

public Date getTime1() {
	return time1;
}
public void setTime1(Date time1) {
	this.time1 = time1;
}
public String getTitle() {
	return title;
}
public void setTitle(String title) {
	this.title = title;
}
}
