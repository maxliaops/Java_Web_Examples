package com.spring.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.validation.BindException;
import org.springframework.web.bind.ServletRequestDataBinder;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.SimpleFormController;

import com.hibernate.dao.DAOSupport;
import com.hibernate.model.DocuTeaInfo;
import com.hibernate.model.SystemSpecialtyCode;

public class TeaInfoController extends SimpleFormController {
	private DAOSupport dao;

	public TeaInfoController() {
		setCommandClass(DocuTeaInfo.class);
	}

	protected ModelAndView onSubmit(HttpServletRequest request,
			HttpServletResponse response, Object command, BindException errors)
			throws Exception {
		System.out.println("run");
		List list = null;
		String maxId = null;
		String skzy = request.getParameter("skzy");
		SystemSpecialtyCode code = new SystemSpecialtyCode(skzy);
		DocuTeaInfo form = (DocuTeaInfo) command;
		System.out.println("gzjj" + form.getGzjj());
		
		if (form.getGzjj().equals("")){
			form.setGzjj(null);
			System.out.println("nullnullnull");
		}
		form.setSystemSpecialtyCode(code);
		list = dao.QueryObject("from DocuTeaInfo where sfzh='" + form.getSfzh()
				+ "'");
		boolean haveTea = list.size() > 0 ? list.get(0) == null ? false : true
				: false;
		if (haveTea && form.getTeaId() == null) {// 如果form中不包含teaId说明是录入请求
			list = dao.QueryObject("from SystemSpecialtyCode");
			Map model = new HashMap();
			model.put("list", list);
			model.put("alert", "身份证“" + form.getSfzh() + "”以经存在");
			return new ModelAndView(getSuccessView(), model);
		} else if (haveTea && form.getTeaId() != null) {// 如果form中包含teaId说明是修改请求
			dao.InsertOrUpdate(form);
			list = dao.QueryObject("from DocuTeaInfo");
			Map model = new HashMap();
			model.put("list", list);
			return new ModelAndView("/docuview/teaDocuService", model);
		}
		list = dao.QueryObject("select max(teaId) from DocuTeaInfo where "
				+ "systemSpecialtyCode.spCode='"
				+ form.getSystemSpecialtyCode().getSpCode() + "'");
		if (list.get(0) != null) {
			maxId = list.get(0) + "";
		}
		if (maxId != null) {
			int id = Integer.parseInt(maxId.substring(maxId.length() - 2)) + 1;
			String sid = id + "";
			if (id < 10)
				sid = "0" + sid;
			maxId = form.getSystemSpecialtyCode().getSpCode() + sid;
		} else {
			maxId = form.getSystemSpecialtyCode().getSpCode() + "01";
		}
		form.setTeaId(maxId);
		dao.InsertOrUpdate(form);
		list = dao.QueryObject("from SystemSpecialtyCode");
		Map model = new HashMap();
		model.put("list", list);
		model.put("info", form);
		return new ModelAndView(getSuccessView(), model);
	}

	protected void initBinder(HttpServletRequest arg0,
			ServletRequestDataBinder binder) throws Exception {
		// SimpleDateFormat df = (SimpleDateFormat)
		// DateFormat.getDateInstance();
		// df.applyPattern("yyyy-mm-dd");
		binder
				.registerCustomEditor(java.sql.Date.class, null,
						new DateEditor());
		arg0.setCharacterEncoding("gbk");
		System.out.println("init End");
	}

	public DAOSupport getDao() {
		return dao;
	}

	public void setDao(DAOSupport dao) {
		this.dao = dao;
	}
}
