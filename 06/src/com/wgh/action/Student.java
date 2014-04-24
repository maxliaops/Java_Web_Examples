package com.wgh.action;

import java.util.*;

import javax.servlet.http.*;
import org.apache.struts.action.*;

import antlr.collections.List;

import com.wgh.actionForm.StudentForm;
import com.wgh.actionForm.TaoTiForm;
import com.wgh.dao.StudentDAO;

public class Student extends Action {
	private StudentDAO studentDAO = null;

	public Student() {
		this.studentDAO = new StudentDAO();
	}

	public ActionForward execute(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		String action = request.getParameter("action");
		System.out.println("获取的查询字符串：" + action);
		if ("studentQuery".equals(action)) {
			return studentQuery(mapping, form, request, response);
		} else if ("login".equals(action)) {
			return studentLogin(mapping, form, request, response);
		} else if ("studentAdd".equals(action)) {
			return studentAdd(mapping, form, request, response);
		} else if ("studentDel".equals(action)) {
			return studentDel(mapping, form, request, response);
		} else if ("modifyQuery".equals(action)) {
			return modifyQuery(mapping, form, request, response);
		} else if ("studentModify".equals(action)) {
			return studentModify(mapping, form, request, response);
		}else if("seekPwd1".equals(action)){
			return seekPwd1(mapping,form,request,response);
		}else if("seekPwd2".equals(action)){
			return seekPwd2(mapping,form,request,response);
		}else{
			request.setAttribute("error","您的操作有误！");		//将错误信息保存到error中
			return mapping.findForward("error");				//转到显示错误信息的页面
		}
	}

	// 考生身份验证
	public ActionForward studentLogin(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		StudentForm studentForm = (StudentForm) form;
		int ret = studentDAO.checkStudent(studentForm);
		System.out.print("验证结果ret的值:" + ret);
		if (ret == 2) {
			request.setAttribute("error", "您输入的考生准考证号码或密码错误！");
			return mapping.findForward("error");
		} else {
			HttpSession session = request.getSession();
			session.setAttribute("student", studentForm.getID());
			return mapping.findForward("studentLoginok");
		}
	}

	// 查询考生信息
	private ActionForward studentQuery(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		request.setAttribute("studentQuery", studentDAO.query(null));
		return mapping.findForward("studentQuery");
	}

	// 添加考生注册信息
	private ActionForward studentAdd(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		StudentForm studentForm = (StudentForm) form;
		String ret = studentDAO.insert(studentForm);
		System.out.println("返回值ret：" + ret);
		if (ret.equals("re")) {
			request.setAttribute("error", "您已经注册，直接登录即可！");
			return mapping.findForward("error");
		} else if(ret.equals("miss")){
			request.setAttribute("error", "注册失败！");
			return mapping.findForward("error");
		}else{
			request.setAttribute("ret",ret);
			return mapping.findForward("studentAdd");
		}
	}

	// 修改考生信息时查询
	private ActionForward modifyQuery(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		System.out.println("获取的ID："+request.getParameter("ID"));
		StudentForm studentForm=(StudentForm)(studentDAO.query(request.getParameter("ID")).get(0));
		System.out.println("从Bean中获取的ID："+studentForm.getID());
		request.setAttribute("modifyQuery", studentForm);
		return mapping.findForward("modifyQuery");
	}
//找回密码（第一步）
	private ActionForward seekPwd1(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response){
		StudentForm studentForm = (StudentForm) form;
		StudentForm s=studentDAO.seekPwd1(studentForm);
		request.setAttribute("seekPwd2", s);
		if(s.getID().equals("")){
			request.setAttribute("error", "您输入的准考证号不存在！");
			return mapping.findForward("error");
		}else{
			return mapping.findForward("seekPwd1");	
		}
	}
//	找回密码（第二步）
	private ActionForward seekPwd2(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response){
		StudentForm studentForm = (StudentForm) form;
		StudentForm s=studentDAO.seekPwd2(studentForm);
		request.setAttribute("seekPwd3", s);
		if(s.getID().equals("")){
			request.setAttribute("error", "您输入的密码提示问题的答案不正确！");
			return mapping.findForward("error");
		}else{
			return mapping.findForward("seekPwd2");
		}
	}
	// 修改考生信息
	private ActionForward studentModify(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		StudentForm studentForm = (StudentForm) form;
		int ret = studentDAO.update(studentForm);
		if (ret == 0) {
			request.setAttribute("error", "修改考生信息失败！");
			return mapping.findForward("error");
		} else {
			return mapping.findForward("studentModify");
		}
	}

	// 删除考生信息
	private ActionForward studentDel(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		StudentForm studentForm = (StudentForm) form;
		int ret = studentDAO.delete(studentForm);
		if (ret == 0) {
			request.setAttribute("error", "删除考生信息失败！");
			return mapping.findForward("error");
		} else {
			return mapping.findForward("studentDel");
		}
	}
}