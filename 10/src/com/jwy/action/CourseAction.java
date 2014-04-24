package com.jwy.action;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.DynaActionForm;
import org.apache.struts.actions.DispatchAction;
import com.jwy.dao.ICourseDao;
import com.jwy.dao.ISpecialtyDao;
import com.jwy.dto.Course;
import com.jwy.dto.Specialty;

/**
 * 
 * @author Jingweiyu 
 */
/**
 * 
 * @author Jingweiyu  
 */ 
public class CourseAction extends DispatchAction {
	private ISpecialtyDao specialtyDao;
	private ICourseDao courseDao; 
	/**
	 * @param specialtyDao the specialtyDao to set
	 */
	public void setSpecialtyDao(ISpecialtyDao specialtyDao) {
		this.specialtyDao = specialtyDao;
	}
	/**
	 * @param courseDao the courseDao to set
	 */
	public void setCourseDao(ICourseDao courseDao) {
		this.courseDao = courseDao;
	}
	public ActionForward insert(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		DynaActionForm courseForm = (DynaActionForm) form;
		Course course = new Course();
		course.setName(courseForm.getString("name"));
		course.setSchooltime(courseForm.getString("schooltime"));
		course.setAddr(courseForm.getString("addr")); 
		course.setCredit((Short)courseForm.get("credit"));
		course.setCourseInfo(courseForm.getString("courseInfo"));
		course.setTeacherName(courseForm.getString("teacherName")); 
		course.setTeacherInfo(courseForm.getString("teacherInfo"));
		course.setIsFinish(true);	//是否可以选课，默认为可以
		course.setSpecialtyId((Integer)courseForm.get("specialtyId"));
		courseDao.insert(course);
		return findBySearch(mapping, courseForm, request, response);
	}
	public ActionForward updateIsFinish(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		Integer id = Integer.valueOf(request.getParameter("id")); 
		courseDao.updateIsFinish(id);
		return courseInfo(mapping, form, request, response);
	}
	public ActionForward findBySearch(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		List<Specialty> sList = specialtyDao.findByAll();
		
		Map<String,String> map = new HashMap<String,String>();
		if(request.getParameter("specialtyId")!=null&&!request.getParameter("specialtyId").equals("-1")){
			map.put("specialtyId", request.getParameter("specialtyId"));
		}
		if(request.getParameter("name")!=null&&!request.getParameter("name").equals("")){
			map.put("name", request.getParameter("name"));
		}
		if(request.getParameter("teacherName")!=null&&!request.getParameter("teacherName").equals("")){
			map.put("teacherName", request.getParameter("teacherName"));
		}
		
		List<Object> clist = courseDao.findBySearch(map);
        
		request.setAttribute("sList", sList);
		request.setAttribute("cList", clist); 
		return mapping.findForward("showCourse");
	}
	
	/**
	 * 进入添加新课程页面 
	 * @param mapping
	 * @param form
	 * @param request
	 * @param response 
	 * @return 
	 */    
	public ActionForward showInsert(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) { 
		List<Specialty> list = specialtyDao.findByAll();
		request.setAttribute("list", list);
		return mapping.findForward("addCourse");  
	}   
	public ActionForward courseInfo(ActionMapping mapping, ActionForm form,HttpServletRequest request, HttpServletResponse response) {
		Integer id = Integer.valueOf(request.getParameter("id"));
		Course course = courseDao.findByID(id);  
		Specialty specialty = specialtyDao.findById(course.getSpecialtyId());
		request.setAttribute("course", course); 
		request.setAttribute("specialty", specialty);
		return mapping.findForward("courseInfo"); 
	}
}
