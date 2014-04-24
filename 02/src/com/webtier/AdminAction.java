package com.webtier;

import com.dao.AdminDao;
import com.form.AdminForm;

public class AdminAction extends AdminForm {
	private  static	AdminDao adminDao = null;
	
	static{
		adminDao=new AdminDao();
	}

	// 对登录用户的表单验证是否为空
	public void validateIndex() {	
		if (null == admin_user || admin_user.equals("")) {
			this.addFieldError("admin_user", "| 请您输入用户名");
		}
		if (null == admin_password || admin_password.equals("")) {
			this.addFieldError("admin_password", "| 请您输入密码");
		}
	}

	// 对登录用户的表单验证
	public String index() {	
		String query_password = adminDao.getAdminPassword(admin_user);
		if (query_password.equals("")) {
			this.addActionError("| 该用户名不存在");
			return INPUT;
		}
		if (!query_password.equals(admin_password)) {
			this.addActionError("| 您输入的密码有误，请重新输入");
			return INPUT;
		}
		session.put("admin_user", admin_user);
		return SUCCESS;
	}

	// 对修改管理员密码表单验证是否为空
	public void validateUpdatePassword() {

		if (null == admin_password || admin_password.equals("")) {
			this.addFieldError("admin_password", "请输入原密码");
		}
		if (null == admin_repassword1 || admin_repassword1.equals("")) {
			this.addFieldError("admin_repassword1", "请输入新密码");
		}
		if (null == admin_repassword2 || admin_repassword2.equals("")) {
			this.addFieldError("admin_repassword2", "请输入密码确认");
		}
		if (!admin_repassword1.equals(admin_repassword2)) {
			this.addActionError("您输入两次密码不相同，请重新输入！！！");
		}

	}

	public String updatePassword() {		
		String query_password = adminDao.getAdminPassword(admin_user);
		if (!admin_password.equals(query_password)) {
			this.addFieldError("admin_password", "您输入的原密码有误，请重新输入");
		}
		String sql = "update tb_admin set admin_password='" + admin_repassword1
				+ "' where admin_user='" + admin_user + "'";
		if (!adminDao.operationAdmin(sql)) {
			this.addActionError("修改密码失败！！！");
			return INPUT;
		} else {
			request.setAttribute("editPassword", "您修改密码成功，请您重新登录！！！");
			return SUCCESS;
		}		
	}

}
