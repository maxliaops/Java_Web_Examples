package com.action;

import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionForm;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts.action.void;
import com.actionForm.ParameterForm;
import com.dao.ParameterDAO;
import org.apache.struts.action.Action;

public class Parameter extends Action {
    ParameterDAO parameterDAO=null;
    public Parameter(){
        parameterDAO=new ParameterDAO();
    }
    public void execute(ActionMapping mapping, ActionForm form,
                                 HttpServletRequest request,
                                 HttpServletResponse response) {
        ParameterForm parameterForm=(ParameterForm) form;
        String str=request.getParameter("action");
        if("parameterQuery".equals(str)){
            return parameterModifyQuery(request,response);
        }else if("parameterModify".equals(str)){
            return parameterModify(request,response);
        }
        request.setAttribute("error","您的操作有误！");
        request.getRequestDispatcher("error.jsp").forward(request, response);
    }
    private void parameterModify(ActionMapping mapping, ActionForm form,
                                 HttpServletRequest request,
                                 HttpServletResponse response
){
        ParameterForm parameterForm = (ParameterForm) form;
        parameterForm.setId(parameterForm.getId());
        parameterForm.setCost(parameterForm.getCost());
        parameterForm.setValidity(parameterForm.getValidity());
        int ret = parameterDAO.update(parameterForm);
        if (ret ==0) {
            request.setAttribute("error", "参数设置信息修改失败！");
            request.getRequestDispatcher("error.jsp").forward(request, response);
        } else {
            return mapping.findForward("parametermodify");
        }

    }
    private void parameterModifyQuery(ActionMapping mapping, ActionForm form,
                                 HttpServletRequest request,
                                 HttpServletResponse response
){
        request.setAttribute("parameterModifyif",parameterDAO.query());
        return mapping.findForward("parametermodifyQuery");
    }
}
