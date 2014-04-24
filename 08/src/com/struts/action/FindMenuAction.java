package com.struts.action;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.actions.DispatchAction;
import com.hiernate.persistence.Menu;
import com.hiernate.util.HibernateUtil;
//查找菜单action
public class FindMenuAction extends DispatchAction {
   public ActionForward findMenu(ActionMapping arg0, ActionForm arg1, HttpServletRequest arg2, HttpServletResponse arg3) throws Exception {
		List list = HibernateUtil.findMenu(0);         //由于主菜单的menuid为０，绑定参数０查找主菜单
		List menuIdlist = null;
		if(!list.isEmpty() && list.size()>0){          
			for(int i= 0;i<list.size();i++){
				Menu menu =(Menu) list.get(i);
				menuIdlist = HibernateUtil.findMenu((menu.getId()).intValue()); //查找子菜单
			    arg2.getSession().setAttribute("menuNameid"+i+"", menuIdlist);  //将字菜单集合保存在session中
			 }
		}
		arg2.getSession().setAttribute("menulist", list);                       //将主菜单集合保存在session中
		return new ActionForward("/default.jsp");                               //转发致default.jsp页面
	}
 }
