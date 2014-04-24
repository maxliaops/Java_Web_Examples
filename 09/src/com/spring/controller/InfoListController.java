package com.spring.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.multiaction.MultiActionController;

import com.hibernate.dao.DAOSupport;
import com.hibernate.model.CourseStuInfo;
import com.hibernate.model.DocuStuInfo;
import com.hibernate.model.SystemClassInfoList;

public class InfoListController extends MultiActionController {
	private DAOSupport dao = null;
	public DAOSupport getDao() {
		return dao;
	}
	public void setDao(DAOSupport dao) {
		this.dao = dao;
	}
	public ModelAndView listStuReg(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		String stuID = request.getParameter("stuid");
		List stuinfolist = dao.QueryObject("From DocuStuInfo where stuId = '"
				+ stuID + "'");
		if (stuinfolist.isEmpty()) {
			return new ModelAndView("docuview/doc_stuinfo_reg", "sysMsgInf",
					"<script language='javascript'>alert('学生编号不存在,请重新输入!!!')</script>");
		}
		DocuStuInfo stuinfo = (DocuStuInfo) stuinfolist.get(0);
		String classId = stuinfo.getStuId().substring(0, 6);

		String sp_code = stuinfo.getStuId().substring(0, 2);
		List classmc = dao
				.QueryObjectFromSql("select  classmc from system_class_info where classid = '"
						+ classId + "'");
		List zymc = dao
				.QueryObjectFromSql("select name from system_specialty_code where sp_code = '"
						+ sp_code + "'");
		java.sql.Date djrq = new java.sql.Date(System.currentTimeMillis());

		java.util.Map mapStuinf = new java.util.HashMap();
		mapStuinf.put("lsh", String.valueOf(System.currentTimeMillis()));
		mapStuinf.put("stuId", stuinfo.getStuId());
		mapStuinf.put("name", stuinfo.getName());
		mapStuinf.put("classid", classId);
		mapStuinf.put("classmc", classmc.get(0));
		mapStuinf.put("zymc", zymc.get(0));
		mapStuinf.put("djrq", djrq);

		return new ModelAndView("docuview/doc_stuinfo_reg", "messages",
				mapStuinf);
	}
	public ModelAndView listStuRegSerach(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("GBK");
		String propName = request.getParameter("select1");
		String conName = request.getParameter("select2");
		String strValue = request.getParameter("strvalue");

		Map map = new HashMap();
		map.put("conName", conName);
		map.put("propName", propName);
		map.put("strValue", strValue);
		if (conName.equals("DY"))
			conName = ">";
		if (conName.equals("XY"))
			conName = "<";
		if (conName.equals("DEY"))
			conName = "=";

		String sqlSelect = null, fromStr = null, whereStr = null;
		String selectStr = "select dsi.stuId,dsi.name,dsi.sfzhm,dsi.csrq,dsr.djrq,dsr.lqfs,dsr.jbr ";

		if (propName.equals("stuId")) {
			fromStr = "from DocuStuRegister dsr where dsr.docuStuInfo.stuId ";
		} else {
			fromStr = "from DocuStuRegister dsr where dsr." + propName;
		}
		whereStr = conName + "'" + strValue + "'";
		sqlSelect = fromStr + whereStr;
		List msgList = dao.QueryObject(sqlSelect);
		if (msgList.isEmpty()) {
			map.put("messages", null);
			map.put("msg", "系统提示：没有找到满足条件的数据!!");
			return new ModelAndView("docuview/doc_stuinfo_reglist", map);
		} else {
			map.put("messages", msgList);
			map.put("msg", null);
			return new ModelAndView("docuview/doc_stuinfo_reglist", map);
		}
	}
	public ModelAndView listAllStu(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		System.out.println("listAllStu方法执行");
		List stuList = dao.QueryObject("from DocuStuInfo");
		System.out.println("学生数量：" + stuList.size());

		return new ModelAndView("docuview/doc_stuinfo_reglist", "messages",
				stuList);
	}
	public ModelAndView listStuModi(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("GBK");
		String conStr = request.getParameter("select");
		String sValue = request.getParameter("strvalue");
		if (sValue == null) {
			conStr = "stuId";
			sValue = "";
		}
		List stuList = dao.QueryObject("from DocuStuInfo where " + conStr
				+ " like '" + sValue + "%'");
		Map model = new HashMap();
		model.put("messages", stuList);
		model.put("selectStr", conStr);
		model.put("conValue", sValue);
		return new ModelAndView("docuview/doc_stuinfo_modify", model);
	}
	public ModelAndView listStuModiSave(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		String id = request.getParameter("id");
		// System.out.println("修改方法中的id:" + id);
		// String sqlxxx = "from DocuStuRegister dsg where dsg.docuStuInfo
		// >'01010101'";
		// dao.DeleteObject(sqlxxx);

		List stuList = dao.QueryObject("from DocuStuInfo where stuId = '" + id
				+ "'");
		DocuStuInfo stuinfo = (DocuStuInfo) stuList.get(0);
		Iterator aa = stuinfo.getCourseStu().iterator();
		while (aa.hasNext()) {
			CourseStuInfo cour = (CourseStuInfo) aa.next();
			System.out.println("ExamDate:" + cour.getExamDate());
			System.out.println("grade:" + cour.getGrade());

		}
		return new ModelAndView("docuview/doc_stuinfo_modify_save", "messages",
				(DocuStuInfo) stuList.get(0));
	}
	public ModelAndView listClass(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		String name = request.getParameter("name");
		// 获得班级所有信息
		if (name.equals("csl") || name == "csl") {
			String classSql = null;
			classSql = "SELECT cs.classid as classid, cs.classmc as classmc, sp.name as spname, gr.gr_name as grname "
					+ " FROM system_class_info cs, system_specialty_code sp ,system_grade_code gr where cs.sp_code = sp.sp_code  and cs.gr_code = gr.gr_code";
			List classinfo = dao.QueryObjectFromSql(classSql);
			List classlist = new ArrayList();
			for (int i = 0; i < classinfo.size(); i++) {
				SystemClassInfoList clt = new SystemClassInfoList();
				Object[] objcs = (Object[]) classinfo.get(i);
				clt.setClassid(objcs[0].toString());
				clt.setClassmc(objcs[1].toString());
				clt.setGrname(objcs[2].toString());
				clt.setSpname(objcs[3].toString());
				classlist.add(clt);
			}
			return new ModelAndView("docuview/doc_class_info", "classinfo",
					classlist);
			// 获得班级名称信息
		} else if (name.equals("cs2") || name == "cs2") {
			List classlist = dao.QueryObject(" From SystemClassInfo");
			String newstuid = "";
			Map map = new HashMap();
			map.put("classinfo", classlist);
			map.put("newstuid", newstuid);
			return new ModelAndView("docuview/doc_stuinfo_input", "messages",
					map);
		} else {
			return null;
		}
	}

	public ModelAndView createID(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		String id = null, newstuid = null;
		id = request.getParameter("id");
		String sqlStr = "SELECT MAX(stu_id) FROM docu_stu_info WHERE (LEFT(stu_id, 6) = '"
				+ id + "')";
		List stuid = dao.QueryObjectFromSql(sqlStr);
		Object maxobj = stuid.get(0);
		if (maxobj == null) {
			newstuid = id + "01";
		} else {
			String a1 = maxobj.toString();
			int aa = Integer.parseInt(a1.substring(a1.length() - 2)) + 1;
			if (aa > 9) {
				newstuid = (id.substring(0, 6) + aa) + "";
			} else {
				newstuid = (id.substring(0, 6) + "0" + aa) + "";
			}
		}
		List classlist = dao.QueryObject(" From SystemClassInfo");
		Map map = new HashMap();
		map.put("classinfo", classlist);
		map.put("newstuid", newstuid);
		map.put("classid", id);
		System.out.println(id);
		return new ModelAndView("docuview/doc_stuinfo_input", "messages", map);
	}
}
