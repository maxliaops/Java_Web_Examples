package com.hiernate.persistence;
import java.sql.*;
public class Placard {
  private int id;
  private String subject;
  private String person;
  private Date DDate;
  private String content;
public String getContent() {
	return content;
}
public void setContent(String content) {
	this.content = content;
}

public Date getDDate() {
	return DDate;
}
public void setDDate(Date date) {
	DDate = date;
}
public int getId() {
	return id;
}
public void setId(int id) {
	this.id = id;
}
public String getPerson() {
	return person;
}
public void setPerson(String person) {
	this.person = person;
}
public String getSubject() {
	return subject;
}
public void setSubject(String subject) {
	this.subject = subject;
}

}
