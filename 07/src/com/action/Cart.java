package com.action;

import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionForm;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts.action.ActionForward;
import com.actionForm.StockGoodsForm;
import org.apache.struts.action.Action;
import com.dao.InstorageDAO;

public class Cart extends Action {
    public ActionForward execute(ActionMapping mapping, ActionForm form,
                                 HttpServletRequest request,
                                 HttpServletResponse response) {
        String action = request.getParameter("action");
        System.out.println("Action:" + action);
        if (action.equals("add")) { //单击“采购”按钮时执行的操作
            return add(mapping, form, request, response);
        } else if (action.equals("remove")) {
            return remove(mapping, form, request, response);
        } else if(action.equals("clear")){
            return clear(mapping, form, request, response);
        }else {
            request.setAttribute("err", "您的操作有误！");
            return mapping.findForward("error");
        }
    }
//添加指定物资信息
    public ActionForward add(ActionMapping mapping, ActionForm form,
                             HttpServletRequest request,
                             HttpServletResponse response) {
        InstorageDAO instorageDAO = new InstorageDAO();
        StockGoodsForm stockGoodsForm = (StockGoodsForm) form;
        instorageDAO.cart_add(stockGoodsForm, request);
        return mapping.findForward("add");
    }
    //移去指定物资信息
    public ActionForward remove(ActionMapping mapping, ActionForm form,
                             HttpServletRequest request,
                             HttpServletResponse response) {
        InstorageDAO instorageDAO = new InstorageDAO();
        int id=Integer.parseInt(request.getParameter("removeid"));
        instorageDAO.cart_remove(id, request);
        return mapping.findForward("add");
    }
    //清空保存物资信息的Session
    public ActionForward clear(ActionMapping mapping, ActionForm form,
                             HttpServletRequest request,
                             HttpServletResponse response) {
        InstorageDAO instorageDAO = new InstorageDAO();
        instorageDAO.cart_clear(request);
        return mapping.findForward("add");
    }
}
