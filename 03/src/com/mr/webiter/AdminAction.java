package com.mr.webiter;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.ServletRequestAware;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.mr.dao.ObjectDao;
import com.mr.model.AdminInfo;

public class AdminAction extends ActionSupport
		implements
			ModelDriven<AdminInfo>,
			ServletRequestAware {
	private AdminInfo adminInfo = new AdminInfo();
	private ObjectDao<AdminInfo> objectDao = null;
	private String hql = "";
	protected HttpServletRequest request;

	public AdminInfo getModel() {
		return adminInfo;
	}

	public void setServletRequest(HttpServletRequest request) {
		this.request = request;
	}

	public void validateAdmin_passwordUpdate() {
		String oldPassword = request.getParameter("oldPassword");
		if (null == oldPassword || oldPassword.equals("")) {
			this.addFieldError("oldPassword", "请输入原密码！");
		} else {
			oldPassword = com.mr.tools.ValidateExpression
					.encodeMD5(oldPassword);
			String admin = (String) request.getSession().getAttribute("admin");
			hql = "from AdminInfo where account = '" + admin + "'";
			objectDao = new ObjectDao<AdminInfo>();
			AdminInfo admininfo = objectDao.queryFrom(hql);
			if (!oldPassword.equals(admininfo.getPassword())) {
				this.addFieldError("oldPassword", "您输入的原密码有误");
			}
		}
		if (adminInfo.getPassword().equals("")) {
			this.addFieldError("password", "请输入新密码！");
		}
		if (adminInfo.getRepassword().equals("")) {
			this.addFieldError("repassword", "请输入确认密码！");
		}
		System.out.println("新密码：" + adminInfo.getPassword());
		System.out.println("密码确认：" + adminInfo.getRepassword());
		System.out.println("验证码：" + adminInfo.getCode());
		if (!adminInfo.getPassword().equals(adminInfo.getRepassword())) {
			this.addFieldError("repassword", "您输入的新密码与密码确认不一致！");
		}
		if (adminInfo.getCode().equals("")) {
			this.addFieldError("code", "请输入验证码！");
		} else {
			String rand = (String) request.getSession().getAttribute("rand");
			if (!rand.equals(adminInfo.getCode())) {
				this.addFieldError("code", "您输入的校验码不正确！");
			}
		}
	}

	public String admin_passwordUpdate() {
		String password = adminInfo.getPassword();
		password = com.mr.tools.ValidateExpression.encodeMD5(password);
		String admin = (String) request.getSession().getAttribute("admin");
		hql = "from AdminInfo where account = '" + admin + "'";
		objectDao = new ObjectDao<AdminInfo>();
		adminInfo = objectDao.queryFrom(hql);
		adminInfo.setPassword(password);
		String result = "管理员修改密码失败！";
		if (objectDao.updateT(adminInfo)) {
			result = "管理员修改密码成功！";
		}
		request.setAttribute("result", result);
		return SUCCESS;
	}

	// 后台管理员退出
	public String landOutAdmin() {
		request.getSession().invalidate();
		request.setAttribute("sign", "4");
		return "operationAdmin";
	}

	// 后台管理员用户登录校验
	public void validateAdmin_check() {
		if (adminInfo.getAccount().equals("")) {
			this.addFieldError("account", "&nbsp;&nbsp;账号不能为空！");
		}
		if (adminInfo.getPassword().equals("")) {
			this.addFieldError("password", "&nbsp;&nbsp;密码不能为空！");
		}
		if (adminInfo.getCode().equals("")) {
			this.addFieldError("code", "&nbsp;&nbsp;校验码不能为空！");
		} else {
			String rand = (String) request.getSession().getAttribute("rand");
			if (!rand.equals(adminInfo.getCode())) {
				this.addFieldError("code", "&nbsp;&nbsp;您输入的校验码不正确！");
			}
		}
	}
	// 后台管理员登录操作
	public String admin_check() {
		objectDao = new ObjectDao<AdminInfo>();
		String password = com.mr.tools.ValidateExpression.encodeMD5(adminInfo
				.getPassword());
		hql = "from AdminInfo where account = '" + adminInfo.getAccount() + "'";
		AdminInfo admin = objectDao.queryFrom(hql);
		if (null == admin) {
			this.addFieldError("account", "&nbsp;&nbsp;该用户并不存在！");
		} else {
			if (!admin.getPassword().equals(password)) {
				this.addFieldError("password", "&nbsp;&nbsp;您输入的密码有误！");
			} else {
				request.setAttribute("admin", admin.getAccount());
				request.setAttribute("sign", "2");
			}
		}
		return "operationAdmin";
	}

}
