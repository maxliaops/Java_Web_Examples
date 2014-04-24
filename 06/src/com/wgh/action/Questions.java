package com.wgh.action;

import javax.servlet.http.*;

import org.apache.struts.action.*;

import com.wgh.actionForm.QuestionsForm;
import com.wgh.actionForm.TaoTiForm;
import com.wgh.core.ChStr;
import com.wgh.dao.LessonDAO;
import com.wgh.dao.QuestionsDAO;
import com.wgh.dao.TaoTiDAO;

public class Questions extends Action {
	private QuestionsDAO questionsDAO = null;
	private LessonDAO lessonDAO=null;
	private TaoTiDAO taoTiDAO=null;

	public Questions() {
		this.questionsDAO = new QuestionsDAO();
		this.lessonDAO=new LessonDAO();
		this.taoTiDAO=new TaoTiDAO();
	}
	public ActionForward execute(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		String action = request.getParameter("action");
		System.out.println("获取的查询字符串：" + action);
		if ("questionsQuery".equals(action)) {
			return questionsQuery(mapping, form, request, response);
		}else if("questionsAddQuery".equals(action)){
			return questionsAddQuery(mapping,form,request,response);			
		} else if ("questionsAdd".equals(action)) {
			return questionsAdd(mapping, form, request, response);
		} else if ("questionsDel".equals(action)) {
			return questionsDel(mapping, form, request, response);
		}else if("questionsModifyQuery".equals(action)){
			return questionsModifyQuery(mapping,form,request,response);
		}else if("questionsModify".equals(action)){
			return questionsModify(mapping,form,request,response);
		}else if("queryTaoTi".equals(action)){
			return queryTaoTi(mapping,form,request,response);
		}else{
			request.setAttribute("error", "操作失败！");
			return mapping.findForward("error");
		}
	}

	// 查询考试题目信息
	private ActionForward questionsQuery(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		request.setAttribute("questionsQuery", questionsDAO.query(0));
		return mapping.findForward("questionsQuery");
	}

	// 添加考试题目
	private ActionForward questionsAdd(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		QuestionsForm questionsForm = (QuestionsForm) form;
		int ret = questionsDAO.insert(questionsForm);
		if (ret == 1) {
			return mapping.findForward("questionsAdd");
		} else if (ret == 2) {
			request.setAttribute("error", "该考试题目已经添加！");
			return mapping.findForward("error");
		} else {
			request.setAttribute("error", "添加考试题目失败！");
			return mapping.findForward("error");
		}
	}
	// 添加考试题目时查询
	private ActionForward questionsAddQuery(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		request.setAttribute("lessonList",lessonDAO.query(-1));	//全部包括套题的课程列表
		return mapping.findForward("questionsAddQuery");
	}
	
	//根据课程查询套题ajax
	private ActionForward queryTaoTi(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		request.setAttribute("taoTiList",taoTiDAO.queryTaoTi(Integer.parseInt(request.getParameter("id"))));	//查询指定课程的套题列表
		return mapping.findForward("queryTaoTi");
	}	
	// 修改考试题目时的查询
	private ActionForward questionsModifyQuery(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		QuestionsForm questionsForm=(QuestionsForm)((questionsDAO.query(Integer.parseInt(request.getParameter("id")))).get(0));
		request.setAttribute("questionsModifyQuery", questionsForm);
		return mapping.findForward("questionsModifyQuery");
	}
	//修改考试题目
	private ActionForward questionsModify(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		QuestionsForm questionsForm = (QuestionsForm) form;
		int ret = questionsDAO.update(questionsForm);
		if (ret == 0) {
			request.setAttribute("error", "修改考试题目失败！");
			return mapping.findForward("error");
		} else {
			return mapping.findForward("questionsModify");
		}
	}	
	// 删除考试题目
	private ActionForward questionsDel(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		QuestionsForm questionsForm = (QuestionsForm) form;
		int ret = questionsDAO.delete(questionsForm);
		if (ret == 0) {
			request.setAttribute("error", "删除考试题目失败！");
			return mapping.findForward("error");
		} else {
			return mapping.findForward("questionsDel");
		}
	}
}