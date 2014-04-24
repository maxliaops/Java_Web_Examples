package com.wgh.action;

import javax.servlet.http.*;

import org.apache.struts.action.*;

import com.wgh.actionForm.TaoTiForm;
import com.wgh.dao.LessonDAO;
import com.wgh.dao.TaoTiDAO;

public class TaoTi extends Action {
	private TaoTiDAO taoTiDAO = null;
	private LessonDAO lessonDAO=null;

	public TaoTi() {
		this.taoTiDAO = new TaoTiDAO();
		this.lessonDAO=new LessonDAO();
	}
	public ActionForward execute(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		String action = request.getParameter("action");
		System.out.println("获取的查询字符串：" + action);
		if (action == null || "".equals(action)) {
			return mapping.findForward("error");
		} else if ("taoTiQuery".equals(action)) {
			return taoTiQuery(mapping, form, request, response);
		}else if("taoTiAddQuery".equals(action)){
			return taoTiAddQuery(mapping,form,request,response);			
		} else if ("taoTiAdd".equals(action)) {
			return taoTiAdd(mapping, form, request, response);
		} else if ("taoTiDel".equals(action)) {
			return taoTiDel(mapping, form, request, response);
		}else if("taoTiModifyQuery".equals(action)){
			return taoTiModifyQuery(mapping,form,request,response);
		}else if("taoTiModify".equals(action)){
			return taoTiModify(mapping,form,request,response);
		}
		request.setAttribute("error", "操作失败！");
		return mapping.findForward("error");
	}

	// 查询套题信息
	private ActionForward taoTiQuery(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		request.setAttribute("taoTiQuery", taoTiDAO.query(0));
		return mapping.findForward("taoTiQuery");
	}

	// 添加套题
	private ActionForward taoTiAdd(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		TaoTiForm taoTiForm = (TaoTiForm) form;
		int ret = taoTiDAO.insert(taoTiForm);
		System.out.println("返回值ret：" + ret);
		if (ret == 1) {
			return mapping.findForward("taoTiAdd");
		} else if (ret == 2) {
			request.setAttribute("error", "该套题已经添加！");
			return mapping.findForward("error");
		} else {
			request.setAttribute("error", "添加套题失败！");
			return mapping.findForward("error");
		}
	}
	// 添加套题时查询
	private ActionForward taoTiAddQuery(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		request.setAttribute("lessonList",lessonDAO.query(0));	//全部课程列表
		return mapping.findForward("taoTiAddQuery");
	}
	// 修改套题时查询
	private ActionForward taoTiModifyQuery(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		TaoTiForm taoTiForm=(TaoTiForm)((taoTiDAO.query(Integer.parseInt(request.getParameter("id")))).get(0));
		request.setAttribute("taoTiModifyQuery", taoTiForm);
		request.setAttribute("lessonList",lessonDAO.query(0));	//全部课程列表
		return mapping.findForward("taoTiModifyQuery");
	}
	//修改套题
	private ActionForward taoTiModify(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		TaoTiForm taoTiForm = (TaoTiForm) form;
		int ret = taoTiDAO.update(taoTiForm);
		if (ret == 0) {
			request.setAttribute("error", "修改套题失败！");
			return mapping.findForward("error");
		} else {
			return mapping.findForward("taoTiModify");
		}
	}	
	// 删除套题
	private ActionForward taoTiDel(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		TaoTiForm taoTiForm = (TaoTiForm) form;
		int ret = taoTiDAO.delete(taoTiForm);
		if (ret == 0) {
			request.setAttribute("error", "删除套题失败！");
			return mapping.findForward("error");
		} else {
			return mapping.findForward("taoTiDel");
		}
	}
}