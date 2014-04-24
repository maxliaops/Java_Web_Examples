package com.action;

import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionForm;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts.action.ActionForward;
import com.actionForm.LoanForm;
import org.apache.struts.action.Action;
import com.dao.OutStorageDAO;
import javax.servlet.http.HttpSession;
import com.dao.InstorageDAO;

public class Loan extends Action {
    private OutStorageDAO outStorageDAO = null;
    public Loan() {
        outStorageDAO = new OutStorageDAO();
    }

    public ActionForward execute(ActionMapping mapping, ActionForm form,
                                 HttpServletRequest request,
                                 HttpServletResponse response) {
        String action = request.getParameter("action");
        if (action.equals("") || action == null) {
            request.setAttribute("error", "您的操作有误！");
            return mapping.findForward("error");
        } else if (action.equals("loanaddquery")) {
            return loanadd_request(mapping, form, request, response);
        } else if (action.equals("loanadd")) {
            return loanadd(mapping, form, request, response);
        }else if(action.equals("approveloan")){
            return approveloan(mapping, form, request, response);
        }else if(action.equals("backloan")){
            return backloan(mapping, form, request, response);
        }else{
            request.setAttribute("error", "您的操作有误！");
            return mapping.findForward("error");
        }
    }

//查询库存中的物资信息
    public ActionForward loanadd_request(ActionMapping mapping,
                                           ActionForm form,
                                           HttpServletRequest request,
                                           HttpServletResponse response) {
        int goodsid = 0;
        if (request.getParameter("id") != null) {
            goodsid = Integer.parseInt(request.getParameter("id"));
        }
        request.setAttribute("id", goodsid);
        request.setAttribute("GoodsStorage", outStorageDAO.storage_query()); //获取物资信息
        return mapping.findForward("selStorageGoods");
    }

//物资借出
    public ActionForward loanadd(ActionMapping mapping, ActionForm form,
                                   HttpServletRequest request,
                                   HttpServletResponse response) {
        LoanForm loanForm = (LoanForm) form;
        int rtn = outStorageDAO.loanAdd(loanForm);
        if (rtn == 1) {
            return mapping.findForward("loanAddok");
        } else {
            request.setAttribute("error", "物资借出信息添加失败！");
            return mapping.findForward("error");
        }
    }
//借出审核
   public ActionForward approveloan(ActionMapping mapping,ActionForm form,HttpServletRequest request,HttpServletResponse response){
       HttpSession httpsession = request.getSession();
       if(httpsession.getAttribute("username")==null){
           request.setAttribute("error","请先登录！");
           return mapping.findForward("error");
       }
       int id=Integer.valueOf(request.getParameter("id"));
       int rtn=outStorageDAO.approveloanAdd(id,request);
       if(rtn==1){
           return mapping.findForward("loanApproveAddok");
       }else if(rtn==2){
           request.setAttribute("error","库存数量不足，不能完成借出审核！");
           return mapping.findForward("error");
       }else{
           request.setAttribute("error","借出审核操作失败！");
           return mapping.findForward("error");
        }
   }
   //借出归还
      public ActionForward backloan(ActionMapping mapping,ActionForm form,HttpServletRequest request,HttpServletResponse response){
          HttpSession httpsession = request.getSession();
          if(httpsession.getAttribute("username")==null){
              request.setAttribute("error","请先登录！");
              return mapping.findForward("error");
          }
          int id=Integer.valueOf(request.getParameter("id"));
          InstorageDAO inStorageDAO=new InstorageDAO();
          int rtn=inStorageDAO.backloan(id,request);
          if(rtn==1){
              return mapping.findForward("loanbackAddok");
          }else{
              request.setAttribute("error","借出归还操作失败！");
              return mapping.findForward("error");
           }
   }
}
