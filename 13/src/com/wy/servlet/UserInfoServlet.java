package com.wy.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.wy.dao.OperationData;
import com.wy.form.UserInfo;

public class UserInfoServlet extends HttpServlet {
	private String info = null; // 设置String类型对象info，该对象代表着执行不同的方法

	private OperationData data = null; // 定义OperationData类对象

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		info = request.getParameter("info");
		// 根据不同的参数名称，执行不同的方法
		if (info.equals("saveUser")) {
			this.user_save(request, response);
		}
		if (info.equals("checkUser")) {
			this.user_check(request, response);
		}
		if (info.equals("cannleUser")) {
			this.user_cannle(request, response);
		}
		if (info.equals("userLand")) {
			this.user_land(request, response);
		}
	}

	// 当用户注册成功后，执行该方法将自动登录的功能
	private void user_land(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		data = new OperationData(); // data对象进行实例化
		String username = com.wy.tools.Encrypt.toChinese(request
				.getParameter("username")); // 从页面中获取用户名
		UserInfo userInfo = data.user_query(username); // 以用户名为条件，查询用户信息的一组数据
		request.getSession().setAttribute("userInfo", userInfo); // 将用户信息保存在session中
		request.getRequestDispatcher("index.jsp").forward(request, response); // 返回到首页
	}

	// 当用户完成操作后，执行该方法将实现用户注销的功能
	private void user_cannle(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		if (null != request.getSession().getAttribute("userInfo")) {
			request.getSession().invalidate(); // 实行session销毁的操作
		}
		request.getRequestDispatcher("index.jsp").forward(request, response); // 返回首页中
	}

	// 实现用户登录功能
	private void user_check(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		data = new OperationData();
		String username = com.wy.tools.Encrypt.toChinese(request
				.getParameter("username")); // 获取页面中用户名表单内容
		String password = com.wy.tools.Encrypt.encode(request
				.getParameter("password")); // 获取页面中的密码表单内容
		UserInfo userInfo = data.user_query(username); // 以用户名为条件进行查询用户信息的一组数据
		String code = request.getParameter("code"); // 获取页面中的校验码
		String codeSession = (String) request.getSession().getAttribute("rand"); // 获取客户端session中的校验码内容
		if (code.equals(codeSession)) {
			if (null != userInfo) {				
				if (userInfo.getPassword().equals(password)) {
					request.getSession().setAttribute("userInfo", userInfo);
				}
			}
		}

		request.getRequestDispatcher("index.jsp").forward(request, response);
	}

	// 实现用户注册功能
	private void user_save(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=GBK");
		PrintWriter out = response.getWriter();
		data = new OperationData();
		UserInfo userInfo = new UserInfo();
		userInfo.setUsername(com.wy.tools.Encrypt.toChinese(request
				.getParameter("username"))); // 获取客户端用户名信息的表单
		userInfo.setPassword(com.wy.tools.Encrypt.encode(request
				.getParameter("password"))); // 获取客户端密码信息的表单
		userInfo.setRealname(com.wy.tools.Encrypt.toChinese(request
				.getParameter("realname"))); // 获取客户端真实姓名的表单
		userInfo.setEmail(request.getParameter("email")); // 获取客户端email地址的表单
		userInfo.setQuestion(com.wy.tools.Encrypt.toChinese(request
				.getParameter("question"))); // 获取客户端问题的表单
		userInfo.setResult(com.wy.tools.Encrypt.toChinese(request
				.getParameter("result"))); // 获取客户端答案的表单
		String information = "";
		String code = request.getParameter("code"); // 获取客户端验证码
		String codeSession = (String) request.getSession().getAttribute("rand"); // 获取客户端session中的校验码
		if (code.equals(codeSession)) { // 判断验证码是否正确
			if (!data.user_save(userInfo)) { // 判断用户保存操作是否成功
				information = "您输入的用户名重复，注册失败！";
			}
		} else {
			information = "您输入校验码不正确，注册失败！！";
		}
		if (information.equals("")) { // 根据information对象判断用户的登录结果
			information = "用户注册成功！";
			String username = com.wy.tools.Encrypt.toChinese(request
					.getParameter("username"));
			request.setAttribute("information", information); // 将用户注册结果保存在request范围内
			request.setAttribute("username", username); // 将用户名保存在request范围内
			request.getRequestDispatcher("user_save.jsp").forward(request,
					response);
		}
		out.print("<script language=javascript>alert('" + information
				+ "');history.go(-1);</script>"); // 如果用户注册失败，页面将跳转到上一层页面
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		this.doGet(request, response);

	}

}
