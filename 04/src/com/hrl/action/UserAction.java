package com.hrl.action;

import java.util.Date;

import org.apache.struts2.ServletActionContext;

import com.hrl.dao.IUserDao;
import com.hrl.model.User;
import com.hrl.util.JSONKit;
import com.opensymphony.xwork2.ActionSupport;

public class UserAction extends DefaultAction {
	private static final long serialVersionUID = 1L;
	private User user = null;
	private IUserDao userDao;
	private boolean hasLogin = false;
	private String oldPassword = null;

	/**
	 * 进入到注册用户页面
	 * 
	 * @return
	 */
	public String register() {
		return "toRegisterPage";
	}

	/**
	 * 添加用户
	 * 
	 * @return
	 */
	public String addUser() {
		user.setRegisterTime(new Date());
		user.setIsAdmin("0");
		userDao.addUser(user);
		this.setCurrUser(user);
		this.setMsg("个人注册成功！");
		return "toSuccessPage";
	}

	/**
	 * 通过用户名查找用户
	 * 
	 * @return
	 */
	public String findUserByUserName() {
		this.user = this.userDao.getUserByUserName(this.user.getUserName());
		if (this.user != null) {
			JSONKit
					.outJSONInfo("{success:true,userExsist:true,'aaaaaa':'aaaaaa'}");
			return NONE;
		}
		JSONKit.outJSONInfo("{success:true}");
		return NONE;
	}
   /**
    * 退出系统
    * @return
    */
	public String exitSys() {
		this.setCurrUser(null);
		return "exitSys";
	}
	/**
	 * 进入到修改用户页面
	 * 
	 * @return
	 */
	public String toUpdatePage() {
		User user = this.getCurrUser();
		this.user = this.userDao.querySingleUser(user.getUserId());
		return "toUpdatePage";
	}

	/**
	 * 进入到登录页面
	 * 
	 * @return
	 */
	public String toLoginPage() {
		return "toLoginPage";
	}

	/**
	 * 用户登录
	 * 
	 * @return
	 */
	public String login() {
		User currUser = this.userDao.login(user);
		if (currUser != null) {
			this.setCurrUser(currUser);
			return "toForumPage";
		} else {
			this.setMsg("用户名或者密码不正确");
			return "relogin";
		}
	}

	/**
	 * 更新用户信息
	 * 
	 * @return
	 */
	public String updateUser() {
		User user1 = this.userDao.getUserByUserName(this.user.getUserName());
		if (user1.getUserName() != null && !user1.getUserName().equals(this.getUser().getUserName())) {
			JSONKit.outJSONInfo("{success:false,msg:'用户名称已经存在'}");
			return NONE;
		}
		User user = this.userDao.querySingleUser(this.user.getUserId());
		if (!this.oldPassword.equals(user.getPassword())) {
			JSONKit.outJSONInfo("{success:false,msg:'旧密码不对'}");
			return NONE;
		}
		user.setUserName(this.user.getUserName());
		user.setPassword(this.user.getPassword());
		user.setEmail(this.user.getEmail());
		user.setTel(this.user.getTel());
		userDao.updateUser(user);
		this.setMsg("个人信息修改成功！");
		JSONKit.outJSONInfo("{success:true,msg:'密码修改成功'}");
		return NONE;
	}

	/**
	 * 进入到成功页面
	 * 
	 * @return
	 */
	public String toSuccessPage() {
		return "toSuccessPage";
	}

	public IUserDao getUserDao() {
		return userDao;
	}

	public void setUserDao(IUserDao userDao) {
		this.userDao = userDao;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public boolean isHasLogin() {
		return hasLogin;
	}

	public void setHasLogin(boolean hasLogin) {
		this.hasLogin = hasLogin;
	}

	public String getOldPassword() {
		return oldPassword;
	}

	public void setOldPassword(String oldPassword) {
		this.oldPassword = oldPassword;
	}

}
