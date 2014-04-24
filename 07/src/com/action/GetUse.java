package com.action;

import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionForm;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts.action.ActionForward;
import com.actionForm.GetUseForm;
import org.apache.struts.action.Action;
import com.dao.OutStorageDAO;

public class GetUse extends Action {
    private OutStorageDAO outStorageDAO = null;
    public GetUse() {
        outStorageDAO = new OutStorageDAO();
    }

    public ActionForward execute(ActionMapping mapping, ActionForm form,
                                 HttpServletRequest request,
                                 HttpServletResponse response) {
        String action = request.getParameter("action");
        if (action.equals("") || action == null) {
            request.setAttribute("error", "您的操作有误！");
            return mapping.findForward("error");
        } else if (action.equals("getuseaddquery")) {
            return getuseadd_request(mapping, form, request, response);
        } else if (action.equals("getuseadd")) {//loanaddquery
            return getuseadd(mapping, form, request, response);
        }
        request.setAttribute("error", "您的操作有误！");
        return mapping.findForward("error");
    }

//查询库存中的物资信息
    public ActionForward getuseadd_request(ActionMapping mapping,
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

//部门领用
    public ActionForward getuseadd(ActionMapping mapping, ActionForm form,
                                   HttpServletRequest request,
                                   HttpServletResponse response) {
        GetUseForm getUseForm = (GetUseForm) form;
        int rtn = outStorageDAO.getuseAdd(getUseForm);
        if (rtn == 1) {
            return mapping.findForward("getUseAddok");
        } else {
            request.setAttribute("error", "部门领用信息添加失败！");
            return mapping.findForward("error");
        }
    }

}
