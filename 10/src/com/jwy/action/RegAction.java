package com.jwy.action;

import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import com.jwy.dao.ISpecialtyDao;
import com.jwy.dao.IUserLoginDao;
import com.jwy.dto.Specialty;
import com.jwy.dto.UserLogin;
public class RegAction extends Action {
	private IUserLoginDao userLoginDao;
	private ISpecialtyDao specialtyDao;
	/** 
	 * @param specialtyDao the specialtyDao to set
	 */
	public void setSpecialtyDao(ISpecialtyDao specialtyDao) {
		this.specialtyDao = specialtyDao;
	}
	/**
	 * @param userLoginDao the userLoginDao to set
	 */
	public void setUserLoginDao(IUserLoginDao userLoginDao) {
		this.userLoginDao = userLoginDao;
	}
	/** 
	 * Method execute
	 * @param mapping 
	 * @param form
	 * @param request
	 * @param response 
	 * @return ActionForward  
	 */ 
	public ActionForward execute(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		UserLogin userLogin = new UserLogin();
		userLogin.setType("2");	                         //设置用户类型为学生  
		userLogin.setLoginName(request.getParameter("loginName"));
		userLogin.setPwd(request.getParameter("pwd")); 
		userLogin.setMail(request.getParameter("mail"));
		if(!userLoginDao.findByLoginName(userLogin.getLoginName())){
			System.out.println("用户名不存在可以注册");
			Integer id = userLoginDao.insert(userLogin); //返回自动生成的主键
			request.getSession().setAttribute("id",id);
			request.getSession().setAttribute("loginName", userLogin.getLoginName());
			//进入到填写基本信息页面 
			List<Specialty> list = specialtyDao.findStuByAll();
			request.setAttribute("list", list); 
			return mapping.findForward("addStuInfo");
		}else{
			request.setAttribute("error", "用户名已经存在，不可以注册");
			//返回到注册页面 
			return mapping.findForward("reg"); 
		}
	}
}