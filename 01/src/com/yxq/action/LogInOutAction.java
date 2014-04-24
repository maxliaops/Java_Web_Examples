package com.yxq.action;

import com.yxq.actionSuper.MySuperAction;
import com.yxq.dao.OpDB;
import com.yxq.model.UserSingle;

public class LogInOutAction extends MySuperAction {	
	protected UserSingle user;
	
	public UserSingle getUser() {
		return user;
	}
	public void setUser(UserSingle user) {
		this.user = user;
	}

	/** 功能：判断当前用户是否登录 */
	public String isLogin(){
		Object ob=session.get("loginUser");
		if(ob==null||!(ob instanceof UserSingle))
			return INPUT;
		else
			return LOGIN;
	}
	
	/** 功能：查询数据表，验证是否存在该用户 */
	public String Login(){
		String sql="select * from tb_user where user_name=? and user_password=?";
		Object[] params={user.getUserName(),user.getUserPassword()};
		OpDB myOp=new OpDB();
		if(myOp.LogOn(sql, params)){				//登录成功
			session.put("loginUser",user);
			return LOGIN;
		}
		else{										//用户名或密码错误
			addFieldError("loginE",getText("city.login.wrong.input"));
			return INPUT;
		}
	}
	
	/** 功能：退出登录 */
	public String Logout(){		
		session.clear();	
		return "logout";
	}
	
	/** 功能：验证是否输入用户名和密码 */
	public void validateLogin() {
		String name=user.getUserName();
		String password=user.getUserPassword();
		
		if(name==null||name.equals(""))
			addFieldError("nameError",getText("city.login.no.name"));
		if(password==null||password.equals(""))
			addFieldError("passwordError",getText("city.login.no.password"));
	}
}
