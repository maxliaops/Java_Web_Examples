package com.action;

import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionForm;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts.action.ActionForward;
import com.actionForm.UserForm;
import org.apache.struts.action.Action;
import com.dao.UserDAO;

public class User extends Action {
    private UserDAO userDAO=null;
    public User(){
        userDAO=new UserDAO();
    }
    public ActionForward execute(ActionMapping mapping, ActionForm form,
                                 HttpServletRequest request,
                                 HttpServletResponse response) {
        String action = request.getParameter("action");
        if(action.equals("userQuery")){
            return userQuery(mapping,form,request,response);
        }else if(action.equals("userdel")){
            return userDel(mapping, form, request, response);
        }else if(action.equals("useradd")){
            return userAdd(mapping, form, request, response);
        }else if(action.equals("userMQuery")){
            return userQModify(mapping, form, request, response);
        }else if(action.equals("userModify")){
            return userModify(mapping, form, request, response);
        }else if(action.equals("pwsModify")){
            return pwsModify(mapping,form,request,response);
        }else if(action.equals("login")){
            return login(mapping,form,request,response);
        }else{
            request.setAttribute("err","您的操作有误！");
            return mapping.findForward("error");
        }
    }
    //查询用户信息
    public ActionForward userQuery(ActionMapping mapping, ActionForm form,
                                 HttpServletRequest request,
                                 HttpServletResponse response) {
        String str = "";
        request.setAttribute("userList", userDAO.query(str));
        return mapping.findForward("userQuery");
    }
    //删除用户信息
    public ActionForward userDel(ActionMapping mapping, ActionForm form,
                                 HttpServletRequest request,
                                 HttpServletResponse response) {


        int id=Integer.parseInt(request.getParameter("id"));
        int rtn=userDAO.del(id);
        if(rtn==0){
            request.setAttribute("error","该用户信息不能删除！");
            return mapping.findForward("error");
        }else{
            return mapping.findForward("userdelok");
        }
    }
    //添加用户信息
    public ActionForward userAdd(ActionMapping mapping, ActionForm form,
                                HttpServletRequest request,
                                HttpServletResponse response) {
       UserForm userForm = (UserForm) form;
//       ChStr chStr=new ChStr();
//       userForm.setName(chStr.toChinese(userForm.getName()));
//       userForm.setPwd(chStr.toChinese(userForm.getPwd()));
       System.out.println("表单中获取的Instorage:"+userForm.getSetInstorage());
       int rtn=userDAO.insert(userForm);
       if(rtn==2){
           request.setAttribute("error","该用户信息已经存在！");
           return mapping.findForward("error");
       }else if(rtn==1){
           return mapping.findForward("useraddok");
       }else{
           request.setAttribute("error","用户信息添加失败！");
           return mapping.findForward("error");
       }
   }
   //修改用户权限时的查询
   public ActionForward userQModify(ActionMapping mapping,ActionForm form,HttpServletRequest request,HttpServletResponse response){
       int id=Integer.parseInt(request.getParameter("id"));
       request.setAttribute("userList",userDAO.query(id));
       return mapping.findForward("userQModify");
   }
   //修改用户密码
   public ActionForward pwsModify(ActionMapping mapping,ActionForm form,HttpServletRequest request,HttpServletResponse response){
       UserForm userForm = (UserForm) form;
//       ChStr chStr=new ChStr();
//       userForm.setName(chStr.toChinese(userForm.getName()));
//       userForm.setPwd(chStr.toChinese(userForm.getPwd()));
       userForm.setName(userForm.getName());
       userForm.setPwd(userForm.getPwd());
       int flag=1;    //值为1时修改密码
       int rtn=userDAO.Modify(userForm,flag);
       if(rtn==1){
           return mapping.findForward("usermodipwdok");
       }else{
           request.setAttribute("error","用户密码修改失败！");
           return mapping.findForward("error");
       }
   }
   //修改用户信息
   public ActionForward userModify(ActionMapping mapping, ActionForm form,
                                HttpServletRequest request,
                                HttpServletResponse response) {

       UserForm userForm = (UserForm) form;
      // userForm.setName(userForm.getName());  如果此句取消注释，不要忘记修改文档（wgh）最后需要删除该注释
//       ChStr chStr=new ChStr();
//       userForm.setName(chStr.toChinese(userForm.getName()));
       int flag=2;  // 值为2时修改权限
       int rtn=userDAO.Modify(userForm,flag);
       if(rtn==1){
           return mapping.findForward("usermodiok");
       }else{
           request.setAttribute("error","修改用户权限信息失败！");
           return mapping.findForward("error");
       }
    }
    //用户登录
    public ActionForward login(ActionMapping mapping, ActionForm form,
                                 HttpServletRequest request,
                                 HttpServletResponse response) {

        UserForm userForm = (UserForm) form;
        String rtn=userDAO.login(userForm,request);
        if(rtn.equals("ok")){
            return mapping.findForward("loginok");
        }else{
            request.setAttribute("error",rtn);
            return mapping.findForward("error");
        }
    }

}
