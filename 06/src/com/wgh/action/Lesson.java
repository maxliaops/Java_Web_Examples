package com.wgh.action;

import java.util.List;

import javax.servlet.http.*;

import org.apache.struts.action.*;
import com.wgh.actionForm.LessonForm;
import com.wgh.dao.LessonDAO;

public class Lesson extends Action {
	private LessonDAO lessonDAO = null;

	public Lesson() {
		this.lessonDAO = new LessonDAO();
	}
	public ActionForward execute(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		String action = request.getParameter("action");
		System.out.println("获取的查询字符串：" + action);
		if (action == null || "".equals(action)) {
			return mapping.findForward("error");
		} else if ("lessonQuery".equals(action)) {
			return lessonQuery(mapping, form, request, response);

		} else if ("lessonAdd".equals(action)) {
			return lessonAdd(mapping, form, request, response);
		} else if ("lessonDel".equals(action)) {
			return lessonDel(mapping, form, request, response);
		}else if("selectLesson".equals(action)){
			return selectLesson(mapping, form, request, response);
		}else if("ready".equals(action)){
			return ready(mapping, form, request, response);
		}
		request.setAttribute("error", "操作失败！");
		return mapping.findForward("error");
	}

	// 查询课程信息
	private ActionForward lessonQuery(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		request.setAttribute("lessonQuery", lessonDAO.query(0));
		return mapping.findForward("lessonQuery");
	}

	// 添加课程
	private ActionForward lessonAdd(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		LessonForm lessonForm = (LessonForm) form;
		int ret = lessonDAO.insert(lessonForm);
		System.out.println("返回值ret：" + ret);
		if (ret == 1) {
			return mapping.findForward("lessonAdd");
		} else if (ret == 2) {
			request.setAttribute("error", "该课程已经添加！");
			return mapping.findForward("error");
		} else {
			request.setAttribute("error", "添加课程失败！");
			return mapping.findForward("error");
		}
	}
	// 删除课程
	private ActionForward lessonDel(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		LessonForm lessonForm = (LessonForm) form;
		int ret = lessonDAO.delete(lessonForm);
		if (ret == 0) {
			request.setAttribute("error", "删除课程失败！");
			return mapping.findForward("error");
		} else {
			return mapping.findForward("lessonDel");
		}
	}
	//在线考试时选择课程
	private ActionForward selectLesson(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) { 
		HttpSession session = request.getSession();
		String stu=session.getAttribute("student").toString();	//获取准考证号
		List list=lessonDAO.query(stu);	//查询包括考试题目的课程列表，但不包括已经考过的科目
		if(list.size()<1){
			return mapping.findForward("noenLesson");
		}else{
			request.setAttribute("lessonList",list);
			return mapping.findForward("selectLesson");
		}
	}
	//准备考试
	private ActionForward ready(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) { 
		LessonForm lessonForm = (LessonForm) form;
		System.out.println("课程ID："+lessonForm.getID()+lessonForm.getName());
		HttpSession session = request.getSession();
		session.setAttribute("lessonID",String.valueOf(lessonForm.getID()));	//查询选择的课程ID
		return mapping.findForward("ready");
	}	
}