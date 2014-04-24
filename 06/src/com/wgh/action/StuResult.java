package com.wgh.action;

import javax.servlet.http.*;

import org.apache.struts.action.*;

import com.wgh.actionForm.QueryResultIfForm;
import com.wgh.actionForm.StuResultForm;
import com.wgh.dao.StuResultDAO;

public class StuResult extends Action {
	private StuResultDAO stuResultDAO = null;
	public StuResult() {
		this.stuResultDAO = new StuResultDAO();
	}
	public ActionForward execute(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		String action = request.getParameter("action");
		System.out.println("获取的查询字符串：" + action);
		if (action == null || "".equals(action)) {
			return mapping.findForward("error");
		} else if ("stuResultQuery".equals(action)) {
			return stuResultQuery(mapping, form, request, response);
		} else if ("stuResultQueryS".equals(action)) {
			return stuResultQueryS(mapping, form, request, response);
		}
		request.setAttribute("error", "操作失败！");
		return mapping.findForward("error");
	}

	// 管理员查询考生成绩
	private ActionForward stuResultQuery(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		if(form instanceof StuResultForm){
			request.setAttribute("stuResultQuery", stuResultDAO.query(""));
		}else{
			QueryResultIfForm ifForm = (QueryResultIfForm) form;
			request.setAttribute("stuResultQuery", stuResultDAO.query(ifForm));
		}
		return mapping.findForward("stuResultQuery");
	}
	// 考生查询自己的成绩
	private ActionForward stuResultQueryS(ActionMapping mapping, ActionForm form,
		HttpServletRequest request, HttpServletResponse response) {
		request.setAttribute("stuResultQuery", stuResultDAO.query(request.getParameter("ID").toString()));
		return mapping.findForward("stuResultQueryS");
	}	
}