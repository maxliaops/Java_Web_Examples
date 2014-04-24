package com.mr.model;

public class UserInfo {
	private Integer id;
	private String account;
	private String password;
	private String repassword;
	private String realname;
	private String email;
	private String sex;	
	private Integer tel;
	private String address;
	private String homepage;
	private Integer qq;
	private String headgif;
	private String freeze = "¶³½á";
	private String artType="";
	private String picType="";
	private String commend = "·ñ";
	private Integer vistor = 0;
	private String self;
	private String profession;
	private String code;
	private String friendType="";
	
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public String getProfession() {
		return profession;
	}
	public void setProfession(String profession) {
		this.profession = profession;
	}
	public String getAccount() {
		return account;
	}
	public void setAccount(String account) {
		this.account = account;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getArtType() {
		return artType;
	}
	public void setArtType(String artType) {
		this.artType = artType;
	}
	
	public String getCommend() {
		return commend;
	}
	public void setCommend(String commend) {
		this.commend = commend;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getFreeze() {
		return freeze;
	}
	public void setFreeze(String freeze) {
		this.freeze = freeze;
	}
	public String getHeadgif() {
		return headgif;
	}
	public void setHeadgif(String headgif) {
		this.headgif = headgif;
	}
	public String getHomepage() {
		return homepage;
	}
	public void setHomepage(String homepage) {
		this.homepage = homepage;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getPicType() {
		return picType;
	}
	public void setPicType(String picType) {
		this.picType = picType;
	}
	public Integer getQq() {
		return qq;
	}
	public void setQq(Integer qq) {
		this.qq = qq;
	}
	public void setTel(Integer tel) {
		this.tel = tel;
	}
	public String getRealname() {
		return realname;
	}
	public void setRealname(String realname) {
		this.realname = realname;
	}
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	public Integer getTel() {
		return tel;
	}
	public Integer getVistor() {
		return vistor;
	}
	public void setVistor(Integer vistor) {
		this.vistor = vistor;
	}
	public String getRepassword() {
		return repassword;
	}
	public void setRepassword(String repassword) {
		this.repassword = repassword;
	}
	public String getSelf() {
		return self;
	}
	public void setSelf(String self) {
		this.self = self;
	}
	public String getFriendType() {
		return friendType;
	}
	public void setFriendType(String friendType) {
		this.friendType = friendType;
	}
}
