package com.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.actionForm.ManagerForm;
import com.dao.ManagerDAO;
import javax.servlet.http.HttpSession;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;

public class Manager extends HttpServlet {
	private ManagerDAO managerDAO = null; // 声明ManagerDAO的对象

	public Manager() {
		this.managerDAO = new ManagerDAO(); // 实例化ManagerDAO类
	}

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String action = request.getParameter("action");
		System.out.println("获取的查询字符串：" + action);
		if (action == null || "".equals(action)) {
			request.getRequestDispatcher("error.jsp")
					.forward(request, response);
		} else if ("login".equals(action)) {// 当action值为login时，调用managerLogin()方法验证管理员身份
			managerLogin(request, response);
		} else if ("managerAdd".equals(action)) {
			managerAdd(request, response);// 添加管理员信息
		} else if ("managerQuery".equals(action)) {
			managerQuery(request, response);// 查询管理员及权限信息
		} else if ("managerModifyQuery".equals(action)) {
			managerModifyQuery(request, response);// 设置管理员权限时查询管理员信息
		} else if ("managerModify".equals(action)) {
			managerModify(request, response);// 设置管理员权限
		} else if ("managerDel".equals(action)) {
			managerDel(request, response);// 删除管理员
		} else if ("querypwd".equals(action)) {
			pwdQuery(request, response);// 更改口令时应用的查询
		} else if ("modifypwd".equals(action)) {
			modifypwd(request, response); // 更改口令
		}
	}

	// 管理员身份验证

	public void managerLogin(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		ManagerForm managerForm = new ManagerForm();//实例化managerForm类
		managerForm.setName(request.getParameter("name"));//获取管理员名称并设置name属性
		managerForm.setPwd(request.getParameter("pwd"));//获取管理员密码并设置pwd属性
		int ret = managerDAO.checkManager(managerForm);//调用ManagerDAO类的checkManager()方法
		if (ret == 1) {
			/**********将登录到系统的管理员名称保存到session中***********************************/
            HttpSession session=request.getSession();
            session.setAttribute("manager",managerForm.getName());
		/***********************************************************************************/
			request.getRequestDispatcher("main.jsp").forward(request, response);//转到系统主界面
		} else {
			request.setAttribute("error", "您输入的管理员名称或密码错误！");
			request.getRequestDispatcher("error.jsp")
					.forward(request, response);//转到错误提示页
		}
	}

	// 查询管理员信息
	private void managerQuery(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		String str = null;
		request.setAttribute("managerQuery", managerDAO.query(str));
		request.getRequestDispatcher("manager.jsp").forward(request, response);
	}

	// 添加管理员信息
	private void managerAdd(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		ManagerForm managerForm = new ManagerForm();
		managerForm.setName(request.getParameter("name")); // 获取设置管理员名称
		managerForm.setPwd(request.getParameter("pwd")); // 获取并设置密码
		int ret = managerDAO.insert(managerForm); // 调用添加管理员信息
		if (ret == 1) {
			request.getRequestDispatcher("manager_ok.jsp?para=1").forward(
					request, response); // 转到管理员信息添加成功页面

		} else if (ret == 2) {
			request.setAttribute("error", "该管理员信息已经添加！"); // 将错误信息保存到error参数中
			request.getRequestDispatcher("error.jsp")
					.forward(request, response); // 转到错误提示页面
		} else {
			request.setAttribute("error", "添加管理员信息失败！"); // 将错误信息保存到error参数中
			request.getRequestDispatcher("error.jsp")
					.forward(request, response); // 转到错误提示页面
		}
	}

	// 查询修改管理员信息
	private void managerModifyQuery(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		ManagerForm managerForm = new ManagerForm();
		managerForm.setId(Integer.valueOf(request.getParameter("id")));// 获取并设置管理ID号
		System.out.print("查询到的id:" + request.getParameter("id"));
		request.setAttribute("managerQueryif", managerDAO
				.query_update(managerForm));
		request.getRequestDispatcher("manager_Modify.jsp").forward(request,
				response); // 转到权限设置成功页面
	}

	// 修改密码时查询
	private void pwdQuery(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		ManagerForm managerForm = new ManagerForm();
		HttpSession session = request.getSession();
		String manager = (String) session.getAttribute("manager");
		managerForm.setName(manager);
		System.out.print("查询到的manager:" + manager);
		request.setAttribute("pwdQueryif", managerDAO.query_pwd(managerForm));
		request.getRequestDispatcher("pwd_Modify.jsp").forward(request,
				response);
	}

	// 管理员权限设置
	private void managerModify(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		ManagerForm managerForm = new ManagerForm();
		managerForm.setId(Integer.parseInt(request.getParameter("id"))); // 获取并设置管理员ID号
		managerForm.setName(request.getParameter("name")); // 获取并设置管理员名称
		managerForm.setPwd(request.getParameter("pwd")); // 获取并设置管理员密码
		managerForm.setSysset(request.getParameter("sysset") == null ? 0
				: Integer.parseInt(request.getParameter("sysset"))); // 获取并设置系统设置权限
		managerForm.setReaderset(request.getParameter("readerset") == null ? 0
				: Integer.parseInt(request.getParameter("readerset"))); // 获取并设置读者管理权限
		managerForm.setBookset(request.getParameter("bookset") == null ? 0
				: Integer.parseInt(request.getParameter("bookset"))); // 获取并设置图书管理权限
		managerForm
				.setBorrowback(request.getParameter("borrowback") == null ? 0
						: Integer.parseInt(request.getParameter("borrowback"))); // 获取并设置图书借还权限
		managerForm.setSysquery(request.getParameter("sysquery") == null ? 0
				: Integer.parseInt(request.getParameter("sysquery"))); // 获取并设置系统查询权限
		int ret = managerDAO.update(managerForm); // 调用设置管理员权限的方法
		if (ret == 0) {
			request.setAttribute("error", "设置管理员权限失败！"); // 保存错误提示信息到error参数中
			request.getRequestDispatcher("error.jsp")
					.forward(request, response); // 转到错误提示页面
		} else {
			request.getRequestDispatcher("manager_ok.jsp?para=2").forward(
					request, response);// 转到权限设置成功页面
		}
	}

	// 删除管理员信息
	private void managerDel(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		ManagerForm managerForm = new ManagerForm();
		managerForm.setId(Integer.valueOf(request.getParameter("id"))); // 获取并设置管理员ID号
		int ret = managerDAO.delete(managerForm); // 调用删除信息的方法delete()
		if (ret == 0) {
			request.setAttribute("error", "删除管理员信息失败！"); // 保存错误提示信息到error参数中
			request.getRequestDispatcher("error.jsp")
					.forward(request, response); // 转到错误提示页面
		} else {
			request.getRequestDispatcher("manager_ok.jsp?para=3").forward(
					request, response); // 转到删除管理员信息成功页面
		}
	}

	// 修改管理员密码
	private void modifypwd(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		ManagerForm managerForm = new ManagerForm();
		managerForm.setName(request.getParameter("name"));
		managerForm.setPwd(request.getParameter("pwd"));
		int ret = managerDAO.updatePwd(managerForm);
		if (ret == 0) {
			request.setAttribute("error", "更改口令失败！");
			request.getRequestDispatcher("error.jsp")
					.forward(request, response);
		} else {
			request.getRequestDispatcher("pwd_ok.jsp").forward(request,
					response);
		}
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doGet(request, response);
	}

}
