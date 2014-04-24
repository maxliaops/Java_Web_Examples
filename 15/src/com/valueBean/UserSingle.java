package com.valueBean;

public class UserSingle {
	private int id;
	private String userName;
	private String userPswd;
	private String aginPswd;
	private String userIco;
	private String userMotto;
	private String userSex;
	private String userOicq;
	private String userEmail;
	private String userFrom;
	private String userBlogName;
	private String userCTTime;
	private int userHitNum;
	
	public UserSingle(){
		userName="";
		userPswd="";
		aginPswd="";
		userIco="";
		userMotto="";
		userSex="ÄÐ";
		userOicq="";
		userEmail="";
		userFrom="";
		userBlogName="";
		userHitNum=0;
	}
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getUserPswd() {
		return userPswd;
	}
	public void setUserPswd(String userPswd) {
		this.userPswd = userPswd;
	}	
	public String getAginPswd() {
		return aginPswd;
	}
	public void setAginPswd(String aginPswd) {
		this.aginPswd = aginPswd;
	}
	public String getUserIco() {
		return userIco;
	}
	public void setUserIco(String userIco) {
		this.userIco = userIco;
	}
	public String getUserMotto() {
		return userMotto;
	}
	public void setUserMotto(String userMotto) {
		this.userMotto = userMotto;
	}
	public String getUserSex() {
		return userSex;
	}
	public void setUserSex(String userSex) {
		this.userSex = userSex;
	}
	public String getUserOicq() {
		return userOicq;
	}
	public void setUserOicq(String userOicq) {
		this.userOicq = userOicq;
	}
	public String getUserEmail() {
		return userEmail;
	}
	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}
	public String getUserFrom() {
		return userFrom;
	}
	public void setUserFrom(String userFrom) {
		this.userFrom = userFrom;
	}
	public String getUserBlogName() {
		return userBlogName;
	}
	public String getCutUserBlogName() {
		int len=14;
		if(len>=userBlogName.length()||len<=0)
			return userBlogName;
		else{
			return (userBlogName.substring(0,len)+"..");
		}
	}
	public void setUserBlogName(String userBlogName) {
		this.userBlogName = userBlogName;
	}
	public String getUserCTTime() {
		return userCTTime;
	}
	public void setUserCTTime(String userCTTime) {
		this.userCTTime = userCTTime;
	}
	public int getUserHitNum() {
		return userHitNum;
	}
	public void setUserHitNum(int userHitNum) {
		this.userHitNum = userHitNum;
	}
}
