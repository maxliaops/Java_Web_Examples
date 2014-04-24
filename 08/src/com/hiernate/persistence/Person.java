package com.hiernate.persistence;

import java.sql.Date;

public class Person {
  private int id;
  private String name1;
  private String title;
  private String content;
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
public String getTitle() {
	return title;
}
public void setTitle(String title) {
	this.title = title;
}
}
