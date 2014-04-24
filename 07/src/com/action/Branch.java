package com.action;

import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionForm;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts.action.ActionForward;
import com.actionForm.BranchForm;
import org.apache.struts.action.Action;
import com.dao.BranchDAO;

public class Branch extends Action {
    BranchDAO branchDAO=null;
    public Branch() {
        branchDAO = new BranchDAO();
    }
    public ActionForward execute(ActionMapping mapping, ActionForm form,
                                 HttpServletRequest request,
                                 HttpServletResponse response) {
        BranchForm branchForm = (BranchForm) form;
            String action=request.getParameter("action");
            if(action.equals("") || action==null){
                request.setAttribute("err","您的操作有误！");
                return mapping.findForward("error");
            }else if(action.equals("branchQuery")){
                return branchQuery(mapping,form,request,response);
            }else if(action.equals("branchdel")){
                return branchDel(mapping, form, request, response);
            }else if(action.equals("branchadd")){
                return branchAdd(mapping, form, request, response);
            }
            return mapping.findForward("error");
        }

        public ActionForward branchQuery(ActionMapping mapping, ActionForm form,
                                     HttpServletRequest request,
                                     HttpServletResponse response) {
            String str = "";
            request.setAttribute("branchList", branchDAO.query(str));
            return mapping.findForward("branchQuery");
        }
        public ActionForward branchDel(ActionMapping mapping, ActionForm form,
                                     HttpServletRequest request,
                                     HttpServletResponse response) {
            int id=Integer.parseInt(request.getParameter("id"));
            int rtn=branchDAO.del(id);
            if(rtn==0){
                request.setAttribute("error","该部门信息不能删除！");
                return mapping.findForward("error");
            }else{
                return mapping.findForward("branchdelok");
            }
        }
        public ActionForward branchAdd(ActionMapping mapping, ActionForm form,
                                    HttpServletRequest request,
                                    HttpServletResponse response) {
           BranchForm branchForm = (BranchForm) form;
           int rtn=branchDAO.insert(branchForm);
           if(rtn==2){
               request.setAttribute("error","该部门信息已经存在！");
               return mapping.findForward("error");
           }else if(rtn==1){
               return mapping.findForward("branchaddok");
           }else{
               request.setAttribute("error","部门信息添加失败！");
               return mapping.findForward("error");
           }
       }
}
