package com.spring.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.validation.BindException;
import org.springframework.web.bind.ServletRequestDataBinder;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.SimpleFormController;

import com.hibernate.dao.DAOSupport;
import com.hibernate.model.Login;

public class AddUserController extends SimpleFormController {
	private DAOSupport dao;

	public AddUserController() {
		setCommandClass(Login.class);
	}

	protected ModelAndView onSubmit(HttpServletRequest request,
			HttpServletResponse response, Object command, BindException errors)
			throws Exception {
		HttpSession session = request.getSession();
		Login manager = (Login) session.getAttribute("loginUser");
		Map model = new HashMap();
		if (manager != null&&manager.getUsername().equals("mr")) {
			Login newUser = (Login) command;
			List list = dao.QueryObject("from Login where username='"
					+ newUser.getUsername() + "'");
			if(list.size()>0)
				model.put("message", "登录名称已经存在，请更换用户名。");
			else{
				dao.InsertOrUpdate(newUser);
				model.put("message", "用户\""+newUser.getName()+"\"添加成功。");				
			}
		}
		else
			model.put("message", "权限不够或未登录，请返回登陆。");
		return new ModelAndView("userManager/addUser",model);
	}

	protected void initBinder(HttpServletRequest request,
			ServletRequestDataBinder binder) throws Exception {
		request.setCharacterEncoding("gb2312");
	}

	public DAOSupport getDao() {
		return dao;
	}

	public void setDao(DAOSupport dao) {
		this.dao = dao;
	}

}
