package com.action;

import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionForm;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts.action.ActionForward;
import com.actionForm.ProviderForm;
import org.apache.struts.action.Action;
import com.dao.ProviderDAO;

public class Provider extends Action {
    ProviderDAO providerDAO=null;
    public Provider(){
        providerDAO=new ProviderDAO();
    }
    public ActionForward execute(ActionMapping mapping, ActionForm form,
                                 HttpServletRequest request,
                                 HttpServletResponse response) {
        String action=request.getParameter("action");
        if(action.equals("") || action==null){
            request.setAttribute("err","您的操作有误！");
            return mapping.findForward("error");
        }else if(action.equals("providerQuery")){
            return providerQuery(mapping,form,request,response);
        }else if(action.equals("providerdel")){
            return providerDel(mapping, form, request, response);
        }else if(action.equals("provideradd")){
            return providerAdd(mapping, form, request, response);
        }else if(action.equals("providerMQuery")){
            return providerQModify(mapping, form, request, response);
        }else if(action.equals("providerModify")){
            return providerModify(mapping, form, request, response);
        }


        return mapping.findForward("error");
    }

    public ActionForward providerQuery(ActionMapping mapping, ActionForm form,
                                 HttpServletRequest request,
                                 HttpServletResponse response) {
        String str = "";
        request.setAttribute("providerList", providerDAO.query(str));
        return mapping.findForward("providerQuery");
    }
    public ActionForward providerDel(ActionMapping mapping, ActionForm form,
                                 HttpServletRequest request,
                                 HttpServletResponse response) {


        int id=Integer.parseInt(request.getParameter("id"));
        int rtn=providerDAO.del(id);
        if(rtn==0){
            request.setAttribute("error","该供应商信息不能删除！");
            return mapping.findForward("error");
        }else{
            return mapping.findForward("providerdelok");
        }
    }
    public ActionForward providerAdd(ActionMapping mapping, ActionForm form,
                                HttpServletRequest request,
                                HttpServletResponse response) {
       ProviderForm providerForm = (ProviderForm) form;
       int rtn=providerDAO.insert(providerForm);
       if(rtn==2){
           request.setAttribute("error","该供应商信息已经存在！");
           return mapping.findForward("error");
       }else if(rtn==1){
           return mapping.findForward("provideraddok");
       }else{
           request.setAttribute("error","供应商信息添加失败！");
           return mapping.findForward("error");
       }
   }
   public ActionForward providerQModify(ActionMapping mapping,ActionForm form,HttpServletRequest request,HttpServletResponse response){
       int id=Integer.parseInt(request.getParameter("id"));
       request.setAttribute("providerList",providerDAO.query(id));
       return mapping.findForward("providerQModify");
   }
   public ActionForward providerModify(ActionMapping mapping, ActionForm form,
                                HttpServletRequest request,
                                HttpServletResponse response) {

       ProviderForm providerForm = (ProviderForm) form;
//       ChStr chStr=new ChStr();
//       providerForm.setName(chStr.toChinese(providerForm.getName()));
//       providerForm.setAddress(chStr.toChinese(providerForm.getAddress()));
//       providerForm.setBankName(chStr.toChinese(providerForm.getBankName()));
//       providerForm.setMemo(chStr.toChinese(providerForm.getMemo()));
       int rtn=providerDAO.Modify(providerForm);
       if(rtn==1){
           return mapping.findForward("providermodiok");
       }else{
           request.setAttribute("error","修改供应商信息失败！");
           return mapping.findForward("error");
       }
    }
}
