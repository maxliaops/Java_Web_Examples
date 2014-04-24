package com.hrl.model;

import java.util.Date;
import java.util.List;
import java.util.Set;

public class User {

	private Integer userId = null;
	private String userName = null;
	private String password = null;
	private String sex = null;
	private String birthday = null;
	private Date registerTime = null;
	private String email = null;
	private String tel = null;
	private String isAdmin = null;
	private Set<Article> articles = null;
	private Set<Reply> replies = null;

	public Set<Article> getArticles() {
		return articles;
	}

	public void setArticles(Set<Article> articles) {
		this.articles = articles;
	}

	public Set<Reply> getReplies() {
		return replies;
	}

	public void setReplies(Set<Reply> replies) {
		this.replies = replies;
	}

	public Integer getUserId() {
		return userId;
	}

	public void setUserId(Integer userId) {
		this.userId = userId;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getSex() {
		return sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}

	public String getBirthday() {
		return birthday;
	}

	public void setBirthday(String birthday) {
		this.birthday = birthday;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public String getIsAdmin() {
		return isAdmin;
	}

	public void setIsAdmin(String isAdmin) {
		this.isAdmin = isAdmin;
	}

	public int getMyArticleCount() {
		if (this.articles.size() > 0) {
			return this.articles.size();
		}
		return 0;
	}

	public int getMyReplyCount() {
		if (this.replies.size() > 0) {
			return this.replies.size();
		}
		return 0;
	}

	public Date getRegisterTime() {
		return registerTime;
	}

	public void setRegisterTime(Date registerTime) {
		this.registerTime = registerTime;
	}

}
