package com.spring.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.AbstractController;
import org.springframework.web.servlet.mvc.multiaction.MultiActionController;

import com.hibernate.dao.DAOSupport;
import com.hibernate.model.SystemClassInfo;
import com.hibernate.model.SystemClassInfoList;
import com.hibernate.model.SystemCourseCode;
import com.hibernate.model.SystemGradeCode;
import com.hibernate.model.SystemSpecialtyCode;

public class SystemCodeControl extends MultiActionController {	
	private DAOSupport dao = null;
	private String objName = null; //标识模型名字
	private String viewName = null; //标识视图名字
	public DAOSupport getDao() {
		return dao;
	}
	public void setDao(DAOSupport dao) {
		this.dao = dao;
	}
	private List getClassInfo(){
		String classSql = null;
		classSql = "SELECT cs.classid as classid, cs.classmc as classmc, sp.name as spname, gr.gr_name as grname "
				+ " FROM system_class_info cs, system_specialty_code sp ,system_grade_code gr where cs.sp_code = sp.sp_code  and cs.gr_code = gr.gr_code";

		List classinfo = dao.QueryObjectFromSql(classSql);			
		List classlist = new ArrayList();
		
		for(int i=0;i<classinfo.size();i++){
			SystemClassInfoList clt = new SystemClassInfoList();
			Object[] objcs = (Object[])classinfo.get(i);
			clt.setClassid(objcs[0].toString());
			clt.setClassmc(objcs[1].toString());
			clt.setGrname(objcs[2].toString());
			clt.setSpname(objcs[3].toString());		
			classlist.add(clt);			
		}
		return classlist;
	}
	/************************************
	 * 功能：用于显示代码表中的全部数据
	 * 实现：通过request请求参数中的name值来进行
	 *      判断是哪个代码表
	 ************************************/
	public ModelAndView CodeList(HttpServletRequest request,HttpServletResponse response) throws Exception{
		String name = request.getParameter("name");
		System.out.println("namesss:" + name);
		List listObject = null;
		Map mapMessages = new HashMap();
		if (name.equals("sp")){
			listObject = dao.QueryObject(" from SystemSpecialtyCode");
			viewName = "systemview/sys_code_sp";
		}else if(name.equals("gr")){
			listObject = dao.QueryObject(" from SystemGradeCode");
			viewName = "systemview/sys_code_grade";
		}else if(name.equals("cl")){ 
			//获得班级对应的控制器文件		
			Map maps = new HashMap();
			List gradeList = dao.QueryObject("from SystemGradeCode");
			List specList = dao.QueryObject("from SystemSpecialtyCode");			
			maps.put("grade",gradeList);
			maps.put("spec",specList);
			maps.put("classinfo",getClassInfo());
			viewName = "systemview/sys_code_class";
			return new ModelAndView(this.viewName,"messages",maps);		
			
		}else if(name.equals("sb")){
			listObject = dao.QueryObject(" from SystemCourseCode");
			viewName = "systemview/sys_code_subject";
		}
		mapMessages.put("listObject", listObject);
		return new ModelAndView(this.viewName,mapMessages);
	}
	
	/************************************
	 * 功能：用于显示代码表中的全部数据
	 * 实现：通过request请求参数中的name值来进行
	 *      判断是哪个代码表
	 ************************************/
	public ModelAndView CodeQuery(HttpServletRequest request,HttpServletResponse response) throws Exception{
		String name = request.getParameter("name");
		String id = request.getParameter("code");		
		System.out.println("name:" + name + "id:" + id);
		List listObject = null;
		if (name.equals("sp")){
			listObject = dao.QueryObject(" from SystemSpecialtyCode where spCode ='" + id + "'");
			viewName = "systemview/sys_code_sp";
		}else if(name.equals("gr")){
			listObject = dao.QueryObject(" from SystemGradeCode");
			viewName = "systemview/sys_code_grade";
		}else if(name.equals("cl")){
			listObject = dao.QueryObject(" from SystemClassInfo");
			viewName = "systemview/sys_code_class";
		}else if(name.equals("sb")){
			listObject = dao.QueryObject(" from SystemCourseCode");
			viewName = "systemview/sys_code_subject";
		}			
		return new ModelAndView(this.viewName,"objInf",listObject);
	}
	
	/************************************
	 * 功能：用于显示代码表中的全部数据
	 * 实现：通过request请求参数中的name值来进行
	 *      判断是哪个代码表
	 ************************************/
	public ModelAndView CodeDel(HttpServletRequest request,HttpServletResponse response) throws Exception{
		String name = request.getParameter("name");
		String id = request.getParameter("code");
		System.out.println("name:" + name + ";igggd:" + id);
		List listObject = null;
		Map mapMessages = new HashMap();
		boolean flag = false ;
		
		if (name.equals("sp")){
			List listObj = dao.QueryObject(" from SystemSpecialtyCode where spCode ='" + id + "'");
			SystemSpecialtyCode object = (SystemSpecialtyCode)listObj.get(0);
			//flag = dao.DeleteObject(object);
			String sql = "from SystemSpecialtyCode where spCode ='" + id + "'";
			flag = dao.DeleteObject(sql);
			listObject = dao.QueryObject("from SystemSpecialtyCode");		
			viewName = "systemview/sys_code_sp";
		}else if(name.equals("gr")){
			List listObj = dao.QueryObject(" from SystemGradeCode where grCode ='" + id + "'");
			SystemGradeCode object = (SystemGradeCode)listObj.get(0);
			flag = dao.DeleteObject(object);
			listObject = dao.QueryObject(" from SystemGradeCode");
			mapMessages.put("listObject", listObject);			
			viewName = "systemview/sys_code_grade";
		}else if(name.equals("cl")){
			List listObj = dao.QueryObject(" from SystemClassInfo where classid ='" + id + "'");
			SystemClassInfo object = (SystemClassInfo)listObj.get(0);
			System.out.println("object:" + object);
			flag = dao.DeleteObject(object);			
			List gradeList = dao.QueryObject("from SystemGradeCode");
			List specList = dao.QueryObject("from SystemSpecialtyCode");			
			
			listObject = getClassInfo(); //获得班级对象信息			
			viewName = "systemview/sys_code_class";
			Map mapMessage = new HashMap();	
			mapMessage.put("classinfo",listObject);
			mapMessage.put("grade",gradeList);
			mapMessage.put("spec",specList);			
			if (flag){
				mapMessage.put("msgError", "");
			}else{				
				mapMessage.put("msgError", "系统提示:数据已经使用不能删除");				
			}
			return new ModelAndView(viewName,"messages",mapMessage);
		}else if(name.equals("sb")){
			List listObj = dao.QueryObject(" from SystemCourseCode where code ='" + id + "'");
			SystemCourseCode object = (SystemCourseCode)listObj.get(0);		
			flag = dao.DeleteObject(object);
			listObject = dao.QueryObject(" from SystemCourseCode");
			viewName = "systemview/sys_code_subject";
		}	
		mapMessages.put("listObject", listObject);
		if (flag){
			mapMessages.put("msgError", "");
		}else{				
			mapMessages.put("msgError", "系统提示:数据已经使用不能删除");				
		}
		return new ModelAndView(this.viewName,mapMessages);
	}
}
