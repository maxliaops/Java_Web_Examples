package com.spring.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.multiaction.MultiActionController;

import com.hibernate.dao.DAOSupport;
import com.hibernate.model.DocuTeaInfo;

public class TeaLoader extends MultiActionController {
	private DAOSupport dao;

	public ModelAndView reg(HttpServletRequest req, HttpServletResponse res) {
		List list = dao.QueryObject("from SystemSpecialtyCode");
		Map model = new HashMap();
		model.put("list", list);
		return new ModelAndView("/docuview/doc_tea_info_reg", model);
	}

	public ModelAndView service(HttpServletRequest req, HttpServletResponse res) {
		String teaId = req.getParameter("teaId");
		System.out.println("teaId:" + teaId);
		if (teaId == null) {
			List list = dao.QueryObject("from DocuTeaInfo");
			Map model = new HashMap();
			model.put("list", list);
			return new ModelAndView("/docuview/teaDocuService", model);
		} else {
			List list = dao.QueryObject("from DocuTeaInfo where teaId=" + teaId);
			DocuTeaInfo doc = (DocuTeaInfo) list.get(0);
			list = dao.QueryObject("from SystemSpecialtyCode");
			Map model = new HashMap();
			model.put("doc", doc);
			model.put("list", list);
			return new ModelAndView("/docuview/teaDocuModify", model);
		}
	}

	public ModelAndView search(HttpServletRequest req, HttpServletResponse res) {
		String condition = req.getParameter("condition");
		String conditionContent = req.getParameter("conditionContent");
		if (condition.equals("姓名")) {
			condition = "name";
		} else if (condition.equals("身份证")) {
			condition = "sfzh";
		} else {
			condition = "teaId";
		}
		List list = dao.QueryObject("from DocuTeaInfo where "+condition+" like '"+conditionContent+"%'");
		Map model = new HashMap();
		model.put("list", list);
		return new ModelAndView("/docuview/teaDocuService", model);
	}

	public DAOSupport getDao() {
		return dao;
	}

	public void setDao(DAOSupport dao) {
		this.dao = dao;
	}

	protected ModelAndView handleRequestInternal(HttpServletRequest req, HttpServletResponse res) throws Exception {
		req.setCharacterEncoding("gbk");
		return super.handleRequestInternal(req, res);
	}

}
