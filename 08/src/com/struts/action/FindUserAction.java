package com.struts.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.actions.DispatchAction;

import com.hiernate.persistence.User;
import com.hiernate.util.HibernateUtil;
import com.struts.form.UserForm;
//查找用户action这里用的是DispatchAction可以减少action的数量
public class FindUserAction extends DispatchAction {//创建FindUserAction类继承DispatchAction类
 public ActionForward finUser(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			                     HttpServletResponse rsponse) throws Exception {
		UserForm uf = (UserForm)form;                      //获得UserForm对象
	    String strUserName =request.getParameter("UserName");
	    String strPwd = request.getParameter("PWD");
      	List list = HibernateUtil.findUser(strUserName,strPwd);
		request.getSession().setAttribute("list", list);
		User user = new User();
		if(list!=null && !list.isEmpty()){                 	//判断list是否为空
			for(int i=0;i<list.size();i++){					//循环遍历集合
				user =(User) list.get(i);                  	//list.get()方法返回列表中指定位置元素
				String strUsername = user.getUserName();	//获得User对象的用户名信息
				String strUserPurview = user.getPurview();	//获得User对象的权限信息
				String strUserbranch = user.getBranch();    //获得User对象的部门信息
				uf.setUserName(strUsername);				
				uf.setUserPurview(strUserPurview);
				uf.setUserbranch(strUserbranch);
				request.getSession().setAttribute("uform", uf);   //将uf保存在session中
				request.getSession().setAttribute("username",strUsername);
				
			}
			return new ActionForward("/findMenuAction.do?method=findMenu"); //如果用户输入的用户名和密码都正确的话转发到findMenuAction
		}
		else{
			return new ActionForward("/unsuccess.jsp");            //当用户名或密码输入错误是转发到unsuccess.jsp页面
		}
		}
}
