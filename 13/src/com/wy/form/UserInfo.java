package com.wy.form;

public class UserInfo {
	private Integer id = -1;      //设置数据库自动编号对象
	private String username = ""; //设置用户名称对象
	private String password = ""; //设置用户登录密码对象
	private String realname = ""; //设置用户真实姓名对象
	private String email = "";    //设置用户email地址对象
	private String question = ""; //设置用户问题对象
	private String result = "";   //设置用户答案对象
	/*************将email地址对象设置为getXXX()和setXXX()*******************/
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	/***********************************************/
	/*************将id对象设置为getXXX()和setXXX()*******************/
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	/*************将password对象设置为getXXX()和setXXX()*******************/
	/***********************************************/
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	/***********************************************/
	/*************将question对象设置为getXXX()和setXXX()*******************/
	public String getQuestion() {
		return question;
	}
	public void setQuestion(String question) {
		this.question = question;
	}
	/***********************************************/
	/*************将realname对象设置为getXXX()和setXXX()*******************/
	public String getRealname() {
		return realname;
	}
	public void setRealname(String realname) {
		this.realname = realname;
	}
	/***********************************************/
	/*************将result对象设置为getXXX()和setXXX()*******************/
	public String getResult() {
		return result;
	}
	public void setResult(String result) {
		this.result = result;
	}	
	/***********************************************/
	/*************将username对象设置为getXXX()和setXXX()*******************/
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	/***********************************************/
}
