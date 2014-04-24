package com.spring.controller;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.validation.BindException;
import org.springframework.web.bind.ServletRequestDataBinder;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.SimpleFormController;

import com.hibernate.dao.DAOSupport;
import com.hibernate.model.SystemCourseCode;
import com.hibernate.model.SystemGradeCode;
import com.hibernate.model.SystemSpecialtyCode;

public class SysCodeForm extends SimpleFormController {	
	private DAOSupport dao = null;
	
	public DAOSupport getDao() {
		return dao;
	}
	public void setDao(DAOSupport dao) {
		this.dao = dao;
	}
	protected ModelAndView onSubmit(HttpServletRequest request, HttpServletResponse reponse, Object obj, BindException arg3) throws Exception {
		String objName = request.getParameter("objname");
		String viewPage = null;
		System.out.println("objName= " + objName);
		if (objName.equals("SystemSpecialtyCode")){
			SystemSpecialtyCode objhiber = (SystemSpecialtyCode) obj;
			viewPage = "sys_code_sp";
			dao.InsertOrUpdate(objhiber);			
		}else if(objName.equals("SystemGradeCode")){
			SystemGradeCode objhiber = (SystemGradeCode) obj;
			viewPage = "sys_code_grade";
			dao.InsertOrUpdate(objhiber);
		}else if(objName.equals("SystemCourseCode")){
			SystemCourseCode objhiber = (SystemCourseCode)obj;
			viewPage = "sys_code_subject";
			dao.InsertOrUpdate(objhiber);
		}
		List spList = dao.QueryObject("from " + objName);
		
		return new ModelAndView("systemview/" + viewPage, "listObject", spList);
		
		
	}
	protected Object formBackingObject(HttpServletRequest request)	throws Exception {
		request.setCharacterEncoding("gb2312");//在这里设置字符集
		String className = request.getParameter("objname");		
		if (className.equals("SystemSpecialtyCode")) {
			this.setCommandClass(SystemSpecialtyCode.class);
		 }else if (className.equals("SystemGradeCode")) {
			 this.setCommandClass(SystemGradeCode.class);
		 }else if(className.equals("SystemCourseCode")){
			 this.setCommandClass(SystemCourseCode.class);
		 }
		return super.formBackingObject(request);
	}	
}


