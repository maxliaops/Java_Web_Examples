package com.hiernate.persistence;
/**
 * 用户持久化类
 *
 */
public class User {
   private int id;                //用户的id号
   private String userName;       //用户登录系统时所用的用户名
   private String pwd;            //用户密码
   private String name;           //用户的真实姓名
   private String purview;        //用户权限
   private String branch;         //用户所在的部门
   private String job;            //用户工作
   private String sex;            //用户性别
   private String email;          //用户的E-mail地址
   private String  tel;           //用户电话
   private String address;        //用户地址
   private int bestMan;           //优秀员工标记

public int getBestMan() {
	return bestMan;
}
public void setBestMan(int bestMan) {
	this.bestMan = bestMan;
}
public String getAddress() {
	return address;
}
public void setAddress(String address) {
	this.address = address;
}

public String getBranch() {
	return branch;
}
public void setBranch(String branch) {
	this.branch = branch;
}
public String getEmail() {
	return email;
}
public void setEmail(String email) {
	this.email = email;
}
public int getId() {
	return id;
}
public void setId(int id) {
	this.id = id;
}
public String getJob() {
	return job;
}
public void setJob(String job) {
	this.job = job;
}
public String getName() {
	return name;
}
public void setName(String name) {
	this.name = name;
}
public String getPurview() {
	return purview;
}
public void setPurview(String purview) {
	this.purview = purview;
}
public String getPwd() {
	return pwd;
}
public void setPwd(String pwd) {
	this.pwd = pwd;
}
public String getSex() {
	return sex;
}
public void setSex(String sex) {
	this.sex = sex;
}
public String getTel() {
	return tel;
}
public void setTel(String tel) {
	this.tel = tel;
}
public String getUserName() {
	return userName;
}
public void setUserName(String userName) {
	this.userName = userName;
}
}