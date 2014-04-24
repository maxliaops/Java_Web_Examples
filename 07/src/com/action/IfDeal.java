package com.action;

import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionForm;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts.action.ActionForward;
import com.actionForm.IfForm;
import org.apache.struts.action.Action;
import com.dao.QueryDAO;


public class IfDeal extends Action {
    QueryDAO queryDAO = null;
    public IfDeal() {
        queryDAO = new QueryDAO();
    }

    public ActionForward execute(ActionMapping mapping, ActionForm form,
                                 HttpServletRequest request,
                                 HttpServletResponse response) {

        String action = request.getParameter("action");
        if (action.equals("stockQuery")) {
            return stockIf(mapping, form, request, response);
        } else if (action.equals("stockDetail")) {
            return stockDetail(mapping, form, request, response);
        } else if (action.equals("inStockQuery")) {
            return inStockIf(mapping, form, request, response);
        } else if (action.equals("inStorageSQuery")) {
            return inStorageSQuery(mapping, form, request, response);
        } else if (action.equals("loanApproveQuery")) {
            return loanApproveQuery(mapping, form, request, response);
        } else if (action.equals("loanBackQuery")) {
            return loanBackQuery(mapping, form, request, response);
        } else if (action.equals("loanQuery")) {
            return loanQuery(mapping, form, request, response);
        } else if (action.equals("loanDetail")) {
            return loanDetail(mapping, form, request, response);
        } else if (action.equals("damageQuery")) {
            return damageQuery(mapping, form, request, response);
        } else if (action.equals("getuseQuery")) {
            return getuseQuery(mapping, form, request, response);
        } else if (action.equals("getuseTotal")) {
            return getuseTotal(mapping, form, request, response);
        } else if (action.equals("damageTotal")) {
            return damageTotal(mapping, form, request, response);
        } else if (action.equals("branchTotal")) {
            return branchTotal(mapping, form, request, response);
        } else {
            return mapping.findForward("error");
        }
    }

    public ActionForward stockIf(ActionMapping mapping, ActionForm form,
                                 HttpServletRequest request,
                                 HttpServletResponse response) {
        IfForm ifForm = (IfForm) form;
        // StockMainViewForm stockMVF = new StockMainViewForm();
        String tablename = "StockMainViewForm";
        request.setAttribute("stockQueryM",
                             queryDAO.stockQuery(ifForm, tablename, 3));
        return mapping.findForward("stockQuery");
    }

//采购详细信息查询
    public ActionForward stockDetail(ActionMapping mapping, ActionForm form,
                                     HttpServletRequest request,
                                     HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        request.setAttribute("stockDetail", queryDAO.stockDetail(id));
        return mapping.findForward("stockDetail");
    }

    //“入库审核”时调用的查询
    public ActionForward inStockIf(ActionMapping mapping, ActionForm form,
                                   HttpServletRequest request,
                                   HttpServletResponse response) {
        IfForm ifForm = (IfForm) form;
        String tablename = "StockMainViewForm";
        request.setAttribute("stockQueryM",
                             queryDAO.stockQuery(ifForm, tablename, 0));
        return mapping.findForward("inStockQuery");
    }

    //“入库查询”时调用的查询
    public ActionForward inStorageSQuery(ActionMapping mapping, ActionForm form,
                                         HttpServletRequest request,
                                         HttpServletResponse response) {
        IfForm ifForm = (IfForm) form;
        String tablename = "InStorageForm";
        request.setAttribute("inStorageForm",
                             queryDAO.stockQuery(ifForm, tablename, 3));
        return mapping.findForward("inStorageSQuery");
    }

    //“借出审核”时调用的查询
    public ActionForward loanApproveQuery(ActionMapping mapping,
                                          ActionForm form,
                                          HttpServletRequest request,
                                          HttpServletResponse response) {
        IfForm ifForm = (IfForm) form;
        String tablename = "LoanForm";
        request.setAttribute("loanApproveQuery",
                             queryDAO.stockQuery(ifForm, tablename, 0));
        return mapping.findForward("loanApproveQuery");
    }

    //“借出归还”时调用的查询
    public ActionForward loanBackQuery(ActionMapping mapping,
                                       ActionForm form,
                                       HttpServletRequest request,
                                       HttpServletResponse response) {
        IfForm ifForm = (IfForm) form;
        String tablename = "LoanForm";
        request.setAttribute("loanBackQuery",
                             queryDAO.stockQuery(ifForm, tablename, 1));
        return mapping.findForward("loanBackQuery");
    }

    //借出查询
    public ActionForward loanQuery(ActionMapping mapping,
                                   ActionForm form,
                                   HttpServletRequest request,
                                   HttpServletResponse response) {
        IfForm ifForm = (IfForm) form;
        String tablename = "LoanForm";
        request.setAttribute("loanQuery",
                             queryDAO.stockQuery(ifForm, tablename, 3));
        return mapping.findForward("loanQuery");
    }

    //借出详细信息查询
    public ActionForward loanDetail(ActionMapping mapping, ActionForm form,
                                    HttpServletRequest request,
                                    HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        request.setAttribute("loanDetail", queryDAO.loanDetail(id));
        return mapping.findForward("loanDetail");
    }

    //部门报损查询
    public ActionForward damageQuery(ActionMapping mapping, ActionForm form,
                                     HttpServletRequest request,
                                     HttpServletResponse response) {
        IfForm ifForm = (IfForm) form;
        request.setAttribute("damageQuery",
                             queryDAO.damageQuery(ifForm));
        return mapping.findForward("damageQuery");
    }

    //部门领用查询
    public ActionForward getuseQuery(ActionMapping mapping, ActionForm form,
                                     HttpServletRequest request,
                                     HttpServletResponse response) {
        IfForm ifForm = (IfForm) form;
        request.setAttribute("getuseQuery",
                             queryDAO.getuseQuery(ifForm));
        return mapping.findForward("getuseQuery");
    }

    //部门领用汇总查询
    public ActionForward getuseTotal(ActionMapping mapping, ActionForm form,
                                     HttpServletRequest request,
                                     HttpServletResponse response) {
        IfForm ifForm = (IfForm) form;
        request.setAttribute("getuseTotal",
                             queryDAO.getusedamageTotal(ifForm, "GetUseForm",
                "number"));
        return mapping.findForward("getuseTotal");
    }

    //部门报损汇总查询
    public ActionForward damageTotal(ActionMapping mapping, ActionForm form,
                                     HttpServletRequest request,
                                     HttpServletResponse response) {
        IfForm ifForm = (IfForm) form;
        request.setAttribute("damageTotal",
                             queryDAO.getusedamageTotal(ifForm, "DamageForm",
                "damagenum"));
        return mapping.findForward("damageTotal");
    }

    //部门汇总查询
    public ActionForward branchTotal(ActionMapping mapping, ActionForm form,
                                     HttpServletRequest request,
                                     HttpServletResponse response) {
        IfForm ifForm = (IfForm) form;
        request.setAttribute("sDate", ifForm.getSdate());
        request.setAttribute("eDate", ifForm.getEdate());
        request.setAttribute("branchTotal",
                             queryDAO.branchTotal(ifForm));
        return mapping.findForward("branchTotal");
    }
}
