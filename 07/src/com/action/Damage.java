package com.action;

import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionForm;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts.action.ActionForward;
import com.actionForm.DamageForm;
import org.apache.struts.action.Action;
import com.dao.OutStorageDAO;
import com.dao.QueryDAO;

public class Damage extends Action {
    private OutStorageDAO outStorageDAO = null;
    public Damage() {
        outStorageDAO = new OutStorageDAO();
    }

    public ActionForward execute(ActionMapping mapping, ActionForm form,
                                 HttpServletRequest request,
                                 HttpServletResponse response) {
        String action = request.getParameter("action");
        if (action.equals("") || action == null) {
            request.setAttribute("error", "您的操作有误！");
            return mapping.findForward("error");
        } else if (action.equals("damageaddquery")) {
            return damageadd_request(mapping, form, request, response);
        } else if (action.equals("damageadd")) {
            return damageadd(mapping, form, request, response);
        }else{
            request.setAttribute("error", "您的操作有误！");
            return mapping.findForward("error");
        }
    }
//查询部门已领用物资信息
    public ActionForward damageadd_request(ActionMapping mapping,
                                           ActionForm form,
                                           HttpServletRequest request,
                                           HttpServletResponse response) {
        int goodsid = 0;
        if (request.getParameter("id") != null) {
            goodsid = Integer.parseInt(request.getParameter("id"));
        }
        request.setAttribute("id", goodsid);
        request.setAttribute("getuse", outStorageDAO.getuseGoods_query()); //获取部门已领用物资信息
        return mapping.findForward("selGetuseGoods");
    }
    //添加部门报损信息
    public ActionForward damageadd(ActionMapping mapping,
                                           ActionForm form,
                                           HttpServletRequest request,
                                           HttpServletResponse response) {
        DamageForm getUseForm = (DamageForm) form;
        int rtn = outStorageDAO.damageAdd(getUseForm);
        if (rtn == 1) {
            return mapping.findForward("damageAddok");
        } else {
            request.setAttribute("error", "部门报损信息添加失败！");
            return mapping.findForward("error");
        }
    }
}
