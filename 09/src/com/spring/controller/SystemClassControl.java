package com.spring.controller;

import java.util.AbstractList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.ArrayList;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

import com.hibernate.dao.DAOSupport;
import com.hibernate.model.SystemClassInfo;
import com.hibernate.model.SystemGradeCode;
import com.hibernate.model.SystemSpecialtyCode;
import com.hibernate.model.SystemClassInfoList;

public class SystemClassControl implements Controller {
	private DAOSupport dao = null;
	private String pageView = null;

	public DAOSupport getDao() {
		return dao;
	}

	public String getPageView() {
		return pageView;
	}

	public void setPageView(String pageView) {
		this.pageView = pageView;
	}

	public void setDao(DAOSupport dao) {
		this.dao = dao;
	}

	public ModelAndView handleRequest(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		
		request.setCharacterEncoding("gb2312");		
		String name = request.getParameter("classname");		
		
		SystemClassInfo objclass = new SystemClassInfo();		
		String spcode = request.getParameter("hiddspcode");
		String grcode = request.getParameter("hiddgrcode");
		String newclassid = null;		 
		List maxclass = dao.QueryObject("select max(classid) from SystemClassInfo sci where sci.systemSpecialtyCode.spCode = " + spcode + " and sci.systemGradeCode.grCode =" + grcode);
		Object maxobj = maxclass.get(0);
		if (maxobj==null) {
			newclassid = spcode + grcode + "01";
		} else {
			String a1 = maxobj.toString();
			int aa = Integer.parseInt(a1.substring(a1.length() - 2)) + 1;
			if(aa > 9){
				newclassid = (spcode + grcode + aa) + "";
			}else{
				newclassid = (spcode + grcode + "0" + aa) + "";
			}			
		}	
		objclass.setClassmc(name);
		SystemSpecialtyCode spcodeobject = new SystemSpecialtyCode();
		spcodeobject.setSpCode(request.getParameter("hiddspcode"));
		SystemGradeCode grcodeobject = new SystemGradeCode();
		grcodeobject.setGrCode(request.getParameter("hiddgrcode"));
		
		objclass.setSystemGradeCode(grcodeobject);
		objclass.setSystemSpecialtyCode(spcodeobject);
		
		objclass.setClassid(newclassid);
		dao.InsertOrUpdate(objclass);
		Map mapMessage = new HashMap();				
		List gradeList = dao.QueryObject("from SystemGradeCode");
		List specList = dao.QueryObject("from SystemSpecialtyCode");
		String classSql = null;
		classSql = "SELECT cs.classid as classid, cs.classmc as classmc, sp.name as spname, gr.gr_name as grname " + 
" FROM system_class_info cs, system_specialty_code sp ,system_grade_code gr where cs.sp_code = sp.sp_code  and cs.gr_code = gr.gr_code";
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
	    mapMessage.put("classinfo",classlist);
		mapMessage.put("grade",gradeList);
		mapMessage.put("spec",specList);		
		return new ModelAndView(this.getPageView(),"messages",mapMessage);
	}
}
