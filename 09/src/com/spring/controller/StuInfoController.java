package com.spring.controller;


import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.validation.BindException;
import org.springframework.web.bind.ServletRequestDataBinder;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.SimpleFormController;
import org.springframework.web.servlet.view.RedirectView;

import com.hibernate.dao.DAOSupport;
import com.hibernate.model.DocuStuInfo;
import com.hibernate.model.DocuStuRegister;
import com.hibernate.model.SystemClassInfo;


public class StuInfoController extends SimpleFormController{	
	private DAOSupport dao = null;
		
	protected Object formBackingObject(HttpServletRequest request) throws Exception {
		request.setCharacterEncoding("gb2312");//在这里设置字符集
		String cname = request.getParameter("ctname");
		if (cname.equals("dsi")||cname=="dsi"){
			this.setCommandClass(DocuStuInfo.class);	
		}else if(cname.equals("dsim")||cname=="dsim"){
			this.setCommandClass(DocuStuInfo.class);
		}else if(cname.equals("dsg")||cname == "dsg"){
			this.setCommandClass(DocuStuRegister.class);			
		}
		return super.formBackingObject(request);
	}
	
	protected void initBinder(HttpServletRequest request, ServletRequestDataBinder response) throws Exception {
		response.registerCustomEditor(java.sql.Date.class, null,
				new DateEditor());		
	}	
	
	protected ModelAndView onSubmit(HttpServletRequest request, HttpServletResponse reponse, Object obj, BindException arg3)
			throws Exception {		
		String viewPage = "";
		HashMap msg = new HashMap();
		String cname = request.getParameter("ctname");
		if (cname.equals("dsi")||cname=="dsi"){
			DocuStuInfo stuform =(DocuStuInfo)obj;
			dao.InsertOrUpdate(stuform);
			viewPage = "docuview/doc_stuinfo_input";
			setFormView(viewPage);
			List classlist = dao.QueryObject(" From SystemClassInfo");      
			msg.put("classinfo", classlist);
			msg.put("msg", "学生基本信息数据录入成功!!!");
		}else if(cname.equals("dsim")||cname=="dsim"){
			DocuStuInfo stuform =(DocuStuInfo)obj;
			dao.InsertOrUpdate(stuform);
			return new ModelAndView(new RedirectView("listStuModi.htm"));
		}else if (cname.equals("dsg")||cname == "dsg"){
			viewPage = "docuview/doc_stuinfo_reg";
			setFormView(viewPage);
			List stuRegList = dao.QueryObject("From DocuStuRegister dsr where dsr.docuStuInfo.stuId = '" + request.getParameter("stu_id") + "'");
			if(!stuRegList.isEmpty()){
				msg.put("msg", "该学生已经登记,请重新选择!!!");
				return new ModelAndView(viewPage,"messages",msg);
			}
			DocuStuRegister stuRegForm = (DocuStuRegister)obj;
			DocuStuInfo docuStuInfo = new DocuStuInfo();
			docuStuInfo.setStuId(request.getParameter("stu_id"));
			stuRegForm.setDocuStuInfo(docuStuInfo);
			SystemClassInfo systemClassInfo = new SystemClassInfo();
			systemClassInfo.setClassid(request.getParameter("classid"));
			stuRegForm.setSystemClassInfo(systemClassInfo);
			dao.InsertOrUpdate(stuRegForm);			
			msg.put("msg", "学生登记信息数据录入成功!!!");						
		} 
		return new ModelAndView(viewPage,"messages",msg);
	}
	public DAOSupport getDao() {
		return dao;
	}
	public void setDao(DAOSupport dao) {
		this.dao = dao;
	}
}
