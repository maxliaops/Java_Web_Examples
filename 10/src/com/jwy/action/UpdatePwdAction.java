package com.jwy.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import com.jwy.dao.IUserLoginDao;

public class UpdatePwdAction extends Action {
	
	private IUserLoginDao userLoginDao;
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
		String loginName = (String) request.getSession().getAttribute("loginName");
		String pwd = request.getParameter("pwd");
		String pwd1 = request.getParameter("pwd1");
		String pwd2 = request.getParameter("pwd2");
		String mail = request.getParameter("mail");
		Integer id = userLoginDao.findByNPM(loginName, pwd, mail);
		if(id==-1||!pwd1.equals(pwd2)){
			System.out.println("输入的信息不正确，不能修改密码");
			request.setAttribute("error", "输入的信息不正确，不能修改密码");
		}else{
			userLoginDao.updatePwd(id, pwd1);
			System.out.println("密码修改成功");
			request.setAttribute("error", "密码修改成功！");
		}
		if(request.getParameter("type").equals("m")){
			System.out.println("m");
			return mapping.findForward("updatePwd");	
		}else{ 
			System.out.println("u");
			return mapping.findForward("stuUpdatePwd");
		}
	}
}