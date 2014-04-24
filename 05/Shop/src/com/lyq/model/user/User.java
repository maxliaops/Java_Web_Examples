package com.lyq.model.user;

import java.io.Serializable;
/**
 * 管理员
 * @author Li Yongqiang
 */
public class User implements Serializable{
	private static final long serialVersionUID = 1L;
	// 编号
	private Integer id;
	// 用户名
	private String username;
	// 密码
	private String password;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
}
