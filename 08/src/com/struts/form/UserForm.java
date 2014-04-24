package com.struts.form;

import org.apache.struts.action.ActionForm;

public class UserForm extends ActionForm {
   /**
	 * 映射登陆页面的actionForm属性名于index.jsp的form属性名一一对应
	 */
 private static final long serialVersionUID = 1141456844854939928L;
   private String UserName;
   private String PWD;
   private String yanzheng;
   private String userPurview;
   private String userbranch;
 public String getUserbranch() {
	return userbranch;
}
public void setUserbranch(String userbranch) {
	this.userbranch = userbranch;
}
public String getUserPurview() {
	return userPurview;
}
public void setUserPurview(String userPurview) {
	this.userPurview = userPurview;
}
public String getUserName() {
	return UserName;
}
public void setUserName(String userName) {
	UserName = userName;
}
public String getYanzheng() {
	return yanzheng;
}
public void setYanzheng(String yanzheng) {
	this.yanzheng = yanzheng;
}
public String getPWD() {
	return PWD;
 }
 public void setPWD(String pwd) {
	PWD = pwd;
 }

 
 }
