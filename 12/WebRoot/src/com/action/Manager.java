package com.action;

import org.apache.struts.action.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.actionForm.ManagerForm;
import com.dao.ManagerDAO;
import javax.servlet.http.HttpSession;

public class Manager extends Action {
	private ManagerDAO managerDAO = null;

	public Manager() {
		this.managerDAO = new ManagerDAO();
	}

	public void execute(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		String action = request.getParameter("action");
		System.out.println("获取的查询字符串：" + action);
		if (action == null || "".equals(action)) {
			request.getRequestDispatcher("error.jsp").forward(request, response);
		} else if ("login".equals(action)) {
			return managerLogin(mapping, form, request, response);
		} else if ("managerAdd".equals(action)) {
			return managerAdd(mapping, form, request, response);
		} else if ("managerQuery".equals(action)) {
			return managerQuery(mapping, form, request, response);
		} else if ("managerModifyQuery".equals(action)) {
			return managerModifyQuery(mapping, form, request, response);
		} else if ("managerModify".equals(action)) {
			return managerModify(mapping, form, request, response);
		} else if ("managerDel".equals(action)) {
			return managerDel(mapping, form, request, response);
		} else if ("querypwd".equals(action)) {
			return pwdQuery(mapping, form, request, response);
		} else if ("modifypwd".equals(action)) {
			return modifypwd(mapping, form, request, response);
		}
		request.setAttribute("error", "操作失败！");
		request.getRequestDispatcher("error.jsp").forward(request, response);
	}

	// 管理员身份验证

	public void managerLogin(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		ManagerForm managerForm = (ManagerForm) form;
		managerForm.setName(managerForm.getName());
		managerForm.setPwd(managerForm.getPwd());
		int ret = managerDAO.checkManager(managerForm);
		System.out.print("验证结果ret的值:" + ret);
		if (ret == 1) {
			HttpSession session = request.getSession();
			session.setAttribute("manager", managerForm.getName());
			return mapping.findForward("managerLoginok");
		} else {
			request.setAttribute("error", "您输入的管理员名称或密码错误！");
			request.getRequestDispatcher("error.jsp").forward(request, response);
		}
	}

	// 查询管理员信息
	private void managerQuery(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		String str = null;
		request.setAttribute("managerQuery", managerDAO.query(str));
		return mapping.findForward("managerQuery");
	}

	// 添加管理员信息
	private void managerAdd(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		ManagerForm managerForm = (ManagerForm) form;
		managerForm.setName(managerForm.getName()); // 获取设置管理员名称
		managerForm.setPwd(managerForm.getPwd()); // 获取并设置密码
		int ret = managerDAO.insert(managerForm); // 调用添加管理员信息
		if (ret == 1) {
			return mapping.findForward("managerAdd"); // 转到管理员信息添加成功页面
		} else if (ret == 2) {
			request.setAttribute("error", "该管理员信息已经添加！"); // 将错误信息保存到error参数中
			request.getRequestDispatcher("error.jsp").forward(request, response); // 转到错误提示页面
		} else {
			request.setAttribute("error", "添加管理员信息失败！"); // 将错误信息保存到error参数中
			request.getRequestDispatcher("error.jsp").forward(request, response); // 转到错误提示页面
		}
	}

	// 查询修改管理员信息
	private void managerModifyQuery(ActionMapping mapping,
			ActionForm form, HttpServletRequest request,
			HttpServletResponse response) {
		ManagerForm managerForm = (ManagerForm) form;
		managerForm.setId(Integer.valueOf(request.getParameter("id")));//获取并设置管理ID号
		System.out.print("查询到的id:" + request.getParameter("id"));
		request.setAttribute("managerQueryif", managerDAO
				.query_update(managerForm));
		return mapping.findForward("managerQueryModify");			//转到权限设置成功页面
	}

	// 修改密码时查询
	private void pwdQuery(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		ManagerForm managerForm = (ManagerForm) form;
		HttpSession session = request.getSession();
		String manager = (String) session.getAttribute("manager");
		managerForm.setName(manager);
		System.out.print("查询到的manager:" + manager);
		request.setAttribute("pwdQueryif", managerDAO.query_pwd(managerForm));
		return mapping.findForward("pwdQueryModify");
	}

	// 修改管理员信息
	private void managerModify(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		ManagerForm managerForm = (ManagerForm) form;
		managerForm.setId(managerForm.getId());				//获取并设置管理员ID号
		managerForm.setName(managerForm.getName());			//获取并设置管理员名称
		managerForm.setPwd(managerForm.getPwd());			//获取并设置管理员密码
		managerForm.setSysset(managerForm.getSysset());			//获取并设置系统设置权限
		managerForm.setReaderset(managerForm.getReaderset());		//获取并设置读者管理权限
		managerForm.setBookset(managerForm.getBookset());		//获取并设置图书管理权限
		managerForm.setBorrowback(managerForm.getBorrowback());	//获取并设置图书借还权限
		managerForm.setSysquery(managerForm.getSysquery());		//获取并设置系统查询权限
		int ret = managerDAO.update(managerForm);				//调用设置管理员权限的方法
		if (ret == 0) {
			request.setAttribute("error", "设置管理员权限失败！");	//保存错误提示信息到error参数中
			request.getRequestDispatcher("error.jsp").forward(request, response);				//转到错误提示页面
		} else {
			return mapping.findForward("managerModify");		//转到权限设置成功页面
		}
	}


	// 删除管理员信息
	private void managerDel(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		ManagerForm managerForm = (ManagerForm) form;
		managerForm.setId(Integer.valueOf(request.getParameter("id")));	//获取并设置管理员ID号
		int ret = managerDAO.delete(managerForm);		//调用删除信息的方法delete()
		if (ret == 0) {
			request.setAttribute("error", "删除管理员信息失败！");	//保存错误提示信息到error参数中
			request.getRequestDispatcher("error.jsp").forward(request, response);	//转到错误提示页面
		} else {
			return mapping.findForward("managerDel");	//转到删除管理员信息成功页面
		}
	}

	// 修改管理员密码
	private void modifypwd(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		ManagerForm managerForm = (ManagerForm) form;
		managerForm.setName(managerForm.getName());
		managerForm.setPwd(managerForm.getPwd());
		int ret = managerDAO.updatePwd(managerForm);
		if (ret == 0) {
			request.setAttribute("error", "更改口令失败！");
			request.getRequestDispatcher("error.jsp").forward(request, response);
		} else {
			return mapping.findForward("pwdModify");
		}
	}
}
