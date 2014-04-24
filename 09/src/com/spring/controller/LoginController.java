package com.spring.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.AbstractController;

import com.hibernate.dao.DAOSupport;
import com.hibernate.model.Login;

public class LoginController extends AbstractController {
	private DAOSupport dao = null;

	protected ModelAndView handleRequestInternal(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		Map model = new HashMap();
		HttpSession session = request.getSession();
		String user = request.getParameter("username");
		String pass = request.getParameter("password");
		String action = request.getParameter("action");
		if (action == null) {
			List list = dao.QueryObject("from Login where username='" + user
					+ "' and password='" + pass + "'");
			if (list.size() > 0) {
				Login login = (Login) list.get(0);
				session.setAttribute("loginUser", login);
				model.put("message", "<script type=\"text/javascript\">parent.topMenuFrame.location.reload();</script>");	
			} else {
				model.put("message", "用户名不存在或密码错误。");
			}
		}else{
			session.removeAttribute("loginUser");
		}
		return new ModelAndView("left", model);
	}

	public DAOSupport getDao() {
		return dao;
	}

	public void setDao(DAOSupport dao) {
		this.dao = dao;
	}
}
