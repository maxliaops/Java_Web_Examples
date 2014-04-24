package com.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.actionForm.LibraryForm;
import com.actionForm.ParameterForm;
import com.dao.LibraryDAO;
import com.dao.ParameterDAO;

public class Parameter extends HttpServlet {
	ParameterDAO parameterDAO = null;

	public Parameter() {
		parameterDAO = new ParameterDAO();
	}

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String str = request.getParameter("action");
		if ("parameterQuery".equals(str)) {
			parameterModifyQuery(request, response);
		} else if ("parameterModify".equals(str)) {
			parameterModify(request, response);
		}
	}

	private void parameterModify(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		ParameterForm parameterForm = new ParameterForm();
		parameterForm.setId(1);
		parameterForm.setCost(Integer.parseInt(request.getParameter("cost")));
		parameterForm.setValidity(Integer.parseInt(request.getParameter("validity")));
		int ret = parameterDAO.update(parameterForm);
		if (ret == 0) {
			request.setAttribute("error", "参数设置信息修改失败！");
			request.getRequestDispatcher("error.jsp")
					.forward(request, response);
		} else {
			request.getRequestDispatcher("parameter_ok.jsp?para=2").forward(request,
					response);
		}

	}

	private void parameterModifyQuery(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		request.setAttribute("parameterModifyif", parameterDAO.query());
		request.getRequestDispatcher("parameter_modify.jsp").forward(request,
				response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doGet(request, response);
	}
}
